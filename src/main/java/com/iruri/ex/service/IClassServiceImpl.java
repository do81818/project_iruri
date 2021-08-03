package com.iruri.ex.service;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iruri.ex.mapper.IClassMapper;
import com.iruri.ex.page.Criteria;
import com.iruri.ex.vo.IClassVO;
import com.iruri.ex.vo.IUserVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class IClassServiceImpl implements IClassService {
    
    @Autowired
    private IClassMapper iClassMapper;

    // 현재 운영중인 클래스 조회
    @Override
    public List<IClassVO> classCurrentList(int userId) {
        List<IClassVO> vo = iClassMapper.selectAllCurrent(userId);
        if(vo == null) {
            return null;
        }
        return vo;
    }
    
    
    // 현재 종료된 클래스 조회
    @Override
    public List<IClassVO> classEndList(int userId) {
        List<IClassVO> vo = iClassMapper.selectAllEnd(userId);
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
  
   

    // 클래스 페이징
    @Override
    public int getTotal(int userId, Criteria cri) {
        return iClassMapper.getTotalCount(userId,cri);
    }

    @Override
    public List<IClassVO> getList(int userId,Criteria cri) {
        return iClassMapper.getListWithPaging(userId,cri);
    }



 
}
