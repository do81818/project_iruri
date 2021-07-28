package com.iruri.ex.controller;

import java.security.Principal;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.iruri.ex.page.Criteria;
import com.iruri.ex.page.PageVO;
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
    
    //챌린지 메인
//    @GetMapping("/iruri/challenge_main")
//    public ModelAndView c_main(ModelAndView mav) {
//        
//        mav.setViewName("/challenge/challenge_main");
//        // mav.addObject(null, mav);
//        
//        return mav;
//    }
    
    //챌린지 메인
    /*
    @RequestMapping("/iruri/challenge_main")
    public String c_main(Principal principal, Model model) {
        log.info("challenge main()..");
        
        model.addAttribute("challengeList", iClassService.challengeList());
        
        log.info(iClassService.challengeList());
        
        return "challenge/challenge_main";        
        
    }
    */
    

    
    //챌린지 메인 페이징처리 
    
    @GetMapping("/iruri/challengeList")
    public String challengeList(Criteria cri, Model model) {
        log.info("challenge_list()..");
        log.info(cri);
        
        model.addAttribute("challengeList", challengeService.challengeList(cri));
        
        int total = challengeService.getTotal_challenge(cri);
        log.info("getTotal_challenge" + total);
        model.addAttribute("pageMaker", new PageVO(cri, total));
        
        return "challenge/challenge_main2";
    }
    
    
    //ajax 챌린지 메인 페이징 
    @GetMapping("/rest/after")
    public ResponseEntity<HashMap<String, Object>> restAfter(Criteria cri){
        HashMap<String, Object> result = new HashMap<>();
        
        int total = challengeService.getTotal_challenge(cri);
        result.put("pageMaker", new PageVO(cri, total));
        result.put("challengeList", challengeService.challengeList(cri));
        
        return ResponseEntity.ok(result);
    }
    
    // ajax(모든 클래스 리스트-현재 운영중인 클래스+ 종료된 클래스)
    @ResponseBody
    @RequestMapping("/iruri/challengeAllList")
    public List<IClassVO> challengeAllList(Criteria cri){
        
      
      List<IClassVO> classVOList =  challengeService.challengeList(cri);
      
      return classVOList;
    }  
    

    
    //챌린지 메인 - 지난 챌린지
    @GetMapping("/iruri/challengeEndList")
    public String challengeEndList(Criteria cri, Model model) {
        log.info("challengeEndList()..");
        log.info(cri);
        
        model.addAttribute("challengeEndList", challengeService.challengeEndList(cri));
        
        int total = challengeService.getTotal_challengeEndList(cri);
        log.info("getTotal_challengeEndList" + total);
        model.addAttribute("pageMaker", new PageVO(cri, total));
        
        return "challenge/challenge_endList";
    }
  
    
    //챌린지 개설 작성 페이지 폼
    @GetMapping("/iruri/challenge_make_form")
    public ModelAndView c_make_form(ModelAndView mav) {
        
        log.info("c_make_form () ... ");
        mav.setViewName("/challenge/challenge_make_form");
        // mav.addObject(null, mav);
        
        return mav;
    }
    
    //챌린지 개설 폼 작성 후 입력 (챌린지 등록)
    @PostMapping("/iruri/insert_challenge")
    public String c_make_form2(IClassVO iClassVO, ExerciseKindVO exerciseKindVO, Principal principal) {
        IUserVO vo = iUserService.selectOne(principal.getName());
        
        log.info("challenge_make_form()...");
   

        // DB에서 클래스타이틀이 한글이 깨져요
        //iClassVO.setClassId(114);
        iClassVO.setClassContent("클래스생성테스트내용"); 
        //iClassVO.setClassGoal("목표2");
        //iClassVO.setClassExerciseCount(0);
        //iClassVO.setClassStartDate(s);
        //iClassVO.setClassEndDate(e);
        iClassVO.setClassImage("이미지경로2");
        iClassVO.setClassLike(0);
        iClassVO.setClassState("show");
        iClassVO.setClassHit(0);
        iClassVO.setClassJoinMember(0);
        iClassVO.setClassTrainerInfo("테스트트레이너인포");
        //iClassVO.setClassTotalMember(20);
        iClassVO.setClassPrice(150000);
        iClassVO.setClassNeed("준비물테스트");
        iClassVO.setCategoryId(1);
        //iClassVO.setClassLevel("easy");
        iClassVO.setUserId(vo.getUserId());
       
        
        log.info("iClassVO: " + iClassVO);
        log.info("exerciseKindVO: " + exerciseKindVO.getExerciseKind());
     
        
        challengeService.insertChallenge(iClassVO);
       
        
        
        return "redirect:iruri/insert_challenge";
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
