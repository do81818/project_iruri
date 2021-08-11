package com.iruri.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.iruri.ex.page.Criteria;
import com.iruri.ex.vo.IClassVO;

@Mapper
public interface PtClassMapper {

    void insertPtClass(IClassVO vo); // PT클래스 개설
    List<IClassVO> recommendList();  // 추천 클래스 리스트 받아오기
    int getTotalClassAll(); // 전체 클래스 리스트 총 갯수 받아오기
    int getTotalClassBuy(int userId);
    
    List<IClassVO> getClassList(Criteria cri); // 클래스 리스트 받아오기
}
