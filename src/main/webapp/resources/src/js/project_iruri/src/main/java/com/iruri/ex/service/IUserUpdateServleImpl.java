package com.iruri.ex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iruri.ex.mapper.IUserInfoMapper;
import com.iruri.ex.mapper.IUserMapper;
import com.iruri.ex.mapper.IUserUpdateMapper;
import com.iruri.ex.vo.IUserInfoVO;
import com.iruri.ex.vo.IUserVO;

import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class IUserUpdateServleImpl implements IUserUpdateService {

    
    @Autowired
    private IUserUpdateMapper iuserUpdateMapper;
    
    @Override
    public void update(IUserVO iuservo) {
    	log.info("update");
        iuserUpdateMapper.update(iuservo);
        
    }
    
    @Override
    public void infoupdate(IUserInfoVO iuserinfovo) {
    	log.info("infoupdate");
    	iuserUpdateMapper.infoupdate(iuserinfovo);
    }
   

}
