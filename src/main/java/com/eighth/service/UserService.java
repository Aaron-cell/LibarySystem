package com.eighth.service;
import java.util.List;

import com.eighth.pojo.User;
/*
 * ʵ���û�����Ĺ���
 */
public interface UserService {
	//�޸��û�״̬
	int updateByPrimaryKeySelective(User user);
	//ɾ���û���Ϣ
	void deleteByPrimaryKey(List<User> list);
	//��������ѯ
	List<User> selectByMoreCondition(User user);
	
	User selectByPrimaryKey(String username);
	//����û�
	int insert(User record);
	
	/*
	 * ʵ�ָ�����Ϣ ����ȹ���
	 */
	int updateUser(User user);
	
	
}
