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
    
    List<Records> showAllRecord();//显示所有借阅记录
    List<Records> searchByRecordStatus(Integer status);//查询指定借阅状态的记录
    int updateByRid(Records record);// 按借阅id更改借阅状态

    List<Records> showTimeOutRecord();  // 查询超时的借阅记录
    List<Records> showExpiration(); // 查询即将到期的借阅记录
    int updateStatusTimeOut(Records record); // 更改借阅状态标识为超时
    int updateStatusExpiration(Records record); // 更改借阅状态为即将到期
    
}