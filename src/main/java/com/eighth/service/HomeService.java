package com.eighth.service;

import java.util.List;

import com.eighth.pojo.Books;
import com.eighth.pojo.Sort;

public interface HomeService {
	//����������
	List<Books> sortByVisit();
	//���ݴ���ʱ������
	List<Books> sortByCreatetime();
	
	Books selectByPrimaryKey(Integer bid);
	
	Sort SelectByPrimaryKey(Integer sid);
	
	int updateByPrimaryKeySelective(Books record);
}
