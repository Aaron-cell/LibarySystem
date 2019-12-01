package com.eighth.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.eighth.pojo.User;

@Controller
public class HomeController {
	@RequestMapping("/index_home")
	public ModelAndView index_home(HttpServletRequest request) {
		ModelAndView mav=new ModelAndView();
			mav.setViewName("admin/index_home");
		return mav;
	}
}
