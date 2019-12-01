package com.eighth.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eighth.mapper.BooksMapper;
import com.eighth.mapper.SortMapper;
import com.eighth.pojo.Books;
import com.eighth.pojo.Sort;
import com.eighth.service.HomeService;
@Service
public class HomeServiceImpl implements HomeService {
	@Autowired
	BooksMapper booksMapper;
	@Autowired
	SortMapper sortMapper;
	@Override
	public List<Books> sortByVisit() {
		return booksMapper.sortByVisit();
	}
	@Override
	public List<Books> sortByCreatetime() {
		return booksMapper.sortByCreatetime();
	}
	@Override
	public Books selectByPrimaryKey(Integer bid) {
		// TODO Auto-generated method stub
		return booksMapper.selectByPrimaryKey(bid);
	}
	@Override
	public Sort SelectByPrimaryKey(Integer sid) {
		// TODO Auto-generated method stub
		return sortMapper.selectByPrimaryKey(sid);
	}
	@Override
	public int updateByPrimaryKeySelective(Books record) {
		// TODO Auto-generated method stub
		return booksMapper.updateByPrimaryKeySelective(record);
	}

}
