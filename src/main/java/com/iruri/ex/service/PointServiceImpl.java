package com.iruri.ex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iruri.ex.mapper.BoardMapper;
import com.iruri.ex.mapper.IClassMapper;
import com.iruri.ex.mapper.PointMapper;
import com.iruri.ex.page.Criteria;
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
    	try {
    		 return pointMapper.savepoint(userId);	
		} catch (Exception e) {
			return 0;
		}

    }
    
    @Override
    public int appointedpoint(int userId) {
    	try {
    		return pointMapper.appointedpoint(userId);
		} catch (Exception e) {
			return 0;
		}
    	
    }
    
    
    @Override
    public int usepoint(int userId) {
    	try {
			return pointMapper.usepoint(userId);
		} catch (Exception e) {
			return 0;
		} 
    	
    }
    
    @Override
    public int totalpoint(int userId) {
    	
    	try {
    		int vo = pointMapper.totalpoint(userId);
    		return vo;
			
		} catch (Exception e) {
			return 1500;
		}
    }
    
    @Override
    public List<PointVO> pointList(int userId,Criteria criteria){
    	return pointMapper.pointList(userId, criteria);
    			}
    
	
	  @Override public int total(int userId) { 
		  log.info("total().."); 
	  return pointMapper.total(userId); 
	  }

    



}
