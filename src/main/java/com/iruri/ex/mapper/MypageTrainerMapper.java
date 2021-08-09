package com.iruri.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.iruri.ex.page.Criteria;
import com.iruri.ex.vo.IClassVO;
import com.iruri.ex.vo.IUserVO;
import com.iruri.ex.vo.ProfitVO;
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
    int monthProfit(int userId);
    
    // 트레이너 수익 리스트 
    int getTotalCount_mypageTrainerProfit(Criteria cri, @Param("userId") int userId);
    List<ProfitVO> profitList(@Param("cri") Criteria cri, @Param("userId") int userId);
}
