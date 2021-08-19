package com.iruri.ex.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iruri.ex.security.CurrentUser;
import com.iruri.ex.service.IClassService;
import com.iruri.ex.service.IUserService;
import com.iruri.ex.vo.IClassVO;
import com.iruri.ex.vo.IUserVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class MainController {
	
    @Autowired
	IUserService iUserService;
    @Autowired
    IClassService iClassService;
    
    // 메인 페이지 이동
	@RequestMapping("/")
	public String main(Model modal) {
	    log.info("main() ... ");
	    
	    List<IClassVO> challengeList = iClassService.mainPageChallengeList();
	    List<IClassVO> ptClassList = iClassService.mainPagePtClassLIst();
	    List<IClassVO> exerciseVideoList = iClassService.mainPageExerciseVideoList();
	    
	    log.info(exerciseVideoList);
	    
	    modal.addAttribute("challengeList", challengeList);
	    modal.addAttribute("ptClassList", ptClassList);
	    modal.addAttribute("exerciseVideoList", exerciseVideoList);
	    
		return "/main";
	}
	
	@RequestMapping("/search_result")
    public String test() {
    
	    return "/search_result";
	}
	
}
