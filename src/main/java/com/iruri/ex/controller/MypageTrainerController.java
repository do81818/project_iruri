package com.iruri.ex.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iruri.ex.service.IClassService;
import com.iruri.ex.service.IUserService;
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
	// 메인 페이지 이동
    @RequestMapping("/mypage/trainer")
    public String mypageT(Principal principal,Model model) {
        log.info("main() ... ");
        // 제일 부모 : SecurityContextHolder
        // 제일 자식: Principal
//        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//        model.addAttribute("user", user);
//        Authentication auth = (Authentication)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//        IUserUser user = (IUserUser) auth.getPrincipal();
//        log.info(user.getIUser());
//        
//        UserDetails userDetails = (UserDetails)auth.getPrincipal();
//        
//        user = (IUserUser)userDetails;
//        log.info(user.getIUser());
        
        // 1. principal 객체에 있는 email을 받아서 서비스단으로 보낸다 ->  getName = 로그인한 이메일
        // 2. 서비스에서 함수 만들기 selectOne
        IUserVO vo = iUserService.selectOne(principal.getName());
        //10. serviceImpl에서 리턴한 객체를 이름을 지어("user") 모델에 담는다. 
        // -> 리턴한 뷰에서 모델을 인식할 수 있다.
        model.addAttribute("user", vo);
        
        model.addAttribute("classList", iClassService.classList(vo.getUserId()));
        
        log.info(iClassService.classList(vo.getUserId()));
        /* log.info(vo.getAuthList().get(0).getAuthContent()); */
        
        return "mypage_trainer/mypage_trainer_main";
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
