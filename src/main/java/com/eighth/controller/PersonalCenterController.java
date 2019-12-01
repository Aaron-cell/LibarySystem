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
	//点击个人中心
	@RequestMapping("/fore/personalCenter")
	public String personalCenter(HttpServletRequest request,HttpServletResponse response) {
		HttpSession session=request.getSession();
		User user1=(User) session.getAttribute("person");
		//如果用户非法登录 直接进个人中心
		if(user1==null) {
			request.setAttribute("error", "您未登录！请先登录");
			request.setAttribute("page", "personalCenter");
			return "fore/login";
		}else {
			List<PersonalCenter> list1=new ArrayList<PersonalCenter>();
			//查询用户借阅记录
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
	
	//当用户登录后点击借阅
	@RequestMapping("/fore/borrowBook")
	public String borrowBook(HttpServletRequest request,HttpServletResponse response)throws Exception {
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("person");
		int bid=Integer.parseInt(request.getParameter("bid"));
		String result = null;
		//System.out.println("已接收"+bid);
		//1.判断书籍是否可借阅
		Books book=booksServiceImpl.selectByPrimaryKey(bid);
		if(0==book.getBorrow()) {
			//2此书是否还有剩余量
			if(book.getResidue()>0) {
				//3该用户是否还可继续借阅
				Person person=personalCenterServiceImpl.selectByPrimaryKey(user.getUsername());
				if(person.getNum()<person.getMaxnum()) {
					//借阅成功！！！
					//1.修改book表剩余量
					Books book1=new Books();
					book1.setBid(bid);
					book1.setResidue(book.getResidue()-1);
					booksServiceImpl.updateByPrimaryKeySelective(book1);
					//2.修改person表
					Person person1=new Person();
					person1.setUsername(person.getUsername());
					person1.setNum(person.getNum()+1);
					person1.setTotal(person.getTotal()+1);
					//如果用户首次借书 数据库records字段值为null
					if(person.getRecords()==null) {
						person1.setRecords(String.valueOf(bid));
					}else {
						person1.setRecords(person.getRecords()+","+bid);
					}
					
					personalCenterServiceImpl.updateByPrimaryKeySelective(person1);
					//3.修改record表
					/*
					 *将时间改为timestamp 
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
				    result="借阅成功！";
				}else {
					result="借阅书籍已达上限，请归还后在借阅";
				}
			}else {
				result="书被借光了！！！";
			}
		}else {
			result="此书无法借阅！";
		}
		response.setContentType("text/html;charset=UTF-8");
		//对前端发送数据
		response.getWriter().print(result);
		return null;
	}
	
	/*
	 * 续借 更改借阅状态
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
	
	//注销 移除session中person
	@RequestMapping("/fore/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session=request.getSession();
		session.removeAttribute("person");
		//跳转到ForeController中home方法
		return "forward:/fore/home";
	}
	
	//跳转到修改个人信息页面
	@RequestMapping("/fore/information")
	public String information(HttpServletRequest request) {
		return "fore/personalInformation";
		
	}
	//处理修改密码
	@RequestMapping("/fore/updateInformation")
	public String updateInformation(HttpServletRequest request) {
		HttpSession session=request.getSession();
		User person=(User)session.getAttribute("person");
		//获取参数
		String name=request.getParameter("name");
		String sex=request.getParameter("sex");
		String phone=request.getParameter("phone");	
		if(person!=null) {
			 //判断电话是否全是数字
			if(StringUtil.IsNumeric(phone)) {
				person.setName(name);
				person.setSex(sex);
				person.setPhone(phone);
				int count=userServiceImpl.updateUser(person);
				if(count==1) {
					session.setAttribute("person", person);
					request.setAttribute("hint", "保存成功");
				}else {
					request.setAttribute("hint", "保存失败");
				}
			}else {
				request.setAttribute("hint", "电话格式错误");
			}
		}else {
			request.setAttribute("hint", "登录了吗？没登录你进来干嘛！");
		}
		return "fore/personalInformation";
	}
	
	//跳转到修该密码页面
	@RequestMapping("/fore/repassword")
	public String Repassword() {
		return "fore/personalRepassword";
	}
	
	/*
	 * 修改密码
	 */
	@RequestMapping("/fore/updatePassword")
	public String updatePassword(HttpServletRequest request) {
		HttpSession session=request.getSession();
		User person=(User) session.getAttribute("person");
		String npassword=request.getParameter("npassword");
		String rpassword=request.getParameter("rpassword");
		if(person!=null) {
			//验证两次密码是否相同
			if(npassword.equals(rpassword)){
				person.setPassword(npassword);
				int count=userServiceImpl.updateUser(person);
				if(count==1) {
					session.setAttribute("person", person);
					request.setAttribute("hint", "保存成功");
				}else {
					request.setAttribute("hint", "保存失败");
				}
			}else {
				request.setAttribute("hint", "两次密码输入不一致");
			}
		}else {
			request.setAttribute("hint", "就不给你弹登录框！看你咋办");
		}
		return "fore/personalRepassword";
	}
	

}
