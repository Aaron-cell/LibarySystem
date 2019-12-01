package com.eighth.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eighth.mapper.PersonMapper;
import com.eighth.pojo.Person;
import com.eighth.service.PersonService;
@Service
public class PersonServiceImpl implements PersonService {
	@Autowired
	PersonMapper personMapper;
	@Override
	public List<Person> selectAll(int count) {
		// TODO Auto-generated method stub
		return personMapper.selectAll(count);
	}
	@Override
	public Person selectByPrimaryKey(String username) {
		// TODO Auto-generated method stub
		return personMapper.selectByPrimaryKey(username);
	}
	@Override
	public int updateByPrimaryKey(Person record) {
		// TODO Auto-generated method stub
		return personMapper.updateByPrimaryKey(record);
	}

}
