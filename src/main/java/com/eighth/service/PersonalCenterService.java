package com.eighth.service;

import java.util.List;

import com.eighth.pojo.Books;
import com.eighth.pojo.Person;
import com.eighth.pojo.Records;

public interface PersonalCenterService {
	
	Person selectByPrimaryKey(String username);
	
	int insertSelective(Person record);
	
	List<Books> selectByBid(String[] str);
	
	List<Records> selectByUsername(String username);
	
	//ÐÞ¸Äperson±í
	int updateByPrimaryKeySelective(Person record);
}
