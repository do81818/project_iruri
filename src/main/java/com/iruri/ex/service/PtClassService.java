package com.iruri.ex.service;

import java.util.List;

import com.iruri.ex.page.Criteria;
import com.iruri.ex.vo.IClassVO;

public interface PtClassService {

    void insertPtClass(IClassVO vo); // PT클래스 개설
    List<IClassVO> recommendList();  // 추천 클래스 리스트 받아오기
    List<IClassVO> getClassList(Criteria cri, String type, int userId,
            String g1, String g2,
            String ek1, String ek2, String ek3, String ek4, String ek5,
            String p1, String p2, String p3, String p4,
            String ed1, String ed2, String ed3, String ed4,
            String day1, String day2, String day3, String day4, String day5, String day6, String day7,
            String el1, String el2, String el3, 
            String ep1, String ep2, String ep3, String ep4); // 전체 클래스 리스트 받아오기
    int getTotalClass(Criteria cri, String type, int userId,
            String g1, String g2,
            String ek1, String ek2, String ek3, String ek4, String ek5,
            String p1, String p2, String p3, String p4,
            String ed1, String ed2, String ed3, String ed4,
            String day1, String day2, String day3, String day4, String day5, String day6, String day7,
            String el1, String el2, String el3, 
            String ep1, String ep2, String ep3, String ep4); // 타입에 해당하는 클래스 리스트 총 갯수 받아오기

    int getUserJoinChallengeListCheck(int classId, int userId);
    
}
