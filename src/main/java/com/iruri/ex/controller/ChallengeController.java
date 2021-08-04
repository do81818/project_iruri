package com.iruri.ex.controller;

import java.security.Principal; 
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.iruri.ex.page.Criteria;
import com.iruri.ex.page.PageVO;
import com.iruri.ex.security.CurrentUser;
import com.iruri.ex.service.ChallengeService;
import com.iruri.ex.service.IClassService;
import com.iruri.ex.service.IUserService;
import com.iruri.ex.vo.ExerciseDateVO;
import com.iruri.ex.vo.ExerciseKindVO;
import com.iruri.ex.vo.IClassVO;
import com.iruri.ex.vo.IUserVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class ChallengeController {

    @Autowired
    IUserService iUserService;
    @Autowired
    IClassService iClassService;
    @Autowired
    ChallengeService challengeService;

   
    
    /*----------챌린지 메인-----------*/
    // 챌린지 메인
    @GetMapping("/iruri/challengeList")
    public ModelAndView c_main(ModelAndView mav) {
        
        mav.setViewName("challenge/challenge_main2");
        // mav.addObject(null, mav);
        
        return mav;
    }
    

    
    //챌린지 메인 페이징 처리(ajax)
    @ResponseBody
    @GetMapping("/ajax/challengeList")
    public ResponseEntity<HashMap<String, Object>> challengeList(@RequestParam("pageNum") int pageNum) {
       
        HashMap<String, Object> result = new HashMap<>();
        Criteria cri = new Criteria(pageNum, 9);
       
          
        //전체챌린지
        int total = challengeService.getTotal_challenge(cri);
        log.info("ajax_getTotal_challenge:" + total);
        
        result.put("pageMaker", new PageVO(cri, total));
        log.info("ajax_pageMaker" + cri);
        
        result.put("list", challengeService.challengeList(cri));
        log.info("ajax_challengeList()..");
        
        
        return ResponseEntity.ok(result);
    }
    
    
    

    // 챌린지 메인 - 지난 챌린지

    @GetMapping("/iruri/challengeEndList")
    public ModelAndView challengeEndList(ModelAndView mav) {
        
        mav.setViewName("challenge/challenge_endList");
        
        return mav;
    }
    

    //챌린지 메인 - 지난 챌린지 페이징 처리(ajax)
    @ResponseBody
    @GetMapping("/ajax/challengeEndList")
    public ResponseEntity<HashMap<String, Object>> challengeEndList(@RequestParam("pageNum") int pageNum) {
       
        HashMap<String, Object> result = new HashMap<>();
        Criteria cri = new Criteria(pageNum, 9);

        int total = challengeService.getTotal_challengeEndList(cri);
        log.info("ajax_getTotal_challenge:" + total);
        
        result.put("pageMaker", new PageVO(cri, total));
        log.info("ajax_pageMaker" + cri);
        
        result.put("list", challengeService.challengeEndList(cri));
        log.info("ajax_challengeList()..");
        
      
        
        
        return ResponseEntity.ok(result);
    }
    
    
    
    // 챌린지 메인 - 관심 챌린지
   
    
    @GetMapping("/iruri/challengeLikeList")
    public ModelAndView challengeLikeList(ModelAndView mav) {
        
        mav.setViewName("challenge/challenge_LikeList");
        // mav.addObject(null, mav);
        
        return mav;
    }

   //챌린지 메인 - 관심 챌린지 페이징 처리(ajax)
    @ResponseBody
    @GetMapping("/ajax/challengeLikeList")
    public ResponseEntity<HashMap<String, Object>> testtest(@CurrentUser IUserVO vo, @RequestParam("pageNum") int pageNum) {
        log.info("testtest");
        
        Criteria cri = new Criteria(pageNum, 9);
        
        HashMap<String, Object> result = new HashMap<>();
        
        int userId = vo.getUserId();
        log.info("유저아이디: " + userId);
        
        int total = challengeService.getTotal_challengeLikeList(cri, userId);
        log.info("토탈: " + total);
        
        List<IClassVO> list = challengeService.challengeLikeList(cri, userId);
        result.put("list", list);
        log.info("리스트: " + list);
        
        result.put("pageMaker", new PageVO(cri, total));

        return ResponseEntity.ok(result);
    }
    
    
    
    // 챌린지 개설 작성 페이지 폼
    @GetMapping("/iruri/challenge_make_form")
    public ModelAndView c_make_form(ModelAndView mav) {

        log.info("c_make_form () ... ");
        mav.setViewName("/challenge/challenge_make_form");
        // mav.addObject(null, mav);

        return mav;
    }

    // 챌린지 개설 폼 작성 후 입력 (챌린지 등록)
    @PostMapping("/iruri/insert_challenge")
    public String c_make_form2(IClassVO iClassVO, ExerciseKindVO exerciseKindVO, Principal principal) {
        IUserVO vo = iUserService.selectOne(principal.getName());

        log.info("challenge_make_form()...");

   
        iClassVO.setClassContent("클래스생성테스트내용");
        iClassVO.setClassImage("이미지경로2");
        iClassVO.setClassLike(0);
        iClassVO.setClassState("show");
        iClassVO.setClassHit(0);
        iClassVO.setClassJoinMember(0);
        iClassVO.setClassTrainerInfo("테스트트레이너인포");
        iClassVO.setClassPrice(150000);
        iClassVO.setClassNeed("준비물테스트");
        iClassVO.setCategoryId(1);
        iClassVO.setUserId(vo.getUserId());

        log.info("iClassVO: " + iClassVO);
        log.info("exerciseKindVO: " + exerciseKindVO.getExerciseKind());

        challengeService.insertChallenge(iClassVO);

        return "redirect:challengeList";
    }

   

    // 챌린지 상세 -참여 전
    @GetMapping("/iruri/c_detail_before")
    public String c_detail_before(IClassVO iClassVO, Model model) {
        log.info("challenge_detail_before_view()..");

        model.addAttribute("challengeInfo", challengeService.getChallengeInfo(iClassVO.getClassId()));
 
        return "challenge/challenge_detail_before";
    }

    // 챌린지 상세 - 참여 후
    @GetMapping("/iruri/challenge_detail_after")
    public String c_detail_after(IClassVO iClassVO, Model model) {

        log.info("challenge_detail_after()..");
        
        //참여인원 update
        challengeService.upJoinMember(iClassVO.getClassId());

        model.addAttribute("challengeInfo", challengeService.getChallengeInfo(iClassVO.getClassId()));
        
        

        return "challenge/challenge_detail_after";
    }

}
