package com.eighth.service;
import java.util.List;

import com.eighth.pojo.User;
/*
 * 实现用户管理的功能
 */
public interface UserService {
	//修改用户状态
	int updateByPrimaryKeySelective(User user);
	//删除用户信息
	void deleteByPrimaryKey(List<User> list);
	//多条件查询
	List<User> selectByMoreCondition(User user);
	
	User selectByPrimaryKey(String username);
	//添加用户
	int insert(User record);
	
	/*
	 * 实现个人信息 密码等功能
	 */
	int updateUser(User user);
	
	
}
