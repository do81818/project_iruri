package com.iruri.ex.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iruri.ex.service.IClassService;
import com.iruri.ex.service.IUserService;
import com.iruri.ex.vo.IClassVO;
import com.iruri.ex.vo.IUserVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class MypageTrainerController {
    
    @Autowired
    IUserService iUserService;
    @Autowired
    IClassService iClassService;

	// 마이페이지로 이동
    @RequestMapping("/mypage/trainer")
    public String mypageT(Principal principal,Model model) {
        log.info("main() ... ");
        // 제일 부모 : SecurityContextHolder
        // 제일 자식: Principal
        
        // 1. principal 객체에 있는 email을 받아서 서비스단으로 보낸다 ->  getName = 로그인한 이메일
        // 2. 서비스에서 함수 만들기 selectOne
       IUserVO vo = iUserService.selectOne(principal.getName());
        //10. serviceImpl에서 리턴한 객체를 이름을 지어("user") 모델에 담는다. 
        // -> 리턴한 뷰에서 모델을 인식할 수 있다.
       model.addAttribute("user", vo);
        
        /*
         * List<IClassVO> classList = iClassService.classList(vo.getUserId());
         * model.addAttribute("classList", classList);
         */
        
        /* log.info(iClassService.classList(vo.getUserId())); */
        /* log.info(vo.getAuthList().get(0).getAuthContent()); */
        
        
        return "mypage_trainer/mypage_trainer_main";
    }
    
    

    // ajax(모든 클래스 리스트-현재 운영중인 클래스+ 종료된 클래스)
    @ResponseBody
    @RequestMapping("/mypage/trainerTest")
    public List<IClassVO> mypageT2(Principal principal) {
        
      IUserVO vo = iUserService.selectOne(principal.getName());
      List<IClassVO> classVOList =  iClassService.classList(vo.getUserId());
      
      return classVOList;
    }  
    
   
    
    // ajax
    // 현재 운영중인 클랴스
    @ResponseBody
    @RequestMapping("/mypage/trainercurrent")
    public List<IClassVO> mypagecurrnet(Principal principal) {
        
      IUserVO vo = iUserService.selectOne(principal.getName());
      List<IClassVO> classVOList2 =  iClassService.classCurrentList(vo.getUserId());
      
      return classVOList2;
    }
    
 
    // ajax
    // 종료된 클랴스
    @ResponseBody
    @RequestMapping("/mypage/trainerclassend")
    public List<IClassVO> mypageend(Principal principal) {
        
      IUserVO vo = iUserService.selectOne(principal.getName());
      List<IClassVO> classVOList3 =  iClassService.classEndList(vo.getUserId());
      
      return classVOList3;
    }
    
    
    
    // ModelAndView 버전
    /*
     * @RequestMapping("/mypage/trainer") public ModelAndView mypageT(Principal
     * principal, ModelAndView mav) { log.info("main() ... ");
     * 
     * 
     * IUserVO vo = iUserService.selectOne(principal.getName());
     * 
     * mav.setViewName("mypage_trainer/mypage_trainer_main"); mav.addObject("user",
     * vo);
     * 
     * 
     * return mav; }
     */
    

}
