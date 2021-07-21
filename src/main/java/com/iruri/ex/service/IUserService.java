package com.iruri.ex.service;

import com.iruri.ex.vo.IUserVO;

public interface IUserService {
    
    void signUpUser(IUserVO iUserVO);
    IUserVO findKakaoUser(String socialEmail);
    IUserVO findNaverUser(String socialEmail);
    IUserVO findGoogleUser(String socialEmail);
    
}
