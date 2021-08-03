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
import org.springframework.web.bind.annotation.ResponseBody;

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
    
    // ajax
    // 현재 운영중인 클랴스
    /*
     * @ResponseBody
     * 
     * @RequestMapping("/mypage/trainercurrent") public List<IClassVO>
     * mypagecurrnet(@CurrentUser IUserVO vo) {
     * 
     * List<IClassVO> classVOList2 = iClassService.classCurrentList(vo.getUserId());
     * 
     * return classVOList2; }
     */
    // ajax
    // 종료된 클랴스
    @ResponseBody
    @GetMapping("/mypage/trainerclassend")
    public List<IClassVO> mypageend(@CurrentUser IUserVO vo) {
        
      List<IClassVO> classVOList3 =  iClassService.classEndList(vo.getUserId());
      
      return classVOList3;
    }
    
    
    // ajax
    // 현재 운영중인 클랴스
    @ResponseBody
    @GetMapping("/mypage/trainercurrent")
    public ResponseEntity<HashMap<String, Object>> mypageCurrent(@CurrentUser IUserVO vo, Criteria cri) {
      HashMap<String, Object> result = new HashMap<>();
      //List<IClassVO> classVOList2 =  iClassService.classCurrentList(vo.getUserId());
      int total = iClassService.getTotal(vo.getUserId(),cri);
      result.put("pageMaker", new PageVO(cri, total));
      result.put("list", iClassService.getList(vo.getUserId(), cri));

      return ResponseEntity.ok(result);
      
    }
    
    /*
     * @GetMapping("/mypage/trainer") public String list(Criteria cri, Model model)
     * { log.info("challenge_list().."); log.info(cri);
     * 
     * model.addAttribute("challengeList", iClassService.classCurrentList(cri));
     * 
     * 
     * int total = iClassService.getTotal(cri); 
     * log.info("total" + total);
     * model.addAttribute("pageMaker", new PageVO(cri, total) );
     * 
     * return "mypage_trainer/mypage_trainer_main"; }
     */
    
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
