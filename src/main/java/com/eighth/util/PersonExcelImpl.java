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

import com.eighth.pojo.Person;

public class PersonExcelImpl {
	public void export(String[] titles, ServletOutputStream out,List<Person> list) throws Exception{
	    
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
             Person person = list.get(i);
             
             // ��������������Ԫ�񣬲�����ֵ
             //�û���
             String name="";
             if(person.getUsername()!=null){
                     name = person.getUsername();
             }
            row.createCell(0).setCellValue(name);
            //������
            int total=0;
            total=person.getTotal();
            row.createCell(1).setCellValue(total);
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
