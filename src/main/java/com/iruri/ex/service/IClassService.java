package com.iruri.ex.service;

import java.sql.Date;
import java.util.List;

import com.iruri.ex.vo.IClassVO;
import com.iruri.ex.vo.IUserVO;

public interface IClassService {
    
    
    // 3. 서비스에서 함수 만들기 selectOne(principal 객체의 이메일을 받는다.)
    List<IClassVO> classList(int userId);
    
    int classcount(int userId);
    
}
