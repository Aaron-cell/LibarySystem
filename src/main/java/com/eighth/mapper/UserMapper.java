package com.eighth.mapper;

import com.eighth.pojo.User;
import com.eighth.pojo.UserExample;
import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(String username);

    int insert(User record);

    int insertSelective(User record);

    List<User> selectByExample(UserExample example);

    User selectByPrimaryKey(String username);
    
    User selectUser(User user);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    List<User> selectByMoreCondition(User user);
}