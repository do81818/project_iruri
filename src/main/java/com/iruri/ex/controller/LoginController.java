package com.iruri.ex.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.iruri.ex.security.UserRegService;
import com.iruri.ex.service.GoogleService;
import com.iruri.ex.service.IUserService;
import com.iruri.ex.service.KakaoService;
import com.iruri.ex.service.NaverService;
import com.iruri.ex.vo.IUserVO;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
public class LoginController {
    
    @Autowired
    KakaoService kakaoService;
    @Autowired
    NaverService naverService;
    @Autowired
    GoogleService googleService;
    @Autowired
    IUserService iuserService;
    @Autowired
    UserRegService regService;
    
    @GetMapping("/loginPage")
    public ModelAndView loginPage(ModelAndView mav) {
        mav.setViewName("/loginPage");
        mav.addObject("kakaoUrl", kakaoService.getAuthorizationUrl());
        mav.addObject("naverUrl", naverService.getAuthorizationUrl());
        mav.addObject("googleUrl", googleService.getAuthorizationUrl());
        
        return mav;
    }
     
    @GetMapping("/signUp")
    public ModelAndView signUp(ModelAndView mav) {
        mav.setViewName("/signUp");
        
        return mav;
    }
    
    // 양식 체크 및 중복 체크
    @GetMapping("/signUp/emailCheck")
    public int signUpEmailCheck(@RequestParam("userEmail") String userInput) {
        int validateNumber = regService.userEmailCheck(userInput);    
        
        return validateNumber; 
    }
    
    // 이메일 인증 번호 발송
    @GetMapping("/signUp/sendAuthNumber")
    public void signUpAuthentication(@RequestParam("userEmail") String userInput, HttpSession session) {
        int checkNum = regService.mailSend(userInput);
        
        session.setAttribute("checkNum", checkNum);
        session.setMaxInactiveInterval(3*60); // 세션 시간을 3분으로 제한해서 다른 서비스에 영향이 생길 수 있음
    }
    
    // 입력 후 클릭시 세션에 저장된 값이랑 비교
    @GetMapping("/signUp/checkAuthNumber")
    public int signUpCheckAuthNumber(@RequestParam("authNumber") int userInput, HttpSession session) {
        int authNumber = (int)session.getAttribute("checkNum");

        if(userInput == authNumber) {
            return 1;
        }
        
        return 0;
    }
    
    // 비밀번호 양식 체크
    @GetMapping("/signUp/passwordCheck")
    public int signUpPasswordCheck(@RequestParam("userPw") String userPw) {
        
        return regService.userPasswordCheck(userPw);
    }
    
    // 닉네임 양식 및 중복 체크
    @GetMapping("/signUp/nicknameCheck")
    public int signUpNicknameCheck(IUserVO userInput) {
        
        return regService.userNicknameCheck(userInput.getUserNickname());
    }
    
    @PostMapping("/signUp/submit")
    public void signUpUser(IUserVO iUserVO, HttpServletResponse response) throws IOException {
        iuserService.signUpUser(iUserVO);
        
        response.sendRedirect("/ex/loginPage");
    }
    
}
