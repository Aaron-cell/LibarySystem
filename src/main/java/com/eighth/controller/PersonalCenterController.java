package com.eighth.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eighth.mapper.UserMapper;
import com.eighth.pojo.Books;
import com.eighth.pojo.Person;
import com.eighth.pojo.Records;
import com.eighth.pojo.User;
import com.eighth.service.impl.BooksServiceImpl;
import com.eighth.service.impl.PersonalCenterServiceImpl;
import com.eighth.service.impl.RecordsServiceImpl;
import com.eighth.service.impl.UserServiceImpl;
import com.eighth.util.DateCalculate;
import com.eighth.util.PersonalCenter;
import com.eighth.util.StringUtil;
@Controller
public class PersonalCenterController {
	@Autowired
	PersonalCenterServiceImpl personalCenterServiceImpl;
	@Autowired
	BooksServiceImpl booksServiceImpl;
	@Autowired
	RecordsServiceImpl recordsServiceImpl;
	@Autowired
	UserServiceImpl userServiceImpl;
	//�����������
	@RequestMapping("/fore/personalCenter")
	public String personalCenter(HttpServletRequest request,HttpServletResponse response) {
		HttpSession session=request.getSession();
		User user1=(User) session.getAttribute("person");
		//����û��Ƿ���¼ ֱ�ӽ���������
		if(user1==null) {
			request.setAttribute("error", "��δ��¼�����ȵ�¼");
			request.setAttribute("page", "personalCenter");
			return "fore/login";
		}else {
			List<PersonalCenter> list1=new ArrayList<PersonalCenter>();
			//��ѯ�û����ļ�¼
			List<Records> list=personalCenterServiceImpl.selectByUsername(user1.getUsername());
			for(int i=0;i<list.size();i++) {
				Books book=booksServiceImpl.selectByPrimaryKey(list.get(i).getBid());
				PersonalCenter personalCenter=new PersonalCenter(list.get(i).getRid(),book.getName(),book.getAuthor(),book.getPublish()
						,book.getPrice(),list.get(i).getStatus(),list.get(i).getBorrowtime(),list.get(i).getReturntime());
				list1.add(personalCenter);
				//System.out.println(list.get(i).getStatus());
			}
			request.setAttribute("list1", list1);
		}
		return "fore/personalCenter";
	}
	
	//���û���¼��������
	@RequestMapping("/fore/borrowBook")
	public String borrowBook(HttpServletRequest request,HttpServletResponse response)throws Exception {
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("person");
		int bid=Integer.parseInt(request.getParameter("bid"));
		String result = null;
		//System.out.println("�ѽ���"+bid);
		//1.�ж��鼮�Ƿ�ɽ���
		Books book=booksServiceImpl.selectByPrimaryKey(bid);
		if(0==book.getBorrow()) {
			//2�����Ƿ���ʣ����
			if(book.getResidue()>0) {
				//3���û��Ƿ񻹿ɼ�������
				Person person=personalCenterServiceImpl.selectByPrimaryKey(user.getUsername());
				if(person.getNum()<person.getMaxnum()) {
					//���ĳɹ�������
					//1.�޸�book��ʣ����
					Books book1=new Books();
					book1.setBid(bid);
					book1.setResidue(book.getResidue()-1);
					booksServiceImpl.updateByPrimaryKeySelective(book1);
					//2.�޸�person��
					Person person1=new Person();
					person1.setUsername(person.getUsername());
					person1.setNum(person.getNum()+1);
					person1.setTotal(person.getTotal()+1);
					//����û��״ν��� ���ݿ�records�ֶ�ֵΪnull
					if(person.getRecords()==null) {
						person1.setRecords(String.valueOf(bid));
					}else {
						person1.setRecords(person.getRecords()+","+bid);
					}
					
					personalCenterServiceImpl.updateByPrimaryKeySelective(person1);
					//3.�޸�record��
					/*
					 *��ʱ���Ϊtimestamp 
					 */
					Records record=new Records();
					record.setUsername(user.getUsername());
					record.setBid(bid);
					record.setName(book.getName());
					Date date=new Date();
					Date date1=DateCalculate.addDate(date, 30);
				    record.setBorrowtime(date);
				    record.setReturntime(date1);
				    record.setStatus(0);
				    recordsServiceImpl.insert(record);
				    result="���ĳɹ���";
				}else {
					result="�����鼮�Ѵ����ޣ���黹���ڽ���";
				}
			}else {
				result="�鱻����ˣ�����";
			}
		}else {
			result="�����޷����ģ�";
		}
		response.setContentType("text/html;charset=UTF-8");
		//��ǰ�˷�������
		response.getWriter().print(result);
		return null;
	}
	
	/*
	 * ���� ���Ľ���״̬
	 */
	@RequestMapping("fore/changeStatus")
	public String changeStatus(HttpServletRequest request,Records records) throws Exception {
		Records records1=recordsServiceImpl.selectByPrimaryKey(records.getRid());
		Date date=records1.getReturntime();
		Date date1=DateCalculate.addDate(date, 30);
		records.setReturntime(date1);
		records.setStatus(1);
		recordsServiceImpl.updateByPrimaryKeySelective(records);	
		return "forward:/fore/personalCenter";
	}
	
	//ע�� �Ƴ�session��person
	@RequestMapping("/fore/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session=request.getSession();
		session.removeAttribute("person");
		//��ת��ForeController��home����
		return "forward:/fore/home";
	}
	
	//��ת���޸ĸ�����Ϣҳ��
	@RequestMapping("/fore/information")
	public String information(HttpServletRequest request) {
		return "fore/personalInformation";
		
	}
	//�����޸�����
	@RequestMapping("/fore/updateInformation")
	public String updateInformation(HttpServletRequest request) {
		HttpSession session=request.getSession();
		User person=(User)session.getAttribute("person");
		//��ȡ����
		String name=request.getParameter("name");
		String sex=request.getParameter("sex");
		String phone=request.getParameter("phone");	
		if(person!=null) {
			 //�жϵ绰�Ƿ�ȫ������
			if(StringUtil.IsNumeric(phone)) {
				person.setName(name);
				person.setSex(sex);
				person.setPhone(phone);
				int count=userServiceImpl.updateUser(person);
				if(count==1) {
					session.setAttribute("person", person);
					request.setAttribute("hint", "����ɹ�");
				}else {
					request.setAttribute("hint", "����ʧ��");
				}
			}else {
				request.setAttribute("hint", "�绰��ʽ����");
			}
		}else {
			request.setAttribute("hint", "��¼����û��¼��������");
		}
		return "fore/personalInformation";
	}
	
	//��ת���޸�����ҳ��
	@RequestMapping("/fore/repassword")
	public String Repassword() {
		return "fore/personalRepassword";
	}
	
	/*
	 * �޸�����
	 */
	@RequestMapping("/fore/updatePassword")
	public String updatePassword(HttpServletRequest request) {
		HttpSession session=request.getSession();
		User person=(User) session.getAttribute("person");
		String npassword=request.getParameter("npassword");
		String rpassword=request.getParameter("rpassword");
		if(person!=null) {
			//��֤���������Ƿ���ͬ
			if(npassword.equals(rpassword)){
				person.setPassword(npassword);
				int count=userServiceImpl.updateUser(person);
				if(count==1) {
					session.setAttribute("person", person);
					request.setAttribute("hint", "����ɹ�");
				}else {
					request.setAttribute("hint", "����ʧ��");
				}
			}else {
				request.setAttribute("hint", "�����������벻һ��");
			}
		}else {
			request.setAttribute("hint", "�Ͳ����㵯��¼�򣡿���զ��");
		}
		return "fore/personalRepassword";
	}
	

}
