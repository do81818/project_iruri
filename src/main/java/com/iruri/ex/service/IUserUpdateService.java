package com.iruri.ex.service;

import java.util.List;

import com.iruri.ex.vo.BoardVO;
import com.iruri.ex.vo.IClassVO;
import com.iruri.ex.vo.IUserInfoVO;
import com.iruri.ex.vo.IUserVO;

public interface IUserUpdateService {
    
	// 유저정보 업데이트
    void update(IUserVO iuservo);
    
    // 유저 신체정보 업데이트
    void infoupdate(IUserInfoVO iuserinfovo);

}
