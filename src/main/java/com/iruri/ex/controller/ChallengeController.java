package com.iruri.ex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class ChallengeController {
    
    @GetMapping("/challenge/challenge_main")
    public ModelAndView c_main(ModelAndView mav) {
        
        mav.setViewName("/challenge/challenge_main");
        // mav.addObject(null, mav);
        
        return mav;
    }
    
    
    @GetMapping("/challenge/challenge_make_form")
    public ModelAndView c_make_form(ModelAndView mav) {
        
        mav.setViewName("/challenge/challenge_make_form");
        // mav.addObject(null, mav);
        
        return mav;
    }
 
}
