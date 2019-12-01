package com.eighth.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Action;

import com.eighth.pojo.Books;
import com.eighth.pojo.Person;
import com.eighth.pojo.Records;
import com.eighth.pojo.Sort;
import com.eighth.service.impl.PersonServiceImpl;
import com.eighth.service.impl.RecordsServiceImpl;
import com.eighth.util.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.omg.CORBA.INTERNAL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.eighth.pojo.User;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class RecordManageController {

	@Autowired
	RecordsServiceImpl recordsServiceImpl;
	@Autowired 
	PersonServiceImpl personServiceImpl;
	// ��ҳ����
	@RequestMapping("/recordCommon")
	public String common(HttpServletRequest request, Page page) {

		HttpSession session = request.getSession();

		// ���б�����ִ��sql���֮ǰ
		PageHelper.offsetPage(page.getStart(), page.getCount());
		List<Records> recordsList = null;
		if ("searchRecord".equals(session.getAttribute("operation"))) {
			int status = (Integer) session.getAttribute("status");
			recordsList = recordsServiceImpl.searchByRecordStatus(status);
			session.setAttribute("flag", status);    // ���û�ѡ�����������
			session.removeAttribute("operation");
		} else {
			recordsList = recordsServiceImpl.showAllRecord();
		}
		//recordsList = recordsServiceImpl.showAllRecord();

		int total = (int) new PageInfo<>(recordsList).getTotal();
		page.setTotal(total);
		page.caculateLast(total);
		page.setCurrentPage(page.getStart()/page.getCount()+1);
		page.setLastPage(page.getLast()/page.getCount()+1);

		request.setAttribute("recordsList", recordsList);

		return "admin/Borrow_Manager";
	}

	// ��ʾ���н��ļ�¼�����ͼ��軹��
	@RequestMapping("/Record_Manage")
	public String showAllRecord(HttpServletRequest request) {

		return "forward:/recordCommon?start=0";
	}

	// ��ѯָ������״̬�ļ�¼(�������б���ָ����״̬����)
	@RequestMapping("searchRecord")
	public String searchRecord(HttpServletRequest request) {

		HttpSession session = request.getSession();
		int status = Integer.valueOf(request.getParameter("status"));
		session.setAttribute("status", status);

		// ��Ǳ�����
		request.getSession().setAttribute("operation", "searchRecord");

		return "forward:/recordCommon?start=0";
	}

	// ������id���Ľ���״̬ �Լ�person����ѽ�������num
	@RequestMapping("setRecordStatus")
	public String setRecordStatus(HttpServletRequest request, Records record) {
		//����rid��ѯ������¼
		Records records=recordsServiceImpl.selectByPrimaryKey(record.getRid());
		if (record.getStatus() == 0) {
			record.setStatus(1);
		} else {
			//��person����num�ֶμ�һ
			record.setStatus(4);
			Person person=personServiceImpl.selectByPrimaryKey(records.getUsername());
			person.setNum(person.getNum()-1);
			personServiceImpl.updateByPrimaryKey(person);
		}
		// ���½���״̬
		recordsServiceImpl.updateByRid(record);

		return "forward:/recordCommon?start=0";
	}

}
