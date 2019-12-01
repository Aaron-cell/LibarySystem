package com.eighth.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eighth.mapper.UserMapper;
import com.eighth.pojo.User;
import com.eighth.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService {
	@Autowired UserMapper userMapper;
	public User SelectUser(User user) {
		User user1=userMapper.selectUser(user);
		return user1;
	}

}
