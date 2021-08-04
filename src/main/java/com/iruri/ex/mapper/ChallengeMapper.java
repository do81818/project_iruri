
package com.iruri.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.iruri.ex.page.Criteria;
import com.iruri.ex.vo.IClassVO;
import com.iruri.ex.vo.IUserVO;
import com.iruri.ex.vo.LikeListVO;

@Mapper
public interface ChallengeMapper {
    
   
    
    // 6. 메퍼에서 메소드를 만든다 servicelImpl에서받는 메소드이다.
    List<IClassVO> selectAll(int userId);
    
    
    
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
    
    //챌린지 참여 인원
    void upJoinMember(int classId);
  
}
