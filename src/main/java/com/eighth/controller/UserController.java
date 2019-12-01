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
	 *  此方法同理
	 * 通过判断路径中page的值执行不同的操作
	 * @RequestMapping("/{page}") 
	 * public String showPage(@PathVariable String page)
	 * { String view="admin/"+page; return view ; }
	 */
	/*
	 * 跳转到学生管理
	 * 并向前端发送数据
	 * 多功能查询
	 * 查询用户 用户名和姓名及用户状态的查询
	 */

	@RequestMapping("/Student_Manager")
	public String StudentManager(HttpServletRequest request) {
		HttpSession session=request.getSession();
			//将所有查询要求汇总判断
			User search=new User();
			search.setType(1);
			String information=request.getParameter("information");
			String flag=request.getParameter("flag");
			if(flag!=null && information!=null){
				//判断下拉框
				if(flag.equals("2")) {
					//查询所有学生 啥也不做
				}else if(flag.equals("0")) {
					search.setFlag(0);
				}else if(flag.equals("1")){
					search.setFlag(1);
				}
				//判断informatiion
				if(information.equals("")) {
					//查询所有学生 啥也不做
				}else {
					search.setUsername(information);
				}
			}
			session.setAttribute("search", search);
			return "forward:/common?start=0";
		
	}
	/*
	 * 综合处理各种分页问题
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
	 * 原理同上
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
	 * 实现学生用户的启用和不启用
	 */
	@RequestMapping("/AlterUserFlag")
	public String AlterUserFlag(HttpServletRequest request,User user) {
		//实现用户不启用
		if(user.getFlag()==0) {
			//不启用
			user.setFlag(1);
		}else {
			//启用
			user.setFlag(0);
		}
		if(userServiceImpl.updateByPrimaryKeySelective(user)!=0) {
			request.setAttribute("hint", "用户状态修改成功！");
		}else {
			request.setAttribute("hint", "用户状态修改失败！");
		}
		//控制器之间跳转
		return "forward:/common?start=0";
		
	}
	
	/*
	 * 事务管理批量删除
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
	 * 跳转注册页面
	 */
	@RequestMapping("/addUserInterface")
	public String addUser() {
		return "admin/addUserInterface";
	}
	/*
	 * 验证用户名是否存在
	 */
	@RequestMapping("/VerifyUsername")
	public String VerifyUsername(HttpServletRequest request,HttpServletResponse response)throws Exception {
		String result=null;
		String username=request.getParameter("username");
		User user=userServiceImpl.selectByPrimaryKey(username);
		if(user!=null) {
			result="<font color='red'>该用户名已被使用</font>";
		}else {
			result="<font color='blue'>该用户名可以使用</font>";
		}
		response.setContentType("text/html;charset=UTF-8");
		//对前端发送数据
		response.getWriter().print(result);
		return null;
	}
	
	/*
	 * 添加用户
	 */
	@RequestMapping("/addUser")
	public String addUser(HttpServletRequest request,User user) {
		String rpassword=request.getParameter("rpassword");
		if(user.getPassword().equals(rpassword)) {
			if(StringUtil.IsNumeric(user.getPhone())) {
				int count=userServiceImpl.insert(user);
				if(count==1) {
					request.setAttribute("hint", "注册成功");
				}else {
					request.setAttribute("hint", "注册失败");
				}
			}else {
				request.setAttribute("hint", "电话格式错误");
			}
		}else {
			request.setAttribute("hint", "两次密码输入不一致");
		}
		return "admin/addUserInterface";
	}
	
	
	
}
