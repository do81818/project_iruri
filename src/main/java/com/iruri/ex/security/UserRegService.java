package com.iruri.ex.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iruri.ex.mapper.IUserMapper;

@Service
public class UserRegService {

        @Autowired
        IUserMapper iUserMapper;
    
        public int userNicknameCheck(String userNickname) {
            
            return iUserMapper.checkOverNickname(userNickname);
        }
}
