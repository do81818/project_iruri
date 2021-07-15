package com.iruri.ex.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iruri.ex.Service.IUserService;
import com.iruri.ex.security.IUserDetailsService;
import com.iruri.ex.vo.IUserVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class MainController {
	
    @Autowired
    private IUserService userService;
    
    // 메인 페이지 이동
	@RequestMapping("/")
	public String main() {
	    log.info("main() ... ");
	    
		return "/main";
	}
	
	// 로그인 페이지 이동
	@GetMapping("/loginPage")
	public String loginPage() {
	    log.info("loginPage() ... ");
	    
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
	    
	    userService.signUpUser(iUserVO);
	    
	    return "redirect:/loginPage";
	}
	
}
