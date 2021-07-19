package com.iruri.ex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.iruri.ex.Service.KakaoService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class SocialController {
    
    @Autowired
    private KakaoService kakaoService;
    
    @GetMapping("/auth/kakao/callback")
    public String authKakaoCallback(String code) {
        log.info("authKakaoCallback() .. " + code);

        kakaoService.setContextHolder(code);  
        
        return "redirect:/";
    }
}
