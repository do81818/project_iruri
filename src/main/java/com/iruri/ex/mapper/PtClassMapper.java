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
    int getTotalClassAll();
    int getTotalClassBuy(int userId);
    int getTotalClassInterest(int userId);
    int getTotalClassPast(int userId);
    
    // 리스트 받아오기
    List<IClassVO> recommendList();
    List<IClassVO> getClassList(Criteria cri);
    List<IClassVO> getBuyClassList(@Param("cri") Criteria cri, @Param("userId") int userId);
    List<IClassVO> getInterestClassList(@Param("cri") Criteria cri, @Param("userId") int userId);
    List<IClassVO> getPastClassList(@Param("cri") Criteria cri, @Param("userId") int userId);

}
