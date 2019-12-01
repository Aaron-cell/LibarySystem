package com.eighth.mapper;

import com.eighth.pojo.Person;
import com.eighth.pojo.PersonExample;
import java.util.List;

public interface PersonMapper {
    int deleteByPrimaryKey(String username);

    int insert(Person record);

    int insertSelective(Person record);

    List<Person> selectByExample(PersonExample example);

    Person selectByPrimaryKey(String username);

    int updateByPrimaryKeySelective(Person record);

    int updateByPrimaryKey(Person record);
    
    List<Person> selectAll(int count);
}