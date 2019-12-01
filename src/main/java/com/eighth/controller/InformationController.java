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
 * Function:进入个人中心，更新信息，更改密码等功能
 * @author Aaron
 * Date:2019.5.20
 */
@Controller
public class InformationController {
	@Autowired LoginServiceImpl loginServiceImpl;
	@Autowired UserServiceImpl userServiceImpl;
	//进入个人信息
	@RequestMapping("/administrators")
	public String administrators(HttpServletRequest request) {
			return "admin/administrators";
	}
	
	/*
	 * 保存信息
	 */
	@RequestMapping("/updatePersonal")
	public String updatePersonal(HttpServletRequest request) {
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("user");
		//获取参数
		String name=request.getParameter("name");
		String sex=request.getParameter("sex");
		String phone=request.getParameter("phone");	
		 //判断电话是否全是数字
		if(StringUtil.IsNumeric(phone)) {
			user.setName(name);
			user.setSex(sex);
			user.setPhone(phone);
			int count=userServiceImpl.updateUser(user);
			if(count==1) {
				session.setAttribute("user", user);
				request.setAttribute("hint", "保存成功");
			}else {
				request.setAttribute("hint", "保存失败");
			}
		}else {
			request.setAttribute("hint", "电话格式错误");
		}	
		return "admin/administrators";
	}
	/*
	 * 进入修改密码页面
	 */
	@RequestMapping("/changePassword")
	public String changePassword(HttpServletRequest request) {
			return "admin/changePassword";
	}
	/*
	 * 修改密码
	 */
	@RequestMapping("/updatePassword")
	public String updatePassword(HttpServletRequest request) {
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("user");
		String npassword=request.getParameter("npassword");
		String rpassword=request.getParameter("rpassword");
		//验证两次密码是否相同
		if(npassword.equals(rpassword)){
			user.setPassword(npassword);
			int count=userServiceImpl.updateUser(user);
			if(count==1) {
				session.setAttribute("user", user);
				request.setAttribute("hint", "保存成功");
			}else {
				request.setAttribute("hint", "保存失败");
			}
		}else {
			request.setAttribute("hint", "两次密码输入不一致");
		}
		
		return "admin/changePassword";
	}
	
}
