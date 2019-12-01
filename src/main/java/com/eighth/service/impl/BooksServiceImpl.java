package com.eighth.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.eighth.mapper.BooksMapper;
import com.eighth.pojo.Books;
import com.eighth.service.BooksService;
@Service
public class BooksServiceImpl implements BooksService {
	@Autowired
	BooksMapper booksMapper;
	@Override
	public List<Books> selectSortByType(int sid) {

		return booksMapper.selectSortByType(sid);
	}
	@Override
	public List<Books> limitSelectByType(Integer sid, Integer start, Integer count) {
		// TODO Auto-generated method stub
		return booksMapper.limitSelectByType(sid, start, count);
	}
	@Override
	public List<Books> selectByName(String name) {
		
		return booksMapper.selectByName(name);
	}
	@Override
	public Books selectByPrimaryKey(Integer bid) {
		// TODO Auto-generated method stub
		return booksMapper.selectByPrimaryKey(bid);
	}
	@Override
	public int updateByPrimaryKeySelective(Books record) {
		// TODO Auto-generated method stub
		return booksMapper.updateByPrimaryKeySelective(record);
	}
	@Override
    public List<Books> showBooks() {
        return booksMapper.showBooks();
    }

    @Override
    public List<Books> showSortBook(int sortId) {
        return booksMapper.showSortBook(sortId);
    }

    @Override
    public List<Books> searchByBookName(String information) {
        return booksMapper.searchByBookName(information);
    }

    @Override
    public List<Books> searchByAuthor(String information) {
        return booksMapper.searchByAuthor(information);
    }

    @Override
    public int addBook(Books book) {
        return booksMapper.addBook(book);
    }

    /*
     * 在方法上加入事务注解
     * 当批量删除遇到错误时 事务回滚
     */
    @Override
    @Transactional(propagation= Propagation.REQUIRED,rollbackForClassName="Exception")
    public int deleteBook(List<Integer> idList) {
        int count = 0;
        // 循环删除书籍
        for (int i=0;i<idList.size();i++) {
            count = booksMapper.deleteBookById(idList.get(i));
            count++;
        }
        return count;
    }

    @Override
    public int updateByPrimaryKey(Books record) {
        return booksMapper.updateByPrimaryKey(record);
    }
	@Override
	public List<Books> selectAllByVisit(int count) {
		// TODO Auto-generated method stub
		return booksMapper.selectAllByVisit(count);
	}

}
