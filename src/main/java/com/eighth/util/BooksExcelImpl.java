package com.eighth.util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletOutputStream;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import com.eighth.pojo.Books;

public class BooksExcelImpl {
	public void export(String[] titles, ServletOutputStream out,List<Books> list) throws Exception{
	    
		// 第一步，创建一个workbook，对应一个Excel文件
		HSSFWorkbook workbook = new HSSFWorkbook();
	     // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet
	    HSSFSheet hssfSheet = workbook.createSheet("sheet1");                 
	                    
	                     
	    // 第三步，在sheet中添加表头第0行
	                     
	    HSSFRow row = hssfSheet.createRow(0);
	    // 第四步，创建单元格，并设置值表头 设置表头居中
	    HSSFCellStyle hssfCellStyle = workbook.createCellStyle();
	                     
	   //居中样式 
	    hssfCellStyle.setAlignment(HorizontalAlignment.CENTER);
	         
         HSSFCell hssfCell = null;
         for (int i = 0; i < titles.length; i++) {
             hssfCell = row.createCell(i);//列索引从0开始
             hssfCell.setCellValue(titles[i]);//列名1
             hssfCell.setCellStyle(hssfCellStyle);//列居中显示                
         }
	              
         //存放数据库中数据
         for (int i = 0; i < list.size(); i++) {
             row = hssfSheet.createRow(i+1);                
             Books book = list.get(i);
             
             // 第六步，创建单元格，并设置值
             //图书名称
             String name="";
             if(book.getName()!=null){
                     name = book.getName();
             }
            row.createCell(0).setCellValue(name);
            //图书作者
             String author = "";
             if(book.getAuthor() != null){
            	 author = book.getAuthor();
             }
            row.createCell(1).setCellValue(author);
            //图书出版社
             String publish = "";
             if(book.getPublish() != null){
            	 publish=book.getPublish();
             }
             row.createCell(2).setCellValue(publish);
             //是否可借阅
             String status="";
             if(book.getBorrow()==0){
                 status="可借阅";
             }else {
            	 status="不可借阅";
             }
             row.createCell(3).setCellValue(status);
             //访问量
             int visit=0;
             visit=book.getVisit();
             row.createCell(4).setCellValue(visit);
            
         }
             try {
                 workbook.write(out);
                 out.flush();
                out.close();
 
             } catch (Exception e) {
                 e.printStackTrace();
             }
        
         }                   
	           
    
}
