package com.eighth.service;

import java.util.List;

import com.eighth.pojo.Books;

public interface BooksService {
	List<Books> selectSortByType(int sid);
	
	List<Books> limitSelectByType(Integer sid,Integer start,Integer count);
	
	List<Books> selectByName(String name);
	
	Books selectByPrimaryKey(Integer bid);
	
	int updateByPrimaryKeySelective(Books record);
	
	List<Books> showBooks();

    List<Books> showSortBook(int sortId);

    List<Books> searchByBookName(String information);

    List<Books> searchByAuthor(String information);

    int addBook(Books book);

    int deleteBook(List<Integer> idList);  // ����ɾ��

    int updateByPrimaryKey(Books record);   // ������Ϣ
    
    List<Books> selectAllByVisit(int count);//�޶���ѯ
}
