package com.eighth.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eighth.mapper.BooksMapper;
import com.eighth.mapper.PersonMapper;
import com.eighth.mapper.RecordsMapper;
import com.eighth.pojo.Books;
import com.eighth.pojo.Person;
import com.eighth.pojo.Records;
import com.eighth.service.PersonalCenterService;
@Service
public class PersonalCenterServiceImpl implements PersonalCenterService {
	@Autowired
	PersonMapper personMapper;
	@Autowired
	BooksMapper booksMapper;
	@Autowired
	RecordsMapper recordsMapper;
	@Override
	public Person selectByPrimaryKey(String username) {
		return personMapper.selectByPrimaryKey(username);
	}
	
	@Override
	public int insertSelective(Person record) {
		return personMapper.insertSelective(record);
	}

	@Override
	public List<Books> selectByBid(String[] str) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Records> selectByUsername(String username) {
		return recordsMapper.selectByUsername(username);
	}

//	@Override
//	public List<Books> selectByBid(String[] str) {
//		List<Books> list=new ArrayList<Books>();
//		for(int i=0;i<str.length;i++) {
//			int bid=Integer.parseInt(str[i]);
//			Books book=booksMapper.selectByPrimaryKey(bid);
//			//这里考虑如果管理员把书籍删除了 
//			if(book!=null) {
//				list.add(book);
//			}	
//		}
//		return list;
//	}
	//更新个人中心数据
		@Override
		public int updateByPrimaryKeySelective(Person record) {
		
			return personMapper.updateByPrimaryKeySelective(record);
		}

}
