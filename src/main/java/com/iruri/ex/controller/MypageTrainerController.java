package com.iruri.ex.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.iruri.ex.page.Criteria;
import com.iruri.ex.page.PageVO;
import com.iruri.ex.security.CurrentUser;
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
    public String mypageT(Principal principal, Model model) {
        log.info("main() ... ");
        // 제일 부모 : SecurityContextHolder
        // 제일 자식: Principal

        // 1. principal 객체에 있는 email을 받아서 서비스단으로 보낸다 -> getName = 로그인한 이메일
        // 2. 서비스에서 함수 만들기 selectOne
        IUserVO vo = iUserService.selectOne(principal.getName());
        // 10. serviceImpl에서 리턴한 객체를 이름을 지어("user") 모델에 담는다.
        // -> 리턴한 뷰에서 모델을 인식할 수 있다.
        model.addAttribute("user", vo);

        /*
         * List<IClassVO> classList = iClassService.classList(vo.getUserId());
         * model.addAttribute("classList", classList);
         */

        return "mypage_trainer/mypage_trainer_main";
    }

 
    // 수익
    @RequestMapping("/mypage/trainer/profit")
    public String mypageProfit(Principal principal, Model model) {
        log.info("profit() ... ");
        
        // 유저정보 받기
        IUserVO vo = iUserService.selectOne(principal.getName()); 
        model.addAttribute("user", vo);
        

        return "mypage_trainer/mypage_trainer_profit";
    }
    
    
    //트레이너 마이페이지 메인-페이징 처리(ajax)
    @ResponseBody
    @GetMapping("/ajax/mypage/trainerCurrent")
    public ResponseEntity<HashMap<String, Object>> mypageTrainerMainAjax(@CurrentUser IUserVO vo, @RequestParam("pageNum") int pageNum) {
        log.info("mypageTrainerMainAjax");
        
        Criteria cri = new Criteria(pageNum, 6);
        
        HashMap<String, Object> result = new HashMap<>();
        
        int userId = vo.getUserId();
        log.info("유저아이디: " + userId);
        
        int total = iClassService.getTotal_mypageTrainerClassList(cri, userId);
        log.info("토탈: " + total);
        
        List<IClassVO> list = iClassService.mypageTrainerClassList(cri, userId);
        
        result.put("list", list);
        
        log.info("리스트: " + list);
        
        result.put("pageMaker", new PageVO(cri, total));

        return ResponseEntity.ok(result);
    }
    
    // 종료된 클랴스
    @ResponseBody
    @GetMapping("/ajax/mypage/trainerEnd")
    public ResponseEntity<HashMap<String, Object>> mypageTrainerMainAjaxEnd(@CurrentUser IUserVO vo, @RequestParam("pageNum") int pageNum) {
        log.info("mypageTrainerMainAjax");
        
        Criteria cri = new Criteria(pageNum, 6);
        
        HashMap<String, Object> result = new HashMap<>();
        
        int userId = vo.getUserId();
        log.info("유저아이디: " + userId);
        
        int total = iClassService.getTotal_mypageTrainerClassListEnd(cri, userId);
        log.info("토탈: " + total);
        
        List<IClassVO> list = iClassService.mypageTrainerClassListEnd(cri, userId);
        
        result.put("list", list);
        
        log.info("리스트: " + list);
        
        result.put("pageMaker", new PageVO(cri, total));

        return ResponseEntity.ok(result);
    }
    


}
