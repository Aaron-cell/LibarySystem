package com.eighth.service;

import java.util.List;

import com.eighth.pojo.Records;

public interface RecordsService {
	
	int insert(Records record);
	
	Records selectByPrimaryKey(Integer rid);
	
	int updateByPrimaryKeySelective(Records record);
	
	List<Records> showAllRecord();//��ʾ���н��ļ�¼
    List<Records> searchByRecordStatus(Integer status);//��ѯָ������״̬�ļ�¼
    int updateByRid(Records record);// ������id���Ľ���״̬

    List<Records> showTimeOutRecord();  // ��ѯ��ʱ�Ľ��ļ�¼
    List<Records> showExpiration(); // ��ѯ�������ڵĽ��ļ�¼

    int updateStatusTimeOut(Records record); // ���Ľ���״̬��ʶΪ��ʱ
    int updateStatusExpiration(Records record); // ���Ľ���״̬Ϊ��������
}
