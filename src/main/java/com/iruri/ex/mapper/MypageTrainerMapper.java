package com.iruri.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.iruri.ex.page.Criteria;
import com.iruri.ex.vo.BoardVO;
import com.iruri.ex.vo.IClassVO;
import com.iruri.ex.vo.ICommentVO;
import com.iruri.ex.vo.IUserVO;
import com.iruri.ex.vo.ProfitVO;
import com.iruri.ex.vo.TableJoinVO;
import com.iruri.ex.vo.trainerUserManagementVO;
import com.iruri.ex.vo.BuyVO;
import com.iruri.ex.vo.ExerciseDateVO;
import com.iruri.ex.vo.ExerciseKindVO;

@Mapper
public interface MypageTrainerMapper {
    
    // 운영중인 클래스 갯수
    int countMypageTrainerClass(int userId);
    
    // 총수익
    int trainerProfit(int userId);
    
    // 이달의 수익
    int getTotalCount_monthProfit(Criteria cri, @Param("userId") int userId);
    
    List<ProfitVO> monthProfitList(@Param("userId") int userId);
    
    // 트레이너 수익 리스트 
    int getTotalCount_mypageTrainerProfit(Criteria cri, @Param("userId") int userId);
    List<ProfitVO> profitList(@Param("cri") Criteria cri, @Param("userId") int userId);
    
    
    
    // 특정 트레이너가 개설한 클래스 리스트
    List<IClassVO> pagingTrainerClassList(@Param("cri") Criteria cri, @Param("userId") int userId);
    
    // 특정 트레이너가 개설한 클래스 리스트
    Integer countPagingClassList(@Param("cri") Criteria cri, @Param("userId") int userId);
    
    // 클래스에 등록한 유저 리스트
    List<TableJoinVO> ClassBuyUserList();
    
    // 해당 클래스의 특정 유저에 대한 코멘트 리스트
    List<ICommentVO> ClassBuyUserCommentList(@Param("userId") int userId, @Param("classId") int classId);
    
    void insertComment(@Param("userId") int userId, @Param("classId") int classId, @Param("commentContent") String commentContent);
   
    
    
    
    // 클래스 댓글조회
    List<BoardVO> classReplyList(@Param("cri") Criteria cri, @Param("userId") int userId);
    
    Integer countReply(Criteria cri, @Param("userId") int userId);
    
}
