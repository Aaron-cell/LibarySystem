package com.eighth.service;

import java.util.List;

import com.eighth.pojo.Sort;

public interface SortService {
	
	List<Sort> selectAll();
	
	List<Sort> showSort();  // ��ʾ�鼮����

    // ע������showSortId�ķ�������ΪInteger
    Integer showSortId(String sortname);   // ��ȡ�������ƶ�Ӧ�ķ���id
}
