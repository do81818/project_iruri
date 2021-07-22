package com.iruri.ex.service;

import com.iruri.ex.vo.IUserVO;

public interface IUserService {
    
    void signUpUser(IUserVO iUserVO);
    IUserVO findKakaoUser(String socialEmail);
    IUserVO findNaverUser(String socialEmail);
    IUserVO findGoogleUser(String socialEmail);
    
    
    // 우리가 원하는거를 정리 -> 즉, 유저 정보를 가져오는 것
    // 3. 서비스에서 함수 만들기 selectOne(principal 객체의 이메일을 받는다.)
    IUserVO selectOne(String userEmail);
    
}
