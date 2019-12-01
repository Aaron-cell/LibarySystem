package com.eighth.service;

import java.util.List;

import com.eighth.pojo.Books;
import com.eighth.pojo.Sort;

public interface HomeService {
	//访问量排序
	List<Books> sortByVisit();
	//根据创建时间排序
	List<Books> sortByCreatetime();
	
	Books selectByPrimaryKey(Integer bid);
	
	Sort SelectByPrimaryKey(Integer sid);
	
	int updateByPrimaryKeySelective(Books record);
}
