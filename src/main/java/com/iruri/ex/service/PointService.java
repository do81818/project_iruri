package com.iruri.ex.service;

import java.util.List;

import com.iruri.ex.vo.BoardVO;
import com.iruri.ex.vo.IClassVO;

public interface PointService {
    
	// 현재 포인트
    int savepoint(int userId);
    
    // 적립 예정 포인트
    int appointedpoint(int userId);
    
    // 사용된 포인트
    int usepoint(int userId);

    

}
