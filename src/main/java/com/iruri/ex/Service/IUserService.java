package com.iruri.ex.Service;

import com.iruri.ex.vo.IUserVO;

public interface IUserService {
    
    void signUpUser(IUserVO iUserVO);
    IUserVO findSocialUser(int socialId);
    
}
