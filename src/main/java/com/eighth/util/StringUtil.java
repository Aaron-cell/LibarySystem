package com.eighth.util;

public class StringUtil {
	/*
	 * �ж��ַ����Ƿ�ȫΪ����
	 */
	public static boolean IsNumeric(String str){ 
		  for (int i = str.length();--i>=0;){   
		   if (!Character.isDigit(str.charAt(i))){ 
		    return false; 
		   } 
		  } 
		  return true; 
		} 
		
}
