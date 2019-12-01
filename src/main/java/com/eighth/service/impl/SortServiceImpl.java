package com.eighth.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eighth.mapper.SortMapper;
import com.eighth.pojo.Sort;
import com.eighth.service.SortService;
@Service
public class SortServiceImpl implements SortService {
	@Autowired
	SortMapper sortMapper;
	//��ѯ���з���
	@Override
	public List<Sort> selectAll() {
		// TODO Auto-generated method stub
		return sortMapper.selectAll();
	}
	
	@Override
    public List<Sort> showSort() {
        return sortMapper.showSort();
    }

    // ע������showSortId�ķ�������ΪInteger
    @Override
    public Integer showSortId(String sortname) {
        return sortMapper.showSortId(sortname);
    }

}
