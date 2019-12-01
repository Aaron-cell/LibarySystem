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
    
    List<Sort> showSort();  // ��ʾ�鼮����

    // ע������showSortId�ķ�������ΪInteger
    Integer showSortId(String sortname);   // ��ȡ�������ƶ�Ӧ�ķ���id
}