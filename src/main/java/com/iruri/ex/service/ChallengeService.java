package com.iruri.ex.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.iruri.ex.page.Criteria;
import com.iruri.ex.vo.BoardVO;
import com.iruri.ex.vo.BuyVO;
import com.iruri.ex.vo.IClassVO;
import com.iruri.ex.vo.IUserVO;
import com.iruri.ex.vo.LikeListVO;
import com.iruri.ex.vo.ReportVO;

public interface ChallengeService {
    
    
    // 3. 서비스에서 함수 만들기 selectOne(principal 객체의 이메일을 받는다.)
    List<IClassVO> classList(int userId);
    
    
    /*----------챌린지 개설폼-----------*/
    //챌린지 개설 폼
    void insertChallenge(IClassVO iClassVO);
    
    /*----------챌린지 메인-----------*/
    //추천 챌린지
    List<IClassVO> getChallengeRecommendInfo(int classId);
    
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
    
    //챌린지 참여 기록 체크
    int getUserJoinChallengeListCheck(int classId, int userId);
    
    
    //유저 챌린지 참여 등록(buy insert)
    void userJoinChallenge(BuyVO buyVO, int userId);
    
    //챌린지 참여인원
    public void upJoinMember(int classId);
    
    
    /*----------관심수-----------*/
    //유저의 likelist를 체크해서 존재하면 하트를 유지
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

    //챌린지 댓글 입력
    void challengeReplyInsert(BoardVO boardVO, int classId);
    
    //댓글 삭제
    void deleteChallengeReply(int boardId, int userId);
    
    //댓글 수정
    void modifyChallengeReply(BoardVO boardVO);
    
    //댓글 신고
    void challengeReplyReportInsert(ReportVO reportVO);
    
    //댓글 숨기기
    void blindChallengeReply(BoardVO boardVO, int userId);

    //댓글 유저 
    BoardVO getUserId(IUserVO iUserVO);

    // 인증글 추가
    void insertChallengeCertify(BoardVO boardVO);
    
    // 인증글 수정
    void modifyChallengeCertify(BoardVO boardVO);
    
    // 인증글 삭제
    void deleteChallengeCertify(int boardId, int userId);

    //인증글 리스트 페이징
    int getTotal_challengeImg(Criteria cri, int classId);
    List<BoardVO> challengeImgList(Criteria cri, int classId);


    


  


    


    






 

}
