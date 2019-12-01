package com.eighth.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eighth.mapper.RecordsMapper;
import com.eighth.pojo.Records;
import com.eighth.service.RecordsService;
@Service
public class RecordsServiceImpl implements RecordsService {
	@Autowired
	RecordsMapper recordsMapper;
	@Override
	public int insert(Records record) {
		// TODO Auto-generated method stub
		return recordsMapper.insert(record);
	}
	@Override
	public Records selectByPrimaryKey(Integer rid) {
		// TODO Auto-generated method stub
		return recordsMapper.selectByPrimaryKey(rid);
	}
	@Override
	public int updateByPrimaryKeySelective(Records record) {
		// TODO Auto-generated method stub
		return recordsMapper.updateByPrimaryKeySelective(record);
	}
	@Override
    public List<Records> showTimeOutRecord() {
        return recordsMapper.showTimeOutRecord();
    }

    @Override
    public List<Records> showExpiration() {
        return recordsMapper.showExpiration();
    }

    @Override
    public int updateStatusTimeOut(Records record) {
        return recordsMapper.updateStatusTimeOut(record);
    }

    @Override
    public int updateStatusExpiration(Records record) {
        return recordsMapper.updateStatusExpiration(record);
    }

    @Override
    public List<Records> showAllRecord() {
        return recordsMapper.showAllRecord();
    }

    @Override
    public List<Records> searchByRecordStatus(Integer status) {
        return recordsMapper.searchByRecordStatus(status);
    }

    @Override
    public int updateByRid(Records record) {
        return recordsMapper.updateByRid(record);
    }

}
