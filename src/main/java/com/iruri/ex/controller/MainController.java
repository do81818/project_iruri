package com.iruri.ex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iruri.ex.security.CustomUser;
import com.iruri.ex.service.IUserService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class MainController {
	
    @Autowired
	IUserService iUserService;
    
    // 메인 페이지 이동
	@RequestMapping("/")
	public String main() {
	    log.info("main() ... ");
	    
		return "/main";
	}
	
	// 로그인한 유저의 정보 가져오기
	@RequestMapping("/test")
    public String test(Authentication auth, Model model) {
        log.info("test() ... ");
        
        CustomUser principal = (CustomUser)auth.getPrincipal();
        log.info(principal.getIUser().getUserId());
        model.addAttribute("user", principal.getIUser());
        
        return "/social_test";
    }
	

}
