package com.eighth.util;

import java.text.SimpleDateFormat;

import java.util.Date;

public class DateCalculate {
	//date时间天数加法
	public static Date addDate(Date date, int day) throws Exception {
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		 String str=df.format(new Date(date.getTime() + (long)day * 24 * 60 * 60 * 1000));
		return df.parse(str);
	}
	//date时间天数减法
	public static Date subDate(Date date, int day) throws Exception {
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		 String str=df.format(new Date(date.getTime() - (long)day * 24 * 60 * 60 * 1000));
		return df.parse(str);
	}
}
