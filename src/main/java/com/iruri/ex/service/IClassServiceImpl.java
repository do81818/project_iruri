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
    
    @Override
    public List<IClassVO> classList(int userId) {
        List<IClassVO> vo = iClassMapper.selectAll(userId);
        if(vo == null) {
            return null;
        }
        return vo;
    }

    //챌린지 메인 리스트
    @Override
    public List<IClassVO> challengeList() {
        List<IClassVO> vo = iClassMapper.ChallengeSelectAll();
        if(vo == null) {
            return null;
        }
        return vo;
    }
   
   
  
    //챌린지 개설 폼 값 입력
    @Override
    public void insertChallenge(IClassVO iClassVO) {
        log.info("insertChallenge");
        
        iClassMapper.insertChallenge(iClassVO);
        
    }

  
    //챌린지 메인 페이징
    @Override
    public List<IClassVO> getList(Criteria criteria) {
        log.info("getList()..");
      
        return iClassMapper.getListWithPaging(criteria);
    }

    @Override
    public int getTotal(Criteria cri) {
        log.info("service:getTotal()..");
        return iClassMapper.getTotalCount(cri);
    }




 
}
