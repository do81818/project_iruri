package com.iruri.ex.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.iruri.ex.page.Criteria;
import com.iruri.ex.vo.BoardVO;
import com.iruri.ex.vo.BuyVO;
import com.iruri.ex.vo.IClassVO;
import com.iruri.ex.vo.IUserVO;
import com.iruri.ex.vo.LikeListVO;

public interface ChallengeService {
    
    
    // 3. 서비스에서 함수 만들기 selectOne(principal 객체의 이메일을 받는다.)
    List<IClassVO> classList(int userId);
    
    
    //챌린지 개설 폼
    void insertChallenge(IClassVO iClassVO);
    
    /*----------챌린지 메인-----------*/
    //전체 챌린지 리스트
    List<IClassVO> challengeList(Criteria criteria);
    int getTotal_challenge(Criteria cri);

    
    //지난 챌린지 리스트
    List<IClassVO> challengeEndList(Criteria criteria);
    int getTotal_challengeEndList(Criteria cri);
    
    //관심 챌린지 리스트
    List<IClassVO> challengeLikeList(Criteria cri, int userId);
    int getTotal_challengeLikeList(Criteria cri, int userId);
    
    /*----------챌린지 상세페이지-----------*/
    //챌린지 상세페이지 정보
    IClassVO getChallengeInfo(int classId);
    
    //챌린지 참여인원
    public void upJoinMember(int classId);
    
    //유저 챌린지 참여 등록(likelist insert)
    void userJoinChallenge(BuyVO buyVO);
    
    /*----------관심수-----------*/
    
    int getUserHeartList(int classId, int userId);
    
    //유저가 그 클래스에 좋아요 한 기록이 있는지 
    int getUserLikeListCheck(int classId, int userId);

    //likelist 삭제
    void challenge_likeDelete(int classId, int userId);
    
    //관심수 줄이기
    void challenge_likeCountDown(int classId);

    //likelist 추가
    void challenge_likeInsert(int classId, int userId);
    
    //관심수 늘리기
    void challenge_likeCountUp(int classId);

    /*----------챌린지 커뮤니티-----------*/
    //챌린지 댓글 총 갯수
    int getTotal_challengeReply(Criteria cri, int classId);
    List<BoardVO> challengeReplyList(Criteria criteria, int classId);


  
 

}
