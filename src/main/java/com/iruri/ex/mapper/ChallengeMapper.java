
package com.iruri.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.iruri.ex.page.Criteria;
import com.iruri.ex.vo.BoardVO;
import com.iruri.ex.vo.BuyVO;
import com.iruri.ex.vo.IClassVO;
import com.iruri.ex.vo.IUserVO;
import com.iruri.ex.vo.LikeListVO;

import lombok.extern.log4j.Log4j;

@Mapper
public interface ChallengeMapper {
    
   
    
    
    // 6. 메퍼에서 메소드를 만든다 servicelImpl에서받는 메소드이다.
    List<IClassVO> selectAll(int userId);

    
    /*----------챌린지 개설 폼-----------*/
    //챌린지 개설 폼
    void insertChallenge(IClassVO iClassVO);

    /*----------챌린지 메인-----------*/
    //챌린지 메인 리스트
    List<IClassVO> ChallengeSelectAll();
    //지난 챌린지 리스트
    List<IClassVO> selectAllEnd_challenge();
    
    //전체 챌린지
    List<IClassVO> getListWithPaging_challenge(Criteria criteria);
    int getTotalCount_challenge(Criteria cri);
    
    //지난 챌린지 
    List<IClassVO> getListWithPaging_challengeEndList(Criteria criteria);
    int getTotalCount_challengeEndList(Criteria cri);
    
    //관심 챌린지 
    List<IClassVO> getListWithPaging_challengeLikeList(@Param("pageNum") int pageNum, @Param("amount") int amount, @Param("keyword") String keyword, @Param("userId") int userId);
    int getTotalCount_challengeLikeList(@Param("keyword") String keyword, @Param("userId") int userId);
    
    /*----------챌린지 상세페이지-----------*/
    //챌린지 상세페이지 정보
    IClassVO readChallengeInfo(int classId);
    
    //유저가 챌린지 참여한 기록이 있는지
    int userJoinChallengeList(@Param("classId") int classId, @Param("userId") int userId);
    
    //챌린지 참여 인원
    void upJoinMember(@Param("classId") int classId);
    
    //유저 챌린지 참여 등록(likelist insert)
    void insertUserJoinChallenge(@Param("buyVO") BuyVO buyVO, @Param("userId") int userId);
    
    /*----------관심수-----------*/
    //유저가 그 클래스에 좋아요 한 기록이 있는지 
    int userLikeListCheck(@Param("classId") int classId,  @Param("userId") int userId);
    
    //likelist 삭제
    void challengeLikeDelete(@Param("classId") int classId,  @Param("userId") int userId);
    
    //관심수 줄이기
    void likeCountDown(int classId);

    //likelist 추가
    void challengeLikeInsert(@Param("classId") int classId,  @Param("userId") int userId);
    
    //관심수 늘리기
    void likeCountUp(int classId);

  
    /*----------챌린지 커뮤니티-----------*/
    //챌린지 댓글
    int getTotalCount_challengeReply(Criteria cri, @Param("classId") int classId);
    List<BoardVO> getListWithPaging_challengeReply(@Param("pageNum") int pageNum, @Param("amount") int amount, @Param("classId") int classId);


    //댓글 입력
    void challengeReplyInsert(@Param("boardVO") BoardVO boardVO, @Param("classId") int classId);

    //댓글 userId
    BoardVO readUserId(IUserVO iUserVO);
    
    // 인증글 추가
    void insertChallengeCertify(BoardVO boardVO);


    //인증글 리스트
    int getTotalCount_challengeImg(Criteria cri, @Param("classId") int classId);
    List<BoardVO> getListWithPaging_challengeImg(@Param("pageNum") int pageNum, @Param("amount") int amount, @Param("classId") int classId);
  
  
}
