package com.iruri.ex.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.iruri.ex.security.CurrentUser;
import com.iruri.ex.vo.IClassVO;
import com.iruri.ex.vo.IUserVO;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
public class PtClassController {

    @GetMapping("/iruri/ptClassList")
    public ModelAndView pt_main(ModelAndView mav) {
        
        mav.setViewName("ptclass/ptclass_main");
        
        return mav;
    }
    
    @GetMapping("/iruri/ptClassDetails")
    public ModelAndView pt_details(ModelAndView mav) {
        
        mav.setViewName("ptclass/ptclass_details");
        
        return mav;
    }
    
    @GetMapping("/iruri/ptClassMakeForm")
    public ModelAndView pt_make_form(ModelAndView mav) {

        mav.setViewName("/ptclass/ptClass_make_form");

        return mav;
    }
    
    @ResponseBody
    @PostMapping("/iruri/insertPtClass")
    public String insert_pt_class(IClassVO classVO) {
        log.info("insert_pt_class() ... ");
        log.info("IClassVO: " + classVO);
        
        return "SUCCESS";
    }
    
    // 클래스명 classTitle
    // 운동종류 exerciseKindList (checkbox)
    // 준비물 classNeed
    // 운동강도 classLevel (radio)
    // 시작일 classStartDate
    // 종료일 classEndDate
    // 운동요일 exerciseDateList (checkbox)
    // 운동시간 classTime
    // 운동인원 classTotalMember (radio)
    // 가격 classPrice
    // 목표 classGoal
}
