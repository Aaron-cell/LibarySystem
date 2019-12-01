package com.eighth.util;

public class StringUtil {
	/*
	 * ÅĞ¶Ï×Ö·û´®ÊÇ·ñÈ«ÎªÊı×Ö
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
