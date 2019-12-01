package com.eighth.service;

import java.util.List;

import com.eighth.pojo.Person;

public interface PersonService {
	
	List<Person> selectAll(int count);
	
	Person selectByPrimaryKey(String username);
	
	int updateByPrimaryKey(Person record);
}
