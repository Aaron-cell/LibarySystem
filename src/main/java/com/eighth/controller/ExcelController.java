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
	
	//��ת���û���������ҳ��
	@RequestMapping("/batchAdd_Manager")
	public String batchAdd_Manager(HttpServletRequest request) {
		return "admin/batchAdd";
	}
	 /*
	  * ����Excelģ��
	  */
	 @RequestMapping("/DownExcelTemplet")
	 public void doQuestionImport(HttpServletResponse response)throws Exception{
		 response.setContentType("application/binary;charset=UTF-8");     		
 		response.setCharacterEncoding("utf-8");  
          try{
              ServletOutputStream out=response.getOutputStream();
              try {
                  //�����ļ�ͷ�����һ�����������������ļ���
                  response.setHeader("Content-Disposition", "attachment;fileName=" + URLEncoder.encode("ExcelTemplet"+".xls", "UTF-8"));
              } catch (UnsupportedEncodingException e1) {
                  e1.printStackTrace();
              }
              String[] titles = { "�û���", "����", "����","�Ա�","�绰", "�Ƿ���Ч" }; 
              ExcelTemplet et=new ExcelTemplet();        
              et.export(titles,out);      
          } catch(Exception e){
              e.printStackTrace();     
          }
	 }
	 //�����ļ�
	 @RequestMapping("ExcelImport")
	 public String ExcelImport(HttpServletRequest request) throws Exception {
		 MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request; 
		 MultipartFile file = multipartRequest.getFile("file");
		 String filename=file.getOriginalFilename();
		 //�ж��ǲ���Excel
		 if(filename.endsWith(".xls") || filename.endsWith(".xlsx")){  
			 //ת����������
            InputStream in = file.getInputStream();
            List<List<Object>> list=new ExcelImport().getBankListByExcel(in, filename);
            //��¼����ʧ�ܵ���Ϣ
            List<Error> list1=new ArrayList<>();
            //��¼���������
            int count=list.size();
            //��Excel���ݽ����ж� ѡ���Բ���
            for(int i=0;i<list.size();i++) {
            	//�ж��û����Ƿ����
            	String username=(String) list.get(i).get(0);
            	User user=userServiceImpl.selectByPrimaryKey(username);
            	if(user!=null) {
            		count--;
            		Error error=new Error((i+2),"�û����Ѵ���");
            		list1.add(error);
            		continue;
            	}
            	String password=(String) list.get(i).get(1);
            	String name=(String)list.get(i).get(2);
            	//�ж��Ա�
            	String sex=(String)list.get(i).get(3);
            	if("��".equals(sex) || "Ů".equals(sex)) {
            		//�����κδ���
            	}else {
            		count--;
            		Error error=new Error((i+2),"�Ա��ʽ����ȷ");
            		list1.add(error);
            		continue;
            	}
            	//�жϵ绰��ʽ
            	String phone=(String)list.get(i).get(4);
            	if(!StringUtil.IsNumeric(phone)) {
            		count--;
            		Error error=new Error((i+2),"�绰��ʽ����ȷ");
            		list1.add(error);
            		continue;
            	}
            	//�ж�״̬��ʽ
            	String flag=(String)list.get(i).get(5);
            	if("��Ч".equals(flag) || "��Ч".equals(flag)) {
            		//�����κδ���
            	}else {
            		count--;
            		Error error=new Error((i+2),"״̬��ʽӦΪ����Ч������Ч��!");
            		list1.add(error);
            		continue;
            	}
            	//��ʼ��������
            	User user1=new User();
            	user1.setUsername(username);
            	user1.setPassword(password);
            	user1.setName(name);
            	user1.setSex(sex);
            	user1.setType(1);
            	user1.setPhone(phone);
            	if("��Ч".equals(flag)) {
            		user1.setFlag(0);
            	}else {
            		user1.setFlag(1);
            	}
            	userServiceImpl.insert(user1);	
            }
            request.setAttribute("hint", "������"+count+"���û���¼��");
			request.setAttribute("list1", list1);    
		 }else {
			 request.setAttribute("hint", "�����ļ�����Excel��");
		 }
		return "admin/batchAdd";
	 }
	 
	 //������򵼳�
	@RequestMapping("/ranking_Manager")
	public String ranking_Manager(HttpServletRequest request) {
		RankingCondition rank=new RankingCondition();
		//Ĭ������ʾѧ��
		rank.setType(0);
		rank.setCount(50);
		HttpSession session=request.getSession();
		session.setAttribute("rank", rank);
		//ѧ������������
		List<Person> list=personServiceImpl.selectAll(rank.getCount());
		request.setAttribute("list", list);
		return "admin/ranking";
	}
	
	//�������
	@RequestMapping("/rangking")
	public String rangking(HttpServletRequest request,RankingCondition rank) {
		HttpSession session=request.getSession();
		session.setAttribute("rank", rank);
		if(rank.getType()==0) {
			//ѧ������������
			List<Person> list=personServiceImpl.selectAll(rank.getCount());
			request.setAttribute("list", list);
		}else {
			//�鼮����������
			List<Books> list=booksServiceImpl.selectAllByVisit(rank.getCount());
			request.setAttribute("list", list);
		}

		return "admin/ranking";
	}
	//���ݵ���
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
        		//�����ļ�ͷ�����һ�����������������ļ���
                  response.setHeader("Content-Disposition", "attachment;fileName=" + URLEncoder.encode("����������ǰ"+rank.getCount()+".xls", "UTF-8"));
        	  }else {
        		//�����ļ�ͷ�����һ�����������������ļ���
                  response.setHeader("Content-Disposition", "attachment;fileName=" + URLEncoder.encode("����������ǰ"+rank.getCount()+".xls", "UTF-8"));
        	  }   
          } catch (UnsupportedEncodingException e1) {
              e1.printStackTrace();
          }
          if(rank.getType()==0) {
        	  String[] titles = {"�û���", "������"}; 
        	  List<Person> list=personServiceImpl.selectAll(rank.getCount());
        	  PersonExcelImpl excel=new PersonExcelImpl();
        	  excel.export(titles, out, list);
          }else {
        	  String[] titles = { "����", "����", "������","�Ƿ�ɽ���","������"}; 
        	  List<Books> list=booksServiceImpl.selectAllByVisit(rank.getCount());
        	  BooksExcelImpl excel=new BooksExcelImpl();
        	  excel.export(titles, out, list);
          }
          request.setAttribute("hint", "�����ɹ�");
      } catch(Exception e){
          e.printStackTrace();
          request.setAttribute("hint", "����ʧ��");
      }
      return "forward:/ranking_Manager";	
	}
}
