package com.iruri.ex.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iruri.ex.mapper.ChallengeMapper;
import com.iruri.ex.mapper.IClassMapper;
import com.iruri.ex.page.Criteria;
import com.iruri.ex.vo.BoardVO;
import com.iruri.ex.vo.BuyVO;
import com.iruri.ex.vo.IClassVO;
import com.iruri.ex.vo.IUserVO;
import com.iruri.ex.vo.LikeListVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ChallengeServiceImpl implements ChallengeService {
    
    @Autowired
    private IClassMapper iClassMapper;
    @Inject
    private ChallengeMapper challengeMapper;
    
	
	  @Override public List<IClassVO> classList(int userId) { 
	      List<IClassVO> vo = iClassMapper.selectAll(userId); 
	      if(vo == null) { 
	          return null; 
	      } 
	      return vo; 
	  }
	 
	/*----------챌린지 개설 폼-----------*/
    //챌린지 개설 폼 값 입력
    @Override
    public void insertChallenge(IClassVO iClassVO) {   
        log.info("insertChallenge: " + iClassVO);
        
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

    
    /*----------챌린지 상세페이지-----------*/
    //챌린지 상세 페이지
    @Override
    public IClassVO getChallengeInfo(int classId) {
        log.info("getChallengeInfo()..");
        return challengeMapper.readChallengeInfo(classId);
    }
    
    //챌린지 참여 기록 체크
    @Override
    public int getUserJoinChallengeListCheck(int classId, int userId) {
        log.info("challenge_userLikeListCheck()..");
        
        int check = challengeMapper.userJoinChallengeList(classId, userId);
        
        log.info(check);
        
        if(check == 0) { // 안참여한거 
            // userJoinChallenge(buyId, userId);
            // upJoinMember(classId);
            
            return 0;
        }
        
        return check;
    }


    //챌린지 참여인원 1증가
    @Override
    public void upJoinMember(int classId) {
        
        challengeMapper.upJoinMember(classId);
        log.info("upJoinMember()..");
        
    }

    
    //유저 챌린지 참여 후 likelist insert
    @Override
    public void userJoinChallenge(BuyVO buyVO, int userId) {
        log.info("userJoinChallenge()..");
        challengeMapper.insertUserJoinChallenge(buyVO, userId);
        
    }
    
    
    /*----------관심수-----------*/
    
    
    @Override
    public int getUserHeartList(int classId, int userId) {
        log.info("challenge_userLikeListCheck()..");
        
        int check = challengeMapper.userLikeListCheck(classId,  userId);
        
        return check;
    }
    
    
    @Override
    public int getUserLikeListCheck(int classId, int userId) {
        log.info("challenge_userLikeListCheck()..");
        
        int check = challengeMapper.userLikeListCheck(classId,  userId);
        
        if(check > 0) {
            challenge_likeDelete(classId, userId);
            challenge_likeCountDown(classId);
        } else {
            challenge_likeInsert(classId, userId);
            challenge_likeCountUp(classId);
        }
        
        return check;
    }

    //좋아요 리스트 삭제
    @Override
    public void challenge_likeDelete(int classId, int userId) {
        log.info("challenge_likeDelete()..");
        challengeMapper.challengeLikeDelete(classId, userId);
    }

    //좋아요 리스트 추가
    @Override
    public void challenge_likeInsert(int classId, int userId) {
        log.info("challenge_likeInsert()..");
        challengeMapper.challengeLikeInsert(classId, userId);
    }

    //좋아요 수 1증가
    @Override
    public void challenge_likeCountUp(int classId) {
        log.info("challenge_likeCountUp()..");
        challengeMapper.likeCountUp(classId);
    }
    
    //좋아요 수 1감소
    @Override
    public void challenge_likeCountDown(int classId) {
        log.info("challenge_likeCountDown()..");
        challengeMapper.likeCountDown(classId);
    }

    
  


    /*----------챌린지 커뮤니티-----------*/
    //챌린지 댓글
    @Override
    public int getTotal_challengeReply(Criteria cri, int classId) {
        log.info("getTotal_challengeReply()..");
        return challengeMapper.getTotalCount_challengeReply(cri,classId);
    }

    @Override
    public List<BoardVO> challengeReplyList(Criteria cri, int classId) {
        log.info("challengeReplyList()..");
        
        int pageNum = cri.getPageNum();
        int amount = cri.getAmount();
        
        return challengeMapper.getListWithPaging_challengeReply(pageNum, amount,classId);
    }

    //댓글 입력
    @Override
    public void challengeReplyInsert(BoardVO boardVO, int classId) {
        log.info("challenge reply insert()..");
        challengeMapper.challengeReplyInsert(boardVO, classId);
    }

    //댓글 userId
    @Override
    public BoardVO getUserId(IUserVO iUserVO) {
        log.info("get userId : " + iUserVO.getUserId());
        return challengeMapper.readUserId(iUserVO);
    }
    
    // 인증글 추가
    @Override
    public void insertChallengeCertify(BoardVO boardVO) {
        log.info("insertChallengeCertify() .. " + boardVO);
        
        challengeMapper.insertChallengeCertify(boardVO);
    }

    
    //인증글 리스트
    @Override
    public int getTotal_challengeImg(Criteria cri, int classId) {
        log.info("getTotal_challengeImg()..");
        return challengeMapper.getTotalCount_challengeImg(cri, classId);
    }

    @Override
    public List<BoardVO> challengeImgList(Criteria cri, int classId) {
        log.info("challengeImgList()..");
        
        int pageNum = cri.getPageNum();
        int amount = cri.getAmount();
        
        return challengeMapper.getListWithPaging_challengeImg(pageNum, amount, classId);
    }






 
}
