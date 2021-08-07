package com.iruri.ex.controller;

import java.net.http.HttpRequest;
import java.security.Principal; 
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.iruri.ex.page.Criteria;
import com.iruri.ex.page.PageVO;
import com.iruri.ex.security.CurrentUser;
import com.iruri.ex.service.ChallengeService;
import com.iruri.ex.service.IClassService;
import com.iruri.ex.service.IUserService;
import com.iruri.ex.vo.BuyVO;
import com.iruri.ex.vo.ExerciseDateVO;
import com.iruri.ex.vo.ExerciseKindVO;
import com.iruri.ex.vo.IClassVO;
import com.iruri.ex.vo.IUserVO;
import com.iruri.ex.vo.LikeListVO;

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
    public ResponseEntity<HashMap<String, Object>> challengeList(@RequestParam("pageNum") int pageNum, 
            @RequestParam("keyword") String keyword) {
        
        HashMap<String, Object> result = new HashMap<>();
        Criteria cri = new Criteria(pageNum, 9);
   
        cri.setKeyword(keyword);
        
            
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
    public ResponseEntity<HashMap<String, Object>> challengeEndList(@RequestParam("pageNum") int pageNum, @RequestParam("keyword") String keyword) {
        log.info("challengeEndList() keyword: " + keyword);
        
        HashMap<String, Object> result = new HashMap<>();
        Criteria cri = new Criteria(pageNum, 9);
        
        cri.setKeyword(keyword);

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
        
        return mav;
    }

   //챌린지 메인 - 관심 챌린지 페이징 처리(ajax)
    @ResponseBody
    @GetMapping("/ajax/challengeLikeList")
    public ResponseEntity<HashMap<String, Object>> testtest(@CurrentUser IUserVO vo, Criteria cri) {
      
        HashMap<String, Object> result = new HashMap<>();
        
        int userId = vo.getUserId();
        log.info("유저아이디: " + userId);
        log.info("cri: " + cri);
        
        int total = challengeService.getTotal_challengeLikeList(cri, userId);
        log.info("토탈: " + total);
        
        List<IClassVO> list = challengeService.challengeLikeList(cri, userId);
        result.put("list", list);
        log.info("리스트: " + list);
        
        result.put("pageMaker", new PageVO(cri, total));

        return ResponseEntity.ok(result);
    }
    
    
    
    
    /*-------------챌린지 개설 폼-------------*/
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
    public String c_make_form2(IClassVO iClassVO, @CurrentUser IUserVO vo) {
        log.info("challenge_make_form()...");

        // classTitle 챌린지명      
        // classLevel 운동강도
        // startdate, enddate 운동 기간 
        // classExerciseCount 주 몇회
        // classTotalMember 총 모집인원
        // classGoal 목표
        // classContent 상세정보
        // classImage 대표이미지
        
        iClassVO.setIUserVO(vo);
        challengeService.insertChallenge(iClassVO);
        log.info("iClassVO: " + iClassVO);

        return "redirect:challengeList";
    }

   
    /*-------------챌린지 상세 페이지-------------*/
    // 챌린지 상세 -참여 전
    @GetMapping("/iruri/challenge_detail_before")
    public ModelAndView c_detail_before(ModelAndView mav, IClassVO iClassVO) {
        mav.setViewName("challenge/challenge_detail_before");
        //챌린지 정보
        mav.addObject("challengeInfo", challengeService.getChallengeInfo(iClassVO.getClassId()));
        return mav;
    }
    
    //댓글부분
    @ResponseBody
    @GetMapping("/ajax/c_detail_before_reply")
    public ResponseEntity<HashMap<String, Object>> challenge_detail_before(@RequestParam("pageNum") int pageNum, 
            @RequestParam("classId") int classId){
        HashMap<String, Object> result = new HashMap<>();
        Criteria cri = new Criteria(pageNum, 6);
        log.info(classId);
       int total = challengeService.getTotal_challengeReply(cri,classId);
       result.put("pageMaker", new PageVO(cri,total));
       result.put("replyList", challengeService.challengeReplyList(cri,classId));
       
       return ResponseEntity.ok(result); 
    }
    
    
    //챌린지 참여 버튼 클릭(참여전 -> 참여후)
    @PostMapping("iruri/insert_user_challenge")
    public String insertUserChallenge(IClassVO iClassVO, @CurrentUser IUserVO vo) {

        return"redirect:challenge_detail_after";
    }

    
    //챌린지 상세-참여 후 
    @GetMapping("/iruri/challenge_detail_after")
    public ModelAndView c_detail_after(ModelAndView mav, IClassVO iClassVO, BuyVO buyVO, @CurrentUser IUserVO vo) {
        mav.setViewName("challenge/challenge_detail_after");
        //챌린지 정보
        mav.addObject("challengeInfo", challengeService.getChallengeInfo(iClassVO.getClassId()));
        
        //참여인원 update
        challengeService.upJoinMember(iClassVO.getClassId());
        log.info("challenge up join member()..");
        
        //유저챌린지목록(buy table) insert
        buyVO.setIUserVO(vo);
       
        challengeService.userJoinChallenge(buyVO);
        log.info("insert user Join Challenge()..");
        return mav;
    }
    
    //댓글부분
    @ResponseBody
    @GetMapping("/ajax/c_detail_after_reply")
    public ResponseEntity<HashMap<String, Object>> challenge_after_before(@RequestParam("pageNum") int pageNum, 
            @RequestParam("classId") int classId){
        HashMap<String, Object> result = new HashMap<>();
        Criteria cri = new Criteria(pageNum, 6);
        log.info(classId);
       int total = challengeService.getTotal_challengeReply(cri,classId);
       result.put("pageMaker", new PageVO(cri,total));
       result.put("replyList", challengeService.challengeReplyList(cri,classId));
       
       return ResponseEntity.ok(result); 
    }
    
    
    
    
    // 챌린지 상세 - 참여 후
    /*
    @GetMapping("/iruri/challenge_detail_after")
    public String c_detail_after(IClassVO iClassVO, BuyVO buyVO, Model model,@CurrentUser IUserVO vo) {

        log.info("challenge_detail_after()..");
        
        //참여인원 update
        challengeService.upJoinMember(iClassVO.getClassId());
        log.info("challenge up join member()..");
        
        //유저챌린지목록(buy table) insert
        buyVO.setIUserVO(vo);
       
        challengeService.userJoinChallenge(buyVO);
        log.info("insert user Join Challenge()..");
      
        //챌린지 정보
        model.addAttribute("challengeInfo", challengeService.getChallengeInfo(iClassVO.getClassId()));

        return "challenge/challenge_detail_after";
    }
    */
    
    /*-------------관심수-------------*/
    //유저가 좋아요 한 기록이 있는지
    @GetMapping("/iruri/heart")
    @ResponseBody
    public int heart(@RequestParam("classId") int classId, @CurrentUser IUserVO vo) {
        
        return challengeService.getUserLikeListCheck(classId, vo.getUserId());
    }
    
    //좋아요 하면 likelist에 추가하고 삭제하기 
    @GetMapping("/iruri/heartList")
    @ResponseBody
    public int heartList(@RequestParam("classId") int classId, @CurrentUser IUserVO vo) {
        
        return challengeService.getUserHeartList(classId, vo.getUserId());
    }
    
   

}
