package com.iruri.ex.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iruri.ex.service.IClassService;
import com.iruri.ex.service.IUserInfoService;
import com.iruri.ex.service.IUserService;
import com.iruri.ex.vo.IUserInfoVO;
import com.iruri.ex.vo.IUserVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class MypageUserController {
	
	
	@Autowired
	IUserService iUserService;
	@Autowired
	IUserInfoService iUserinfoService;
	@Autowired
    IClassService iClassService;

		
	// 마이페이지의 메인
	@GetMapping("/mypage")
    public String test(Principal principal, IUserVO iuservo,Model model) {
        log.info("test()..");

        // 로그인한 유저의 정보 받아오기
        IUserVO vo = iUserService.selectOne(principal.getName());
        model.addAttribute("user",vo) ;

        // 유저의 신체정보 받아오기
        List<IUserInfoVO> infoVO = iUserinfoService.userinfoList(vo.getUserId());
        model.addAttribute("userinfo",infoVO) ;
        log.info(infoVO);

        // 유저의 클래스 갯수 받아오기 (수정해야함)
        // 내가 한거
        int classcountvo = iClassService.classcount(vo.getUserId());
        model.addAttribute("iclass",classcountvo);
        log.info(classcountvo);

        //몸무게 입력한 월 받아오기
        int writedatevo = iUserinfoService.userheightdate(vo.getUserId());
        model.addAttribute("writedate",writedatevo);

        return "/mypage_user/mypage_user_main";
    }

	
	// 마이페이지의 보드리스트 페이지
    // 메인 페이지 이동
	   @RequestMapping("/mypage/boardlist")
	   public String main() {
	       log.info("main() ... ");
	       
	      return "/mypage_user/mypage_user_boardlist";
	   }
}
