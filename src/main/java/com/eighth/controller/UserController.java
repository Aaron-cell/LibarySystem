package com.eighth.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.eighth.pojo.User;
import com.eighth.service.impl.UserServiceImpl;
import com.eighth.util.Page;
import com.eighth.util.StringUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class UserController {
	@Autowired UserServiceImpl userServiceImpl;
	/*
	 *  �˷���ͬ��
	 * ͨ���ж�·����page��ִֵ�в�ͬ�Ĳ���
	 * @RequestMapping("/{page}") 
	 * public String showPage(@PathVariable String page)
	 * { String view="admin/"+page; return view ; }
	 */
	/*
	 * ��ת��ѧ������
	 * ����ǰ�˷�������
	 * �๦�ܲ�ѯ
	 * ��ѯ�û� �û������������û�״̬�Ĳ�ѯ
	 */

	@RequestMapping("/Student_Manager")
	public String StudentManager(HttpServletRequest request) {
		HttpSession session=request.getSession();
			//�����в�ѯҪ������ж�
			User search=new User();
			search.setType(1);
			String information=request.getParameter("information");
			String flag=request.getParameter("flag");
			if(flag!=null && information!=null){
				//�ж�������
				if(flag.equals("2")) {
					//��ѯ����ѧ�� ɶҲ����
				}else if(flag.equals("0")) {
					search.setFlag(0);
				}else if(flag.equals("1")){
					search.setFlag(1);
				}
				//�ж�informatiion
				if(information.equals("")) {
					//��ѯ����ѧ�� ɶҲ����
				}else {
					search.setUsername(information);
				}
			}
			session.setAttribute("search", search);
			return "forward:/common?start=0";
		
	}
	/*
	 * �ۺϴ�����ַ�ҳ����
	 */
	@RequestMapping("/common")
	public String common(HttpServletRequest request,Page page) {
		HttpSession session=request.getSession();
		User search=(User) session.getAttribute("search");
		PageHelper.offsetPage(page.getStart(),page.getCount());
		List<User> list=userServiceImpl.selectByMoreCondition(search);
		int total = (int) new PageInfo<>(list).getTotal();
        page.setTotal(total);
        page.caculateLast(total);
        page.setCurrentPage(page.getStart()/page.getCount()+1);
        page.setLastPage(page.getLast()/page.getCount()+1);
		request.setAttribute("list", list);
		request.setAttribute("search", search);
		return "admin/Student_Manager";
	}
	
	/*
	 * ԭ��ͬ��
	 */
	@RequestMapping("/Admin_Manager")
	public ModelAndView AdminManager(HttpServletRequest request,Page page) {
		ModelAndView mav=new ModelAndView();
			User user1=new User();
			user1.setType(0);
			PageHelper.offsetPage(page.getStart(),page.getCount());
			 List<User> list=userServiceImpl.selectByMoreCondition(user1);
			int total = (int) new PageInfo<>(list).getTotal();
	        page.setTotal(total);
	        page.caculateLast(total);
	        page.setCurrentPage(page.getStart()/page.getCount()+1);
	        page.setLastPage(page.getLast()/page.getCount()+1);
			mav.addObject("list",list);
			mav.setViewName("admin/Admin_Manager");
		return mav;
	}
	
	/*
	 * ʵ��ѧ���û������úͲ�����
	 */
	@RequestMapping("/AlterUserFlag")
	public String AlterUserFlag(HttpServletRequest request,User user) {
		//ʵ���û�������
		if(user.getFlag()==0) {
			//������
			user.setFlag(1);
		}else {
			//����
			user.setFlag(0);
		}
		if(userServiceImpl.updateByPrimaryKeySelective(user)!=0) {
			request.setAttribute("hint", "�û�״̬�޸ĳɹ���");
		}else {
			request.setAttribute("hint", "�û�״̬�޸�ʧ�ܣ�");
		}
		//������֮����ת
		return "forward:/common?start=0";
		
	}
	
	/*
	 * �����������ɾ��
	 */
	@RequestMapping("/deleteUser")
	public String deleteUser(HttpServletRequest request) {
		List<User> list=new ArrayList<User>();
		String[] value=request.getParameterValues("delid");
		for(int i=0;i<value.length;i++) {
			User user=new User();
			user.setUsername(value[i]);
			list.add(user);
		}
		userServiceImpl.deleteByPrimaryKey(list);
		return "forward:/common?start=0";
		
	}
	
	/*
	 * ��תע��ҳ��
	 */
	@RequestMapping("/addUserInterface")
	public String addUser() {
		return "admin/addUserInterface";
	}
	/*
	 * ��֤�û����Ƿ����
	 */
	@RequestMapping("/VerifyUsername")
	public String VerifyUsername(HttpServletRequest request,HttpServletResponse response)throws Exception {
		String result=null;
		String username=request.getParameter("username");
		User user=userServiceImpl.selectByPrimaryKey(username);
		if(user!=null) {
			result="<font color='red'>���û����ѱ�ʹ��</font>";
		}else {
			result="<font color='blue'>���û�������ʹ��</font>";
		}
		response.setContentType("text/html;charset=UTF-8");
		//��ǰ�˷�������
		response.getWriter().print(result);
		return null;
	}
	
	/*
	 * ����û�
	 */
	@RequestMapping("/addUser")
	public String addUser(HttpServletRequest request,User user) {
		String rpassword=request.getParameter("rpassword");
		if(user.getPassword().equals(rpassword)) {
			if(StringUtil.IsNumeric(user.getPhone())) {
				int count=userServiceImpl.insert(user);
				if(count==1) {
					request.setAttribute("hint", "ע��ɹ�");
				}else {
					request.setAttribute("hint", "ע��ʧ��");
				}
			}else {
				request.setAttribute("hint", "�绰��ʽ����");
			}
		}else {
			request.setAttribute("hint", "�����������벻һ��");
		}
		return "admin/addUserInterface";
	}
	
	
	
}
