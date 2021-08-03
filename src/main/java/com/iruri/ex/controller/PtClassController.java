package com.iruri.ex.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
public class PtClassController {

    @GetMapping("/iruri/ptClassList")
    public ModelAndView pt_main(ModelAndView mav) {
        
        mav.setViewName("ptclass/ptclass_main");
        
        return mav;
    }
    
}
