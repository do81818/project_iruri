package com.iruri.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.iruri.ex.page.Criteria;
import com.iruri.ex.vo.IClassVO;

@Mapper
public interface PtClassMapper {

    void insertPtClass(IClassVO vo); // PT클래스 개설

    // 총 갯수
    int getTotalClassAll(@Param("g1") String g1, @Param("g2") String g2,
            @Param("ek1") String ek1, @Param("ek2") String ek2, @Param("ek3") String ek3, @Param("ek4") String ek4, @Param("ek5") String ek5,
            @Param("p1") String p1, @Param("p2") String p2, @Param("p3") String p3, @Param("p4") String p4,
            @Param("ed1") String ed1, @Param("ed2") String ed2, @Param("ed3") String ed3, @Param("ed4") String ed4,
            @Param("day1") String day1, @Param("day2") String day2, @Param("day3") String day3, @Param("day4") String day4, @Param("day5") String day5, @Param("day6") String day6, @Param("day7") String day7,
            @Param("el1") String el1, @Param("el2") String el2, @Param("el3") String el3, 
            @Param("ep1") String ep1, @Param("ep2") String ep2, @Param("ep3") String ep3, @Param("ep4") String ep4);
    int getTotalClassBuy(@Param("userId") int userId, @Param("g1") String g1, @Param("g2") String g2,
            @Param("ek1") String ek1, @Param("ek2") String ek2, @Param("ek3") String ek3, @Param("ek4") String ek4, @Param("ek5") String ek5,
            @Param("p1") String p1, @Param("p2") String p2, @Param("p3") String p3, @Param("p4") String p4,
            @Param("ed1") String ed1, @Param("ed2") String ed2, @Param("ed3") String ed3, @Param("ed4") String ed4,
            @Param("day1") String day1, @Param("day2") String day2, @Param("day3") String day3, @Param("day4") String day4, @Param("day5") String day5, @Param("day6") String day6, @Param("day7") String day7,
            @Param("el1") String el1, @Param("el2") String el2, @Param("el3") String el3, 
            @Param("ep1") String ep1, @Param("ep2") String ep2, @Param("ep3") String ep3, @Param("ep4") String ep4);
    int getTotalClassInterest(@Param("userId") int userId,
            @Param("g1") String g1, @Param("g2") String g2,
            @Param("ek1") String ek1, @Param("ek2") String ek2, @Param("ek3") String ek3, @Param("ek4") String ek4, @Param("ek5") String ek5,
            @Param("p1") String p1, @Param("p2") String p2, @Param("p3") String p3, @Param("p4") String p4,
            @Param("ed1") String ed1, @Param("ed2") String ed2, @Param("ed3") String ed3, @Param("ed4") String ed4,
            @Param("day1") String day1, @Param("day2") String day2, @Param("day3") String day3, @Param("day4") String day4, @Param("day5") String day5, @Param("day6") String day6, @Param("day7") String day7,
            @Param("el1") String el1, @Param("el2") String el2, @Param("el3") String el3, 
            @Param("ep1") String ep1, @Param("ep2") String ep2, @Param("ep3") String ep3, @Param("ep4") String ep4);
    int getTotalClassPast(@Param("userId") int userId,
            @Param("g1") String g1, @Param("g2") String g2,
            @Param("ek1") String ek1, @Param("ek2") String ek2, @Param("ek3") String ek3, @Param("ek4") String ek4, @Param("ek5") String ek5,
            @Param("p1") String p1, @Param("p2") String p2, @Param("p3") String p3, @Param("p4") String p4,
            @Param("ed1") String ed1, @Param("ed2") String ed2, @Param("ed3") String ed3, @Param("ed4") String ed4,
            @Param("day1") String day1, @Param("day2") String day2, @Param("day3") String day3, @Param("day4") String day4, @Param("day5") String day5, @Param("day6") String day6, @Param("day7") String day7,
            @Param("el1") String el1, @Param("el2") String el2, @Param("el3") String el3, 
            @Param("ep1") String ep1, @Param("ep2") String ep2, @Param("ep3") String ep3, @Param("ep4") String ep4);
    
    // 리스트 받아오기
    List<IClassVO> recommendList();
    List<IClassVO> getClassList(@Param("cri") Criteria cri,
            @Param("g1") String g1, @Param("g2") String g2,
            @Param("ek1") String ek1, @Param("ek2") String ek2, @Param("ek3") String ek3, @Param("ek4") String ek4, @Param("ek5") String ek5,
            @Param("p1") String p1, @Param("p2") String p2, @Param("p3") String p3, @Param("p4") String p4,
            @Param("ed1") String ed1, @Param("ed2") String ed2, @Param("ed3") String ed3, @Param("ed4") String ed4,
            @Param("day1") String day1, @Param("day2") String day2, @Param("day3") String day3, @Param("day4") String day4, @Param("day5") String day5, @Param("day6") String day6, @Param("day7") String day7,
            @Param("el1") String el1, @Param("el2") String el2, @Param("el3") String el3, 
            @Param("ep1") String ep1, @Param("ep2") String ep2, @Param("ep3") String ep3, @Param("ep4") String ep4);
    List<IClassVO> getBuyClassList(@Param("cri") Criteria cri, @Param("userId") int userId,
            @Param("g1") String g1, @Param("g2") String g2,
            @Param("ek1") String ek1, @Param("ek2") String ek2, @Param("ek3") String ek3, @Param("ek4") String ek4, @Param("ek5") String ek5,
            @Param("p1") String p1, @Param("p2") String p2, @Param("p3") String p3, @Param("p4") String p4,
            @Param("ed1") String ed1, @Param("ed2") String ed2, @Param("ed3") String ed3, @Param("ed4") String ed4,
            @Param("day1") String day1, @Param("day2") String day2, @Param("day3") String day3, @Param("day4") String day4, @Param("day5") String day5, @Param("day6") String day6, @Param("day7") String day7,
            @Param("el1") String el1, @Param("el2") String el2, @Param("el3") String el3, 
            @Param("ep1") String ep1, @Param("ep2") String ep2, @Param("ep3") String ep3, @Param("ep4") String ep4);
    List<IClassVO> getInterestClassList(@Param("cri") Criteria cri, @Param("userId") int userId,
            @Param("g1") String g1, @Param("g2") String g2,
            @Param("ek1") String ek1, @Param("ek2") String ek2, @Param("ek3") String ek3, @Param("ek4") String ek4, @Param("ek5") String ek5,
            @Param("p1") String p1, @Param("p2") String p2, @Param("p3") String p3, @Param("p4") String p4,
            @Param("ed1") String ed1, @Param("ed2") String ed2, @Param("ed3") String ed3, @Param("ed4") String ed4,
            @Param("day1") String day1, @Param("day2") String day2, @Param("day3") String day3, @Param("day4") String day4, @Param("day5") String day5, @Param("day6") String day6, @Param("day7") String day7,
            @Param("el1") String el1, @Param("el2") String el2, @Param("el3") String el3, 
            @Param("ep1") String ep1, @Param("ep2") String ep2, @Param("ep3") String ep3, @Param("ep4") String ep4);
    List<IClassVO> getPastClassList(@Param("cri") Criteria cri, @Param("userId") int userId,
            @Param("g1") String g1, @Param("g2") String g2,
            @Param("ek1") String ek1, @Param("ek2") String ek2, @Param("ek3") String ek3, @Param("ek4") String ek4, @Param("ek5") String ek5,
            @Param("p1") String p1, @Param("p2") String p2, @Param("p3") String p3, @Param("p4") String p4,
            @Param("ed1") String ed1, @Param("ed2") String ed2, @Param("ed3") String ed3, @Param("ed4") String ed4,
            @Param("day1") String day1, @Param("day2") String day2, @Param("day3") String day3, @Param("day4") String day4, @Param("day5") String day5, @Param("day6") String day6, @Param("day7") String day7,
            @Param("el1") String el1, @Param("el2") String el2, @Param("el3") String el3, 
            @Param("ep1") String ep1, @Param("ep2") String ep2, @Param("ep3") String ep3, @Param("ep4") String ep4);

}
