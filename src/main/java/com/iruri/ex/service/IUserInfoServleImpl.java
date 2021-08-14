package com.iruri.ex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iruri.ex.mapper.IUserInfoMapper;
import com.iruri.ex.mapper.IUserMapper;
import com.iruri.ex.vo.IUserInfoVO;
import com.iruri.ex.vo.IUserVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class IUserInfoServleImpl implements IUserInfoService {

    
    @Autowired
    private IUserInfoMapper iUserinfoMapper;
    
    @Override
    public List<IUserInfoVO> userinfoList(int userId){
    	List<IUserInfoVO> vo = iUserinfoMapper.selectAll(userId);
    	if(vo == null) {
    		return null;
    	}
    	return vo;
    }
    
    @Override
    public List<IUserInfoVO>useryearweight(int userId){
    	return iUserinfoMapper.useryearweight(userId);
    }
    
    @Override
    public List<IUserInfoVO>usermonthweight(int userId){
    	return iUserinfoMapper.usermonthweight(userId);
    }


	/*
	 * @Override public int userheightdate(int userId){
	 * 
	 * int vo = iUserinfoMapper.userheightdate(userId);
	 * 
	 * return vo;
	 * 
	 * }
	 */
   

}
