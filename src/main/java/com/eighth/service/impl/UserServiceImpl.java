package com.eighth.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.eighth.mapper.UserMapper;
import com.eighth.pojo.User;
import com.eighth.service.UserService;


@Service
public class UserServiceImpl implements UserService {
	@Autowired UserMapper userMapper;
	//�޸��û�״̬
	@Override
	public int updateByPrimaryKeySelective(User user) {
	
		return userMapper.updateByPrimaryKeySelective(user);
	}
	/*
	 * �ڷ����ϼ�������ע��
	 * ������ɾ����������ʱ ����ع�
	 */
    @Override
    @Transactional(propagation=Propagation.REQUIRED,rollbackForClassName="Exception")
	public void deleteByPrimaryKey(List<User> list) {
		//ѭ��ɾ���û�
    	for(int i=0;i<list.size();i++) {
			userMapper.deleteByPrimaryKey(list.get(i).getUsername());
    	}
		
	}
	@Override
	public List<User> selectByMoreCondition(User user) {
		List<User> list=userMapper.selectByMoreCondition(user);
		return list;
	}
	@Override
	public User selectByPrimaryKey(String username) {
		
		return userMapper.selectByPrimaryKey(username);
	}
	//����û�
	@Override
	public int insert(User record) {
		return userMapper.insert(record);
	}
	//�����û���Ϣ
	public int updateUser(User user) {
		int count=userMapper.updateByPrimaryKey(user);
		return count;
	}

}
