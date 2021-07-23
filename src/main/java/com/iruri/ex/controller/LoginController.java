package com.iruri.ex.controller;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iruri.ex.security.UserRegService;
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
    @Autowired
    UserRegService regService;
    

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
    
    // 유저 닉네임 중복체크
    @GetMapping("/signUp/nicknameCheck")
    @ResponseBody
    public int signUpNicknameCheck(@RequestParam("userNickname") String userNickname) {
        
        return regService.userNicknameCheck(userNickname);
    }
    
    // 유저 이메일 중복체크
    @GetMapping("/signUp/emailCheck")
    @ResponseBody
    public int signUpEmailCheck(@RequestParam("userEmail") String userEmail) {

        log.info(userEmail);
        
        int validateNumber = regService.userEmailCheck(userEmail);
        
        if(validateNumber == 0) {
            
            String host = "smtp.naver.com";
            String user = "do81818@naver.com";
            String password = "dkffltldkzltm!23";
            
            Properties prop = new Properties();
            prop.put("mail.smtp.host", host);
            prop.put("mail.smtp.port", 587);
            prop.put("mail.smtp.auth", "true");
            
            Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(user, password);
                }
            });
            
            try {
                MimeMessage message = new MimeMessage(session);
                message.setFrom(new InternetAddress(user));

                // 수신자 메일 주소
                message.addRecipient(Message.RecipientType.TO, new InternetAddress("do81818@gmail.com"));
                
                // 매일 제목
                message.setSubject("제목을 입력하세요");
                // 메일 내용
                message.setText("내용을 입력하세요");
                
                Transport.send(message);
                log.info("이메일을 보냈습니다.");
                
            } catch (MessagingException e) {
                e.printStackTrace();
            }
            
            return 0;
        }
        
        return validateNumber; 
    }
    
    // 회원가입 폼 정보 전달
    @PostMapping("/signUpUser")
    public String signUpUser(IUserVO iUserVO) {
        log.info("signUpUser() ... ");
        
        iuserService.signUpUser(iUserVO);
        
        return "redirect:/loginPage";
    }
    
}
