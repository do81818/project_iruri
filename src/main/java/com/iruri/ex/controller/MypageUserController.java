package com.iruri.ex.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iruri.ex.service.IUserInfoService;
import com.iruri.ex.service.IUserService;
import com.iruri.ex.vo.IUserVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class MypageUserController {
	
	
	@Autowired
	IUserService iUserService;
	@Autowired
	IUserInfoService iUserinfoService;

		
		// 마이페이지의 메인
		@RequestMapping("/mypage")
		public String test(Principal principal, Model model) {
		log.info("test()..");
		
		IUserVO vo = iUserService.selectOne(principal.getName());
		model.addAttribute("user",vo) ;
		
		model.addAttribute("userinfoList",iUserinfoService.userinfoList(vo.getUserId()));
		log.info(iUserinfoService.userinfoList(vo.getUserId()));
		
		return "/mypage_user/mypage_user_main";
		}

		
		// 마이페이지의 보드리스트 페이지
	    // 메인 페이지 이동
		   @RequestMapping("/mypage/boardlist")
		   public String main() {
		       log.info("main() ... ");
		       
		      return "/mypage_user/mypage_user_boardlist";
		   }
}
