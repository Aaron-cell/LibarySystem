package com.eighth.controller;

import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.eighth.pojo.Books;
import com.eighth.pojo.Person;
import com.eighth.pojo.User;
import com.eighth.service.impl.BooksServiceImpl;
import com.eighth.service.impl.PersonServiceImpl;
import com.eighth.service.impl.PersonalCenterServiceImpl;
import com.eighth.service.impl.UserServiceImpl;
import com.eighth.util.*;
import com.eighth.util.Error;


@Controller
public class ExcelController {
	@Autowired
	UserServiceImpl userServiceImpl;
	@Autowired
	PersonServiceImpl personServiceImpl;
	@Autowired
	BooksServiceImpl booksServiceImpl;
	
	//跳转到用户批量导入页面
	@RequestMapping("/batchAdd_Manager")
	public String batchAdd_Manager(HttpServletRequest request) {
		return "admin/batchAdd";
	}
	 /*
	  * 下载Excel模板
	  */
	 @RequestMapping("/DownExcelTemplet")
	 public void doQuestionImport(HttpServletResponse response)throws Exception{
		 response.setContentType("application/binary;charset=UTF-8");     		
 		response.setCharacterEncoding("utf-8");  
          try{
              ServletOutputStream out=response.getOutputStream();
              try {
                  //设置文件头：最后一个参数是设置下载文件名
                  response.setHeader("Content-Disposition", "attachment;fileName=" + URLEncoder.encode("ExcelTemplet"+".xls", "UTF-8"));
              } catch (UnsupportedEncodingException e1) {
                  e1.printStackTrace();
              }
              String[] titles = { "用户名", "密码", "姓名","性别","电话", "是否有效" }; 
              ExcelTemplet et=new ExcelTemplet();        
              et.export(titles,out);      
          } catch(Exception e){
              e.printStackTrace();     
          }
	 }
	 //导入文件
	 @RequestMapping("ExcelImport")
	 public String ExcelImport(HttpServletRequest request) throws Exception {
		 MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request; 
		 MultipartFile file = multipartRequest.getFile("file");
		 String filename=file.getOriginalFilename();
		 //判断是不是Excel
		 if(filename.endsWith(".xls") || filename.endsWith(".xlsx")){  
			 //转换成输入流
            InputStream in = file.getInputStream();
            List<List<Object>> list=new ExcelImport().getBankListByExcel(in, filename);
            //记录导入失败的信息
            List<Error> list1=new ArrayList<>();
            //记录插入的条数
            int count=list.size();
            //对Excel数据进行判断 选择性插入
            for(int i=0;i<list.size();i++) {
            	//判断用户名是否存在
            	String username=(String) list.get(i).get(0);
            	User user=userServiceImpl.selectByPrimaryKey(username);
            	if(user!=null) {
            		count--;
            		Error error=new Error((i+2),"用户名已存在");
            		list1.add(error);
            		continue;
            	}
            	String password=(String) list.get(i).get(1);
            	String name=(String)list.get(i).get(2);
            	//判断性别
            	String sex=(String)list.get(i).get(3);
            	if("男".equals(sex) || "女".equals(sex)) {
            		//不做任何处理
            	}else {
            		count--;
            		Error error=new Error((i+2),"性别格式不正确");
            		list1.add(error);
            		continue;
            	}
            	//判断电话格式
            	String phone=(String)list.get(i).get(4);
            	if(!StringUtil.IsNumeric(phone)) {
            		count--;
            		Error error=new Error((i+2),"电话格式不正确");
            		list1.add(error);
            		continue;
            	}
            	//判断状态格式
            	String flag=(String)list.get(i).get(5);
            	if("有效".equals(flag) || "无效".equals(flag)) {
            		//不做任何处理
            	}else {
            		count--;
            		Error error=new Error((i+2),"状态格式应为“有效”或“无效”!");
            		list1.add(error);
            		continue;
            	}
            	//开始插入数据
            	User user1=new User();
            	user1.setUsername(username);
            	user1.setPassword(password);
            	user1.setName(name);
            	user1.setSex(sex);
            	user1.setType(1);
            	user1.setPhone(phone);
            	if("有效".equals(flag)) {
            		user1.setFlag(0);
            	}else {
            		user1.setFlag(1);
            	}
            	userServiceImpl.insert(user1);	
            }
            request.setAttribute("hint", "共导入"+count+"条用户记录！");
			request.setAttribute("list1", list1);    
		 }else {
			 request.setAttribute("hint", "导入文件不是Excel！");
		 }
		return "admin/batchAdd";
	 }
	 
	 //点击排序导出
	@RequestMapping("/ranking_Manager")
	public String ranking_Manager(HttpServletRequest request) {
		RankingCondition rank=new RankingCondition();
		//默认先显示学生
		rank.setType(0);
		rank.setCount(50);
		HttpSession session=request.getSession();
		session.setAttribute("rank", rank);
		//学生借阅量排名
		List<Person> list=personServiceImpl.selectAll(rank.getCount());
		request.setAttribute("list", list);
		return "admin/ranking";
	}
	
	//点击查找
	@RequestMapping("/rangking")
	public String rangking(HttpServletRequest request,RankingCondition rank) {
		HttpSession session=request.getSession();
		session.setAttribute("rank", rank);
		if(rank.getType()==0) {
			//学生借阅量排名
			List<Person> list=personServiceImpl.selectAll(rank.getCount());
			request.setAttribute("list", list);
		}else {
			//书籍访问量排名
			List<Books> list=booksServiceImpl.selectAllByVisit(rank.getCount());
			request.setAttribute("list", list);
		}

		return "admin/ranking";
	}
	//数据导出
	@RequestMapping("/ExcelExport")
	public String ExcelExport(HttpServletRequest request,HttpServletResponse response) {
		HttpSession session=request.getSession();
		RankingCondition rank=(RankingCondition) session.getAttribute("rank");
		response.setContentType("application/binary;charset=UTF-8");
		response.setCharacterEncoding("utf-8");  
      try{
          ServletOutputStream out=response.getOutputStream();
          try {
        	  if(rank.getType()==0) {
        		//设置文件头：最后一个参数是设置下载文件名
                  response.setHeader("Content-Disposition", "attachment;fileName=" + URLEncoder.encode("借阅量排名前"+rank.getCount()+".xls", "UTF-8"));
        	  }else {
        		//设置文件头：最后一个参数是设置下载文件名
                  response.setHeader("Content-Disposition", "attachment;fileName=" + URLEncoder.encode("访问量排名前"+rank.getCount()+".xls", "UTF-8"));
        	  }   
          } catch (UnsupportedEncodingException e1) {
              e1.printStackTrace();
          }
          if(rank.getType()==0) {
        	  String[] titles = {"用户名", "借阅量"}; 
        	  List<Person> list=personServiceImpl.selectAll(rank.getCount());
        	  PersonExcelImpl excel=new PersonExcelImpl();
        	  excel.export(titles, out, list);
          }else {
        	  String[] titles = { "书名", "作者", "出版社","是否可借阅","访问量"}; 
        	  List<Books> list=booksServiceImpl.selectAllByVisit(rank.getCount());
        	  BooksExcelImpl excel=new BooksExcelImpl();
        	  excel.export(titles, out, list);
          }
          request.setAttribute("hint", "导出成功");
      } catch(Exception e){
          e.printStackTrace();
          request.setAttribute("hint", "导出失败");
      }
      return "forward:/ranking_Manager";	
	}
}
