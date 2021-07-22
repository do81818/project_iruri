package com.iruri.ex.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iruri.ex.Service.IUserService;
import com.iruri.ex.vo.IUserVO;

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
    public String test(Principal principal, Model model) {
        log.info("test() ... ");
        
        //principal객체에 얻어온 이메일을 iuserService 에 보낸다.
        IUserVO vo = iUserService.selectOne(principal.getName());
        model.addAttribute("user", vo);
        
        return "/social_test";
    }
	

}
