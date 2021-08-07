package com.iruri.ex.service;

import java.util.List;

import com.iruri.ex.page.Criteria;
import com.iruri.ex.vo.BuyVO;
import com.iruri.ex.vo.ExerciseDateVO;
import com.iruri.ex.vo.ExerciseKindVO;
import com.iruri.ex.vo.IClassVO;

public interface MypageTrainerService {
    // 운영중인 클래스 갯수
    int countMypageTrainerClass(int userId);
    
    // 총수익
    int trainerProfit(int userId);
    
    // 이달의 수익
    int monthProfit(int userId);
    
    int getTotal_mypageTrainerProfit(Criteria cri, int userId);
    List<BuyVO> mypageTrainerProfit(Criteria cri, int userId);
}
