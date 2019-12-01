package com.eighth.service;

import com.eighth.pojo.User;

/**
 * Function:处理登录服务
 * @author Aaron
 * Date：2019.5.19
 */
public interface LoginService {
	//登录
	User SelectUser(User user);
}
