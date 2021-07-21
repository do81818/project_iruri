package com.iruri.ex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class MypageUserController {
	
	  // 마이페이지 이동
		@RequestMapping("/mypage")
		public String mypage() {
		    log.info("main() ... ");
		    
			return "mypage/mypage_main";
		}


}
