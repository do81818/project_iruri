package com.iruri.ex.service;

import java.util.List;

import com.iruri.ex.page.Criteria;
import com.iruri.ex.vo.IClassVO;

public interface IClassService {

    // 현재 운영중인 클래스 
    List<IClassVO> classCurrentList(int userId);

    // 종료된 클래스 
    List<IClassVO> classEndList(int userId);

    int classcount(int userId);


    // 페이징
    int getTotal(int userId, Criteria cri);
    
    List<IClassVO> getList(int userId, Criteria cri);
    
}
