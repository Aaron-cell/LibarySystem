package com.eighth.mapper;

import com.eighth.pojo.Records;
import com.eighth.pojo.RecordsExample;
import java.util.List;

public interface RecordsMapper {
    int deleteByPrimaryKey(Integer rid);

    int insert(Records record);

    int insertSelective(Records record);

    List<Records> selectByExample(RecordsExample example);

    Records selectByPrimaryKey(Integer rid);

    int updateByPrimaryKeySelective(Records record);

    int updateByPrimaryKey(Records record);
    
    List<Records> selectByUsername(String username);
    
    List<Records> showAllRecord();//��ʾ���н��ļ�¼
    List<Records> searchByRecordStatus(Integer status);//��ѯָ������״̬�ļ�¼
    int updateByRid(Records record);// ������id���Ľ���״̬

    List<Records> showTimeOutRecord();  // ��ѯ��ʱ�Ľ��ļ�¼
    List<Records> showExpiration(); // ��ѯ�������ڵĽ��ļ�¼
    int updateStatusTimeOut(Records record); // ���Ľ���״̬��ʶΪ��ʱ
    int updateStatusExpiration(Records record); // ���Ľ���״̬Ϊ��������
    
}