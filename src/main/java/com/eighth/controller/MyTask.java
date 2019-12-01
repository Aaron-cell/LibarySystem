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

    //@Scheduled(cron="0 0 10,14,16 * * ?") // 每天上午10点，下午2点，4点执行一次
    @Scheduled(cron="0/20 * * * * ?")  // 每30秒执行一次
    public void checkTimeOut() {
    	
        // 获取所有超时记录
        List<Records> recordsList1 = recordsServiceImpl.showTimeOutRecord();
        for (Records records : recordsList1) {
        	recordsServiceImpl.updateStatusTimeOut(records);  // 更改借阅状态标识为超时
        }
        // 获取所有即将到期的记录
        List<Records> recordsList2 = recordsServiceImpl.showExpiration();
        for (Records records : recordsList2) {
        	recordsServiceImpl.updateStatusExpiration(records);  // 更改借阅状态标识为即将到期
        }

    }
}

// 获取所有借阅记录，并取出超时记录、即将到期的记录
/*List<Records> recordsList = recordServiceImpl.showAllRecord();
System.out.println(recordsList);
//List<Records> recordsList2 = null;  // 存放超时借阅记录
//List<Records> recordsList3 = null;  // 存放即将到期的借阅记录
for (Records records : recordsList) {
    if (null != recordServiceImpl.showTimeProblemRecord(records)) { // 是超时记录或即将到期记录
        recordServiceImpl.updateRecordStatus(records);  // 更改借阅状态标识为超时或即将到期
    }
    if (null != recordServiceImpl.showTimeOutRecord(records)) { // 是超时记录
        //recordsList2.add(records);
        recordServiceImpl.updateRecordStatus(records);  // 更改借阅状态标识为超时
    } else if (1==recordServiceImpl.showExpiration(records)) { // 是即将到期的的记录
        //recordsList3.add(records);
        recordServiceImpl.updateRecordStatus(records);  // 更改借阅状态标识为即将到期
    }
}*/