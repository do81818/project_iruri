package com.iruri.ex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iruri.ex.service.GoogleService;
import com.iruri.ex.service.IUserService;
import com.iruri.ex.service.KakaoService;
import com.iruri.ex.service.NaverService;
import com.iruri.ex.vo.IUserVO;

import lombok.extern.log4j.Log4j;

//로그인, 회원가입 등 검증 및 인증 컨트롤러
@Log4j
@Controller
public class LoginController {
    
    @Autowired
    KakaoService kakaoService;
    @Autowired
    NaverService naverService;
    @Autowired
    GoogleService googleService;
    @Autowired
    IUserService iuserService;
    

    // 로그인 페이지 이동
    @GetMapping("/loginPage")
    public String loginPage(Model model) {
        log.info("loginPage() ... ");
        
        model.addAttribute("kakaoUrl", kakaoService.getAuthorizationUrl());
        model.addAttribute("naverUrl", naverService.getAuthorizationUrl());
        model.addAttribute("googleUrl", googleService.getAuthorizationUrl());
        
        return "/loginPage";
    }
     
    // 회원가입 페이지 이동
    @GetMapping("/signUp")
    public String signUp() {
        log.info("signUp() ... ");
        
        return "/signUp";
    }
    
    @GetMapping("/signUp/nicknameCheck")
    @ResponseBody
    public int signUpNicknameCheck(@RequestParam("userNickname") String userNickname) {
        log.info(userNickname);
        
        return "SUCCESS";
    }
    
    // 회원가입 폼 정보 전달
    @PostMapping("/signUpUser")
    public String signUpUser(IUserVO iUserVO) {
        log.info("signUpUser() ... ");
        
        iuserService.signUpUser(iUserVO);
        
        return "redirect:/loginPage";
    }
    
}
