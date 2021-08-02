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
    // 모든
    @Override
    public List<IClassVO> classList(int userId) {
        List<IClassVO> vo = iClassMapper.selectAll(userId);
        if(vo == null) {
            return null;
        }
        return vo;
    }


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
    
    @Override
    public List<IClassVO> mainPageChallengeList() {
        
        return iClassMapper.mainPageChallengeList();
    }


    //챌린지 메인 리스트
    /*
    @Override
    public List<IClassVO> challengeList() {
        List<IClassVO> vo = iClassMapper.ChallengeSelectAll();
        if(vo == null) {
            return null;
        }
        return vo;
    }
    */
   
   
  
    /*
    //챌린지 개설 폼 값 입력
    @Override
    public void insertChallenge(IClassVO iClassVO) {
        log.info("insertChallenge");
        
        iClassMapper.insertChallenge(iClassVO);
        
    }

  
    //챌린지 메인 페이징
    @Override
    public List<IClassVO> challengeList(Criteria criteria) {
        log.info("getList()..");
      
        return iClassMapper.getListWithPaging_challenge(criteria);
    }

    @Override
    public int getTotal_challenge(Criteria cri) {
        log.info("getTotal_Challenge()..");
        return iClassMapper.getTotalCount_challenge(cri);
    }

   
    //지난 챌린지 
    @Override
    public List<IClassVO> challengeEndList(Criteria criteria) {
        log.info("get challengeEndList()..");
        return iClassMapper.getListWithPaging_challengeEndList(criteria);
    }

    @Override
    public int getTotal_challengeEndList(Criteria cri) {
        log.info("getTotal_challengeEndList()..");
        return iClassMapper.getTotalCount_challengeEndList(cri);
    }

  */




 
}
