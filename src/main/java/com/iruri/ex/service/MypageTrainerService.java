package com.iruri.ex.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.iruri.ex.page.Criteria;
import com.iruri.ex.vo.BuyVO;
import com.iruri.ex.vo.ExerciseDateVO;
import com.iruri.ex.vo.ExerciseKindVO;
import com.iruri.ex.vo.IClassVO;
import com.iruri.ex.vo.ICommentVO;
import com.iruri.ex.vo.ProfitVO;
import com.iruri.ex.vo.TableJoinVO;
import com.iruri.ex.vo.trainerUserManagementVO;

public interface MypageTrainerService {
    
    // 운영중인 클래스 갯수
    int countMypageTrainerClass(int userId);
    
    // 수익----------------------------
    // 총수익
    int trainerProfit(int userId);
    
    // 이달의 수익
    int monthProfit(int userId);
    
    // 트레이너 수익 리스트
    int getTotal_mypageTrainerProfit(Criteria cri, int userId);
    List<ProfitVO> profitList(Criteria cri, int userId);

    // 회원관리---------------------------
    // 특정 트레이너가 개설한 클래스 리스트
    List<IClassVO> pagingTrainerClassList(Criteria cri, int userId);
    
    // 특정 트레이너가 개설한 클래스 리스트
    Integer countPagingClassList(Criteria cri, int userId);
    
    // 클래스에 등록한 유저 리스트
    List<TableJoinVO> ClassBuyUserList();
    
    // 해당 클래스의 특정 유저에 대한 코멘트 리스트
    List<ICommentVO> ClassBuyUserCommentList(int userId, int classId);
    
  
}
