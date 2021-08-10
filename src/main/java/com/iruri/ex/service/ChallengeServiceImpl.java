package com.iruri.ex.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iruri.ex.mapper.ChallengeMapper;
import com.iruri.ex.mapper.IClassMapper;
import com.iruri.ex.page.Criteria;
import com.iruri.ex.vo.IClassVO;
import com.iruri.ex.vo.IUserVO;
import com.iruri.ex.vo.LikeListVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ChallengeServiceImpl implements ChallengeService {
    
    @Autowired
    private IClassMapper iClassMapper;
    @Autowired
    private ChallengeMapper challengeMapper;
    
	
	  @Override public List<IClassVO> classList(int userId) { 
	      List<IClassVO> vo = iClassMapper.selectAll(userId); 
	      if(vo == null) { 
	          return null; 
	      } 
	      return vo; 
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
   
   
  
    //챌린지 개설 폼 값 입력
    @Override
    public void insertChallenge(IClassVO iClassVO) {
        log.info("insertChallenge");
        
        challengeMapper.insertChallenge(iClassVO);
        
    }

    /*----------챌린지 메인-----------*/
    //전체 챌린지
    @Override
    public List<IClassVO> challengeList(Criteria criteria) {
        log.info("getList()..");
      
        return challengeMapper.getListWithPaging_challenge(criteria);
    }

    @Override
    public int getTotal_challenge(Criteria cri) {
        log.info("getTotal_Challenge()..");
        return challengeMapper.getTotalCount_challenge(cri);
    }

   
    //지난 챌린지 
    @Override
    public List<IClassVO> challengeEndList(Criteria criteria) {
        log.info("get challengeEndList()..");
        return challengeMapper.getListWithPaging_challengeEndList(criteria);
    }

    @Override
    public int getTotal_challengeEndList(Criteria cri) {
        log.info("getTotal_challengeEndList()..");
        return challengeMapper.getTotalCount_challengeEndList(cri);
    }

   
    //관심 챌린지
    @Override
    public List<IClassVO> challengeLikeList(Criteria cri, int userId) {
       
        log.info("get challengeLikeList()..");
        
        //자꾸 parameter not found 떠서 하나하나 다 넣음.
        int pageNum = cri.getPageNum();
        int amount = cri.getAmount();
        String keyword = cri.getKeyword();
        
        return challengeMapper.getListWithPaging_challengeLikeList(pageNum, amount, keyword, userId);
    }

    @Override
    public int getTotal_challengeLikeList(Criteria cri, int userId) {
        log.info("getTotal_challengeLikeList()..");
        
        String keyword = cri.getKeyword();
        
        return challengeMapper.getTotalCount_challengeLikeList(keyword, userId);
    }

    //챌린지 상세 페이지
    @Override
    public IClassVO getChallengeInfo(int classId) {
        log.info("getChallengeInfo()..");
        return challengeMapper.readChallengeInfo(classId);
    }

    //챌린지 참여인원
    @Override
    public void upJoinMember(int classId) {
        
        challengeMapper.upJoinMember(classId);
        
    }






 
}
