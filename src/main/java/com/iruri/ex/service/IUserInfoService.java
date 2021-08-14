package com.iruri.ex.service;

import java.util.List;

import com.iruri.ex.vo.IUserInfoVO;

public interface IUserInfoService {
    
	
    
     // userinfo list 만들기   
    List<IUserInfoVO> userinfoList(int userId);

	List<IUserInfoVO> useryearweight(int userId);

	List<IUserInfoVO> usermonthweight(int userId);
        
//    int userheightdate(int userId);
}
