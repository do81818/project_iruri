package com.iruri.ex.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.http.ResponseEntity;

import com.iruri.ex.page.Criteria;
import com.iruri.ex.vo.BoardVO;
import com.iruri.ex.vo.IClassVO;

public interface PtClassService {

    // PT클래스 개설
    void insertPtClass(IClassVO vo);
    
    // 추천 클래스 리스트 받아오기
    List<IClassVO> recommendList();
    
    // 메인 클래스 리스트 받아오기
    List<IClassVO> getClassList(Criteria cri, String type, int userId,
            String g1, String g2,
            String ek1, String ek2, String ek3, String ek4, String ek5,
            String p1, String p2, String p3, String p4,
            String ed1, String ed2, String ed3, String ed4,
            String day1, String day2, String day3, String day4, String day5, String day6, String day7,
            String el1, String el2, String el3, 
            String ep1, String ep2, String ep3, String ep4); 
    // 메인 필터에 해당하는 클래스 리스트 총 갯수 받아오기
    int getTotalClass(Criteria cri, String type, int userId,
            String g1, String g2,
            String ek1, String ek2, String ek3, String ek4, String ek5,
            String p1, String p2, String p3, String p4,
            String ed1, String ed2, String ed3, String ed4,
            String day1, String day2, String day3, String day4, String day5, String day6, String day7,
            String el1, String el2, String el3, 
            String ep1, String ep2, String ep3, String ep4); 

    // 상세보기 pt클래스 정보 가져오기
    HashMap<String, Object> joinCheck(int classId, int userId);
    
    // 상세보기 인증글 총 갯수
    int ptClassCertifyCount(int classId);
    // 상세보기 인증글 리스트
    List<BoardVO> ptClassCertifyList(Criteria cri, int classId);
    
    // 댓글 총 갯수
    int ptClassReplyCount(int classId);
    // 댓글 리스트
    List<BoardVO> ptClassReplyList(Criteria cri, int classId);
}
