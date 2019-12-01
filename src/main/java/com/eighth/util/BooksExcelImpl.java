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
	    
		// ��һ��������һ��workbook����Ӧһ��Excel�ļ�
		HSSFWorkbook workbook = new HSSFWorkbook();
	     // �ڶ�������webbook�����һ��sheet,��ӦExcel�ļ��е�sheet
	    HSSFSheet hssfSheet = workbook.createSheet("sheet1");                 
	                    
	                     
	    // ����������sheet����ӱ�ͷ��0��
	                     
	    HSSFRow row = hssfSheet.createRow(0);
	    // ���Ĳ���������Ԫ�񣬲�����ֵ��ͷ ���ñ�ͷ����
	    HSSFCellStyle hssfCellStyle = workbook.createCellStyle();
	                     
	   //������ʽ 
	    hssfCellStyle.setAlignment(HorizontalAlignment.CENTER);
	         
         HSSFCell hssfCell = null;
         for (int i = 0; i < titles.length; i++) {
             hssfCell = row.createCell(i);//��������0��ʼ
             hssfCell.setCellValue(titles[i]);//����1
             hssfCell.setCellStyle(hssfCellStyle);//�о�����ʾ                
         }
	              
         //������ݿ�������
         for (int i = 0; i < list.size(); i++) {
             row = hssfSheet.createRow(i+1);                
             Books book = list.get(i);
             
             // ��������������Ԫ�񣬲�����ֵ
             //ͼ������
             String name="";
             if(book.getName()!=null){
                     name = book.getName();
             }
            row.createCell(0).setCellValue(name);
            //ͼ������
             String author = "";
             if(book.getAuthor() != null){
            	 author = book.getAuthor();
             }
            row.createCell(1).setCellValue(author);
            //ͼ�������
             String publish = "";
             if(book.getPublish() != null){
            	 publish=book.getPublish();
             }
             row.createCell(2).setCellValue(publish);
             //�Ƿ�ɽ���
             String status="";
             if(book.getBorrow()==0){
                 status="�ɽ���";
             }else {
            	 status="���ɽ���";
             }
             row.createCell(3).setCellValue(status);
             //������
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
