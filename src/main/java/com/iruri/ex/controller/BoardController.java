package com.iruri.ex.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iruri.ex.security.CurrentUser;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class BoardController {
    

    // 이루리팁 메인 --> 이루리 팁 게시판
    @GetMapping("/iruritip")
    public String iruritip_main(Principal principal,Model model) {

         
        return "/iruritip/iruritip_main";
        
    }
    
    // 이루리 자유게시판
    @GetMapping("/iruritip/freeboard")
    public String iruritip_freeboard(Principal principal,Model model) {

         
        return "/iruritip/iruritip_freeboard";
        
    }
    
    // 자유게시판 글쓰기 작성 폼
    @GetMapping("/iruritip/boardwrite")
    public String iruritip_boardwrite(Principal principal,Model model) {

         
        return "/iruritip/iruritip_boardwrite";
        
    }
    
    // 이루리팁 상세 게시글로 이동
    @RequestMapping("/iruritip/boardlist")
    public String iruritip_board_detail() {
              
        return "/iruritip/iruritip_board_detail";
    }

   
    
    
}
