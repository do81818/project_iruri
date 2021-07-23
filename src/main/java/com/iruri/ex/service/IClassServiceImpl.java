package com.iruri.ex.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iruri.ex.mapper.IClassMapper;
import com.iruri.ex.vo.IClassVO;
import com.iruri.ex.vo.IUserVO;

import jdk.internal.org.jline.utils.Log;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class IClassServiceImpl implements IClassService {
    
    @Autowired
    private IClassMapper iClassMapper;
    
    @Override
    public List<IClassVO> classList(int userId) {
        List<IClassVO> vo = iClassMapper.selectAll(userId);
        if(vo == null) {
            return null;
        }
        return vo;
    }
    
    
    @Override
    public int classcount(int userId) {
        
        int vo = iClassMapper.classcount(userId);
        
        return vo;
    }



}
