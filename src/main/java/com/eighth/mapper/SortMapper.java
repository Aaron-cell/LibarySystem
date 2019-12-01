package com.eighth.mapper;

import com.eighth.pojo.Sort;
import com.eighth.pojo.SortExample;
import java.util.List;

public interface SortMapper {
    int deleteByPrimaryKey(Integer sid);

    int insert(Sort record);

    int insertSelective(Sort record);

    List<Sort> selectByExample(SortExample example);

    Sort selectByPrimaryKey(Integer sid);

    int updateByPrimaryKeySelective(Sort record);

    int updateByPrimaryKey(Sort record);
    
    List<Sort> selectAll();
    
    List<Sort> showSort();  // 显示书籍分类

    // 注意这里showSortId的返回类型为Integer
    Integer showSortId(String sortname);   // 获取分类名称对应的分类id
}