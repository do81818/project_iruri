package com.iruri.ex.security;

import org.springframework.security.crypto.password.PasswordEncoder;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomNoOpPasswordEncoder implements PasswordEncoder{
    // 개발 완료 후 삭제
    
    @Override
    public String encode(CharSequence rawPassword) {
    
        log.warn("before encode : " + rawPassword);
        
        return rawPassword.toString();
    }

    @Override
    public boolean matches(CharSequence rawPassword, String encodedPassword) {
                
        log.warn("matches: " + rawPassword.toString() + " : " + encodedPassword);    
        
        return rawPassword.toString().equals(encodedPassword);
    }
    
}
