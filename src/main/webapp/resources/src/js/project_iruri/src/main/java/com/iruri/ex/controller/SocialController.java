package com.iruri.ex.controller;

import javax.servlet.http.HttpServletRequest;

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
    public String authKakaoCallback(String code, HttpServletRequest request) {
        int success = kakaoService.setContextHolder(code, request);
        if(success == 0) {
            return "redirect:/signUp";
        }
        
        return "redirect:/";
    }
    
    @GetMapping("/auth/naver/callback")
    public String authNaverCallback(String code, String state, HttpServletRequest request) {
        int success = naverService.setContextHolder(code, state, request);
        if(success == 0) {
            return "redirect:/signUp";
        }
        
        return "redirect:/";
    }
    
    @GetMapping("/auth/google/callback")
    public String authGoogleCallback(String code, HttpServletRequest request) {
        int success = googleService.setContextHolder(code, request);
        if(success == 0) {
            return "redirect:/signUp";
        }
        
        return "redirect:/";
    }
    
    
}
