package com.eighth.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eighth.pojo.User;
import com.eighth.service.impl.LoginServiceImpl;
import com.eighth.service.impl.UserServiceImpl;
import com.eighth.util.StringUtil;
/**
 * Function:����������ģ�������Ϣ����������ȹ���
 * @author Aaron
 * Date:2019.5.20
 */
@Controller
public class InformationController {
	@Autowired LoginServiceImpl loginServiceImpl;
	@Autowired UserServiceImpl userServiceImpl;
	//���������Ϣ
	@RequestMapping("/administrators")
	public String administrators(HttpServletRequest request) {
			return "admin/administrators";
	}
	
	/*
	 * ������Ϣ
	 */
	@RequestMapping("/updatePersonal")
	public String updatePersonal(HttpServletRequest request) {
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("user");
		//��ȡ����
		String name=request.getParameter("name");
		String sex=request.getParameter("sex");
		String phone=request.getParameter("phone");	
		 //�жϵ绰�Ƿ�ȫ������
		if(StringUtil.IsNumeric(phone)) {
			user.setName(name);
			user.setSex(sex);
			user.setPhone(phone);
			int count=userServiceImpl.updateUser(user);
			if(count==1) {
				session.setAttribute("user", user);
				request.setAttribute("hint", "����ɹ�");
			}else {
				request.setAttribute("hint", "����ʧ��");
			}
		}else {
			request.setAttribute("hint", "�绰��ʽ����");
		}	
		return "admin/administrators";
	}
	/*
	 * �����޸�����ҳ��
	 */
	@RequestMapping("/changePassword")
	public String changePassword(HttpServletRequest request) {
			return "admin/changePassword";
	}
	/*
	 * �޸�����
	 */
	@RequestMapping("/updatePassword")
	public String updatePassword(HttpServletRequest request) {
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("user");
		String npassword=request.getParameter("npassword");
		String rpassword=request.getParameter("rpassword");
		//��֤���������Ƿ���ͬ
		if(npassword.equals(rpassword)){
			user.setPassword(npassword);
			int count=userServiceImpl.updateUser(user);
			if(count==1) {
				session.setAttribute("user", user);
				request.setAttribute("hint", "����ɹ�");
			}else {
				request.setAttribute("hint", "����ʧ��");
			}
		}else {
			request.setAttribute("hint", "�����������벻һ��");
		}
		
		return "admin/changePassword";
	}
	
}
