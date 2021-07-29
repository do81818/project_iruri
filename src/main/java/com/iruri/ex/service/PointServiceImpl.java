package com.iruri.ex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iruri.ex.mapper.BoardMapper;
import com.iruri.ex.mapper.IClassMapper;
import com.iruri.ex.mapper.PointMapper;
import com.iruri.ex.vo.BoardVO;
import com.iruri.ex.vo.IClassVO;
import com.iruri.ex.vo.IUserVO;
import com.iruri.ex.vo.PointVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class PointServiceImpl implements PointService {
    
    @Autowired
    private PointMapper pointMapper;
    
    
    // 현재 포인트
    @Override
    public int savepoint(int userId) {

        int vo = pointMapper.savepoint(userId);

        return vo;
    }
    
    @Override
    public int appointedpoint(int userId) {
    	int vo = pointMapper.appointedpoint(userId);
    	return vo;
    }
    
    
    @Override
    public int usepoint(int userId) {
    	int vo = pointMapper.usepoint(userId);
    	return vo;
    }
    
    @Override
    public int totalpoint(int userId) {
    	int vo = pointMapper.totalpoint(userId);
    	return vo;
    }
    
    @Override
    public List<PointVO> pointList(int userId){
    	List<PointVO> vo = pointMapper.pointList(userId);
    	if(vo == null) {
    		return null;
    	}
    	return vo;
    			}
    
    
    

    



}
