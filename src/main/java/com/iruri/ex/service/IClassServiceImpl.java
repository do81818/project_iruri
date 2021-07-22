package com.iruri.ex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iruri.ex.mapper.IClassMapper;
import com.iruri.ex.vo.IClassVO;
import com.iruri.ex.vo.IUserVO;

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



}
