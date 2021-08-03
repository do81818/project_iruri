package com.iruri.ex.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.iruri.ex.security.CurrentUser;
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
    public ModelAndView loginPage(ModelAndView mav, HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute("kakaoId");
        session.removeAttribute("naverId");
        session.removeAttribute("googleId");
        
        mav.setViewName("/loginPage");
        mav.addObject("kakaoUrl", kakaoService.getAuthorizationUrl());
        mav.addObject("naverUrl", naverService.getAuthorizationUrl());
        mav.addObject("googleUrl", googleService.getAuthorizationUrl());
        
        return mav;
    }
     
    @GetMapping("/signUp")
    public ModelAndView signUp(ModelAndView mav, HttpServletRequest request) {
        mav.setViewName("/signUp");
        
        HttpSession session = request.getSession(true);
        session.setAttribute("checkNum", false);
        session.setAttribute("authCheck", false);
        
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
    public void signUpAuthentication(@RequestParam("userEmail") String userInput, HttpServletRequest request) {
        int checkNum = regService.mailSend(userInput);
        
        HttpSession session = request.getSession(true);
        session.removeAttribute("checkNum");
        session.setAttribute("checkNum", checkNum);
        session.setMaxInactiveInterval(3*60);
    }
    
    // 인증번호 입력 후 클릭시 세션에 저장된 인증번호 값이랑 비교
    @GetMapping("/signUp/checkAuthNumber")
    public int signUpCheckAuthNumber(@RequestParam("authNumber") String userInput, HttpServletRequest request) {
        
        
        HttpSession session = request.getSession(true);
        if(session.getAttribute("checkNum") == null) {
            return -1;
        }
        
        String authNumber = String.valueOf(session.getAttribute("checkNum"));
        
        if(userInput.equals(authNumber)) {
            session.removeAttribute("checkNum");
            session.setMaxInactiveInterval(30*60);            
            session.setAttribute("authCheck", true);
            return 1;
        }
        
        if(userInput == "") {
            return 0;
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
    public int signUpNicknameCheck(@RequestParam("userNickname") String userNickname) {
        
        return regService.userNicknameCheck(userNickname);
    }
    
    // 전화번호 양식 체크
    @GetMapping("/signUp/phoneCheck")
    public int signUpPhoneCheck(@RequestParam("userPhone") String userPhone) {
        
        return regService.userPhoneCheck(userPhone);
    }
    
    // 회원가입 값 검증
    @PostMapping("/signUp/submit")
    public int signUpUser(IUserVO iUserVO, String userPwCheck, String agree, HttpServletRequest request)  {
        
        log.info("iUserVO: " + iUserVO);
        
        HttpSession session = request.getSession(true);
        Boolean authCheck = (Boolean)session.getAttribute("authCheck");
        
        return iuserService.signUpUser(iUserVO, authCheck, userPwCheck, agree);
    }
    
    // 비밀번호 찾기
    @GetMapping("/signUp/pwUpdate")
    public int signUpPwUpdate(IUserVO vo, HttpServletRequest request) {
        
        HttpSession session = request.getSession();
        Boolean authCheck = (Boolean)session.getAttribute("authCheck");
        
        return iuserService.signUpPwUpdate(vo.getUserEmail(), vo.getUserPw(), authCheck);
    }
}
