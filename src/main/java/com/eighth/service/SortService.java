package com.eighth.service;

import java.util.List;

import com.eighth.pojo.Sort;

public interface SortService {
	
	List<Sort> selectAll();
	
	List<Sort> showSort();  // 显示书籍分类

    // 注意这里showSortId的返回类型为Integer
    Integer showSortId(String sortname);   // 获取分类名称对应的分类id
}
