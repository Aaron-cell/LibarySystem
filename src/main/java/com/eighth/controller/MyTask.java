package com.eighth.controller;

import com.eighth.pojo.Records;
import com.eighth.service.impl.RecordsServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class MyTask {

    @Autowired
    RecordsServiceImpl recordsServiceImpl;

    //@Scheduled(cron="0 0 10,14,16 * * ?") // ÿ������10�㣬����2�㣬4��ִ��һ��
    @Scheduled(cron="0/20 * * * * ?")  // ÿ30��ִ��һ��
    public void checkTimeOut() {
    	
        // ��ȡ���г�ʱ��¼
        List<Records> recordsList1 = recordsServiceImpl.showTimeOutRecord();
        for (Records records : recordsList1) {
        	recordsServiceImpl.updateStatusTimeOut(records);  // ���Ľ���״̬��ʶΪ��ʱ
        }
        // ��ȡ���м������ڵļ�¼
        List<Records> recordsList2 = recordsServiceImpl.showExpiration();
        for (Records records : recordsList2) {
        	recordsServiceImpl.updateStatusExpiration(records);  // ���Ľ���״̬��ʶΪ��������
        }

    }
}

// ��ȡ���н��ļ�¼����ȡ����ʱ��¼���������ڵļ�¼
/*List<Records> recordsList = recordServiceImpl.showAllRecord();
System.out.println(recordsList);
//List<Records> recordsList2 = null;  // ��ų�ʱ���ļ�¼
//List<Records> recordsList3 = null;  // ��ż������ڵĽ��ļ�¼
for (Records records : recordsList) {
    if (null != recordServiceImpl.showTimeProblemRecord(records)) { // �ǳ�ʱ��¼�򼴽����ڼ�¼
        recordServiceImpl.updateRecordStatus(records);  // ���Ľ���״̬��ʶΪ��ʱ�򼴽�����
    }
    if (null != recordServiceImpl.showTimeOutRecord(records)) { // �ǳ�ʱ��¼
        //recordsList2.add(records);
        recordServiceImpl.updateRecordStatus(records);  // ���Ľ���״̬��ʶΪ��ʱ
    } else if (1==recordServiceImpl.showExpiration(records)) { // �Ǽ������ڵĵļ�¼
        //recordsList3.add(records);
        recordServiceImpl.updateRecordStatus(records);  // ���Ľ���״̬��ʶΪ��������
    }
}*/