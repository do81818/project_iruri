package com.iruri.ex.service;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iruri.ex.mapper.MypageTrainerMapper;
import com.iruri.ex.page.Criteria;
import com.iruri.ex.vo.BuyVO;


import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MypageTrainerServiceImpl implements MypageTrainerService {
    
    @Autowired
    private MypageTrainerMapper mypageTrainerMapper;
    
    @Override
    public int getTotal_mypageTrainerProfit(Criteria cri, int userId) {
        log.info("MypageTrainerServiceImpl");
        return mypageTrainerMapper.getTotalCount_mypageTrainerProfit(cri, userId);
    }
    @Override
    public List<BuyVO> mypageTrainerProfit(Criteria cri, int userId){
        log.info("MypageTrainerServiceImpl");
        return mypageTrainerMapper.getListWithPaging_mypageTrainerProfit(cri, userId);
        
    }
    
    // 운영중인 클래스 갯수
    public int countMypageTrainerClass(int userId) {
        return mypageTrainerMapper.countMypageTrainerClass(userId);
    }
    
    // 총수익
    public int trainerProfit(int userId) {
        return mypageTrainerMapper.trainerProfit(userId);
    }
    
    // 이달의 수익
    @Override
    public int monthProfit(int userId) {
        return mypageTrainerMapper.monthProfit(userId);
    }
   

 
}
