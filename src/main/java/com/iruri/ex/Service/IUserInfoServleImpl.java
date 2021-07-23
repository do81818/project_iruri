package com.iruri.ex.Service;

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


    
   

}
