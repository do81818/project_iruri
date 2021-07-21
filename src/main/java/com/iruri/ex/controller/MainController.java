package com.iruri.ex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class MainController {
	
    // 메인 페이지 이동
	@RequestMapping("/")
	public String main() {
	    log.info("main() ... ");
	    
		return "/main";
	}
	
}
