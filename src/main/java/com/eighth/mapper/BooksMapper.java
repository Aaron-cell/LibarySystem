package com.eighth.mapper;

import com.eighth.pojo.Books;
import com.eighth.pojo.BooksExample;
import java.util.List;

public interface BooksMapper {
    int deleteByPrimaryKey(Integer bid);

    int insert(Books record);

    int insertSelective(Books record);

    List<Books> selectByExample(BooksExample example);

    Books selectByPrimaryKey(Integer bid);

    int updateByPrimaryKeySelective(Books record);

    int updateByPrimaryKey(Books record);
    
    List<Books> sortByVisit();
    
    List<Books> sortByCreatetime();
    
    List<Books> selectSortByType(int sid);
    
    List<Books> limitSelectByType(Integer sid,Integer start,Integer count);
    
    List<Books> selectByName(String name);
    
    List<Books> showBooks(); // 显示所有书籍

    List<Books> showSortBook(int sortId);    // 显示分类书籍

    List<Books> searchByBookName(String information);

    List<Books> searchByAuthor(String information);

    int addBook(Books book);    // 添加书籍

    int deleteBookById(int bid);  // 删除
    
    List<Books> selectAllByVisit(int count);


}