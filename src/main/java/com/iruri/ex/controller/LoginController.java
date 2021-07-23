package com.iruri.ex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.iruri.ex.service.IUserService;
import com.iruri.ex.service.KakaoService;
import com.iruri.ex.vo.IUserVO;

import lombok.extern.log4j.Log4j;

//로그인, 회원가입 등 검증 및 인증 컨트롤러
@Log4j
@Controller
public class LoginController {
    
    @Autowired
    KakaoService kakaoService;
    @Autowired
    IUserService iuserService;
    

    // 로그인 페이지 이동
    @GetMapping("/loginPage")
    public String loginPage(Model model) {
        log.info("loginPage() ... ");
        
        model.addAttribute("kakaoUrl", kakaoService.getAuthorizationUrl());
        
        return "/loginPage";
    }
     
    // 회원가입 페이지 이동
    @GetMapping("/signUp")
    public String signUp() {
        log.info("signUp() ... ");
        
        return "/signUp";
    }
    
    // 회원가입 폼 정보 전달
    @PostMapping("/signUpUser")
    public String signUpUser(IUserVO iUserVO) {
        log.info("signUpUser() ... ");
        
        iuserService.signUpUser(iUserVO);
        
        return "redirect:/loginPage";
    }
    
}
