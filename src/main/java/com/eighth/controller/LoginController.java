package com.eighth.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.eighth.pojo.User;
import com.eighth.service.impl.LoginServiceImpl;

@Controller
public class LoginController {
	@Autowired LoginServiceImpl loginServiceImpl;
	/*
	 * ����Ա��¼
	 */
	@RequestMapping("/login")
	public ModelAndView login(User user,HttpServletRequest request)throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav=new ModelAndView();
		User user1=loginServiceImpl.SelectUser(user);
		if(user1==null) {
			mav.addObject("error", "�û������������");
			mav.setViewName("../../login");
		}else {
			//���ǹ���Ա
			if(user1.getType()==1) {
				mav.addObject("error", "�����ǹ���Ա��");
				mav.setViewName("../../login");
			}else {
				HttpSession session=request.getSession();
				session.setAttribute("user", user1);
				mav.addObject("username",user1.getUsername());
				mav.setViewName("admin/index");
			}
			
		}
		return mav;
	}
}
