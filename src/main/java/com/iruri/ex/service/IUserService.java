package com.iruri.ex.service;

import com.iruri.ex.vo.IUserVO;

public interface IUserService {
    
    void signUpUser(IUserVO iUserVO);
    IUserVO findSocialUser(int socialId);
	
    
    
    //동훈님설명
    //3. 서비스에서 함수 만들기 selectOne (Principal 객체의 이메일을 받는다)
    //우리가 우너하는거 =  유저정보를 가져오는것
    IUserVO selectOne(String userEmail);
    

    
	
	
    
}
