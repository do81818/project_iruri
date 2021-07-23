package com.iruri.ex.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.iruri.ex.service.IClassService;
import com.iruri.ex.service.IUserService;
import com.iruri.ex.vo.IUserVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class ChallengeController {
    
    @Autowired
    IUserService iUserService;
    @Autowired
    IClassService iClassService;
    
    //챌린지 메인
//    @GetMapping("/iruri/challenge_main")
//    public ModelAndView c_main(ModelAndView mav) {
//        
//        mav.setViewName("/challenge/challenge_main");
//        // mav.addObject(null, mav);
//        
//        return mav;
//    }
    
    @RequestMapping("/iruri/challenge_main")
    public String c_main(Principal principal, Model model) {
        log.info("challenge main()..");
        
        IUserVO vo = iUserService.selectOne(principal.getName());
        
        model.addAttribute("user", vo);
        
        model.addAttribute("classList", iClassService.classList(vo.getUserId()));
        
        log.info(iClassService.classList(vo.getUserId()));
        
        return "challenge/challenge_main";        
        
    }
    
    
    //챌린지 개설 폼
    @GetMapping("/iruri/challenge_make_form")
    public ModelAndView c_make_form(ModelAndView mav) {
        
        mav.setViewName("/challenge/challenge_make_form");
        // mav.addObject(null, mav);
        
        return mav;
    }
    
    //챌린지 상세 - 참여 전
    @GetMapping("/iruri/challenge_detail_before")
    public ModelAndView c__detail_before(ModelAndView mav) {
        
        mav.setViewName("/challenge/challenge_detail_before");
        // mav.addObject(null, mav);
        
        return mav;
    }
    
    //챌린지 상세 - 참여 후
    @GetMapping("/iruri/challenge_detail_after")
    public ModelAndView c_detail_after(ModelAndView mav) {
        
        mav.setViewName("/challenge/challenge_detail_after");
        // mav.addObject(null, mav);
        
        return mav;
    }
 
}
