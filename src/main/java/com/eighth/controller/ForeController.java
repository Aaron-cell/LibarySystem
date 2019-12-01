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

import com.eighth.pojo.Books;
import com.eighth.pojo.Person;
import com.eighth.pojo.Records;
import com.eighth.pojo.Sort;
import com.eighth.pojo.User;
import com.eighth.service.impl.BooksServiceImpl;
import com.eighth.service.impl.HomeServiceImpl;
import com.eighth.service.impl.LoginServiceImpl;
import com.eighth.service.impl.SortServiceImpl;
import com.eighth.service.impl.PersonalCenterServiceImpl;
import com.eighth.service.impl.RecordsServiceImpl;
import com.eighth.util.DateCalculate;
import com.eighth.util.Page;
import com.eighth.util.PersonalCenter;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class ForeController {
	@Autowired
	HomeServiceImpl homeServiceImpl;
	@Autowired
	LoginServiceImpl loginServiceImpl;
	@Autowired
	SortServiceImpl sortServiceImpl;
	@Autowired
	BooksServiceImpl booksServiceImpl;
	@Autowired
	PersonalCenterServiceImpl personalCenterServiceImpl;
	@Autowired
	RecordsServiceImpl recordsServiceImpl;
	//页面之间跳转
	//@PathVariable可以将URL中占位符参数{xxx}绑定到处理器类的方法中
	@RequestMapping("/fore/{page}") 
	public String showPage(@PathVariable String page){
		String view="fore/"+page; 
		return view ; 
	}
	
	//跳转到首页
	@RequestMapping("/fore/home")
	public String home(HttpServletRequest request) {
		//当第一次访问home时 向session绑定一个数据 方便后边对访问量的统计
		HttpSession session=request.getSession();
		if(session.isNew()) {
			List<Integer> listBid=new ArrayList<Integer>();
			List<Books> listBook=homeServiceImpl.sortByVisit();
			for(int i=0;i<listBook.size();i++) {
				listBid.add(listBook.get(i).getBid());
			}
			session.setAttribute("listBid", listBid);
		}
		List<Books> books1=new ArrayList<>();
		List<Books> books2=new ArrayList<>();
		List<Books> list=homeServiceImpl.sortByVisit();
		//获取热销榜前8
		for(int i=0;i<8;i++) {
			books1.add(list.get(i));
		}
		List<Books> list1=homeServiceImpl.sortByCreatetime();
		//获取最新榜前8
		for(int i=0;i<8;i++) {
			books2.add(list1.get(i));
		}
		request.setAttribute("books1", books1);	
		request.setAttribute("books2", books2);	
		return "fore/home";	
	}
	//显示热销榜全部
	@RequestMapping("/fore/PopularBooks")
	public String PopularBooks(HttpServletRequest request,Page page) {	
		page.setCount(8);
		PageHelper.offsetPage(page.getStart(),page.getCount());
		List<Books> list=homeServiceImpl.sortByVisit();
		int total = (int) new PageInfo<>(list).getTotal();
        page.setTotal(total);
        page.caculateLast(total);
        page.setCurrentPage(page.getStart()/page.getCount()+1);
        page.setLastPage(page.getLast()/page.getCount()+1);
		request.setAttribute("books1", list);
		return "fore/PopularBooks";	
	}
	
	//显示最新榜全部
		@RequestMapping("/fore/LatestBooks")
		public String LatestBooks(HttpServletRequest request,Page page) {	
			page.setCount(8);
			PageHelper.offsetPage(page.getStart(),page.getCount());
			List<Books> list=homeServiceImpl.sortByCreatetime();
			int total = (int) new PageInfo<>(list).getTotal();
	        page.setTotal(total);
	        page.caculateLast(total);
	        page.setCurrentPage(page.getStart()/page.getCount()+1);
	        page.setLastPage(page.getLast()/page.getCount()+1);
			request.setAttribute("books2", list);
			return "fore/LatestBooks";	
		}
	//根据bid查询书籍信息 统计访问量
		@RequestMapping("/fore/productshow")
		public String productshow(HttpServletRequest request,Books books) {
			Books book=homeServiceImpl.selectByPrimaryKey(books.getBid());
			HttpSession session=request.getSession();
			List<Integer> listBid=(List<Integer>) session.getAttribute("listBid");
			if(listBid!=null) {
				for(int i=0;i<listBid.size();i++) {
					//当listBid有此书bid时  访问量加一 同时移除listBid中此书的id
					if(books.getBid()==listBid.get(i)) {
						books.setVisit(book.getVisit()+1);
						homeServiceImpl.updateByPrimaryKeySelective(books);
						listBid.remove(i);
						session.setAttribute("listBid", listBid);
					}
				}
			}
			Sort sort=homeServiceImpl.SelectByPrimaryKey(book.getType());
			request.setAttribute("sort", sort);
			request.setAttribute("book", book);
			return "fore/productshow";			
		}
		//跳转到登录页面
		@RequestMapping("/fore/{page}/login")
		public String login(@PathVariable String page,HttpServletRequest request){
			 request.setAttribute("page", page);
			return "fore/login" ; 
		}
		//登录并返回到上一次浏览页面
		@RequestMapping("/fore/login")
		public String forelogin(HttpServletRequest request,User user) {
			String page = request.getParameter("page");
			User user1=loginServiceImpl.SelectUser(user);
			if(user1==null) {
				request.setAttribute("error", "用户名或密码错误");
				request.setAttribute("page", page);
				return "fore/login";
			}else {
				if(user1.getFlag()==1) {
					request.setAttribute("error", "当前用户失效！请联系管理员");
					request.setAttribute("page", page);
					return "fore/login";
				}else {
					//如果用户还未在person表注册 在这里完成注册
					Person person=personalCenterServiceImpl.selectByPrimaryKey(user1.getUsername());
					if(person==null) {
						Person record=new Person(user1.getUsername(),0,5,0);
						personalCenterServiceImpl.insertSelective(record);
					}
					//返回到之前点击登录的页面
					HttpSession session=request.getSession();
					session.setAttribute("person", user1);
					if(page.equals("PopularBooks") || page.equals("LatestBooks")) {
						String url="forward:/fore/"+page+"?start=0";
						return url;
					}else if(page.equals("home") || page.equals("productcate") || page.equals("personalCenter")) {
						String url="forward:/fore/"+page;
						return url;
					}else {
						String url="fore/"+page;
						return url;
					}
				}
				
			}
			
		}
		//跳转到图书分类页面
		@RequestMapping("/fore/productcate")
		public String productcate(HttpServletRequest request) {
			List<Sort> list=sortServiceImpl.selectAll();
			request.setAttribute("list", list);
			return "fore/productcate";
			
		}
		//ajax请求获取此类别数据数量
		@RequestMapping("/fore/getPageCount")
		public String getPageCount(HttpServletRequest request,HttpServletResponse response)throws Exception {
			int sid=Integer.parseInt(request.getParameter("sid"));
			List<Books> list=booksServiceImpl.selectSortByType(sid);
			int result=list.size();
			response.setContentType("text/html;charset=UTF-8");
			//对前端发送数据
			response.getWriter().print(result);
			return null;	
		}
		//ajax获取当前页的数据 返回json数据
		@RequestMapping("/fore/getBooks")
		@ResponseBody
		public List<Books> getBooks(Integer currentPage,Integer sid){	
			int start=(currentPage-1)*4;
			List<Books> list=booksServiceImpl.limitSelectByType(sid, start, 4);
			return list;	
		}
		//搜索书籍
		@RequestMapping("/fore/searchBook")
		public String searchBook(HttpServletRequest request) {
			String bookName=request.getParameter("bookName");
			List<Sort> list=sortServiceImpl.selectAll();
			List<Books> books=booksServiceImpl.selectByName(bookName);
			request.setAttribute("list", list);
			request.setAttribute("books", books);
			request.setAttribute("bookName", bookName);
			return "fore/productcate";
		}
		
}		