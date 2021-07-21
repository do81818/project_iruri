package com.iruri.ex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.iruri.ex.service.GoogleService;
import com.iruri.ex.service.KakaoService;
import com.iruri.ex.service.NaverService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class SocialController {
    
    @Autowired
    private KakaoService kakaoService;
    @Autowired
    private NaverService naverService;
    @Autowired
    private GoogleService googleService;
    
    @GetMapping("/auth/kakao/callback")
    public String authKakaoCallback(String code) {
        log.info("authKakaoCallback() .. " + code);

        kakaoService.setContextHolder(code);  
        
        return "redirect:/";
    }
    
    @GetMapping("/auth/naver/callback")
    public String authNaverCallback(String code, String state) {
        log.info("authNaverCallback() CODE: " + code);
        log.info("STATE: " + state);
        
        naverService.setContextHolder(code, state);
        
        return "redirect:/";
    }
    
    @GetMapping("/auth/google/callback")
    public String authGoogleCallback(String code) {
        log.info("authGoogleCallback() CODE: " + code);
        
        googleService.setContextHolder(code);
        
        return "redirect:/";
    }
    
    
}
