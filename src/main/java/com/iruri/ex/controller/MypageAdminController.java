package com.iruri.ex.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.iruri.ex.page.Criteria;
import com.iruri.ex.page.PageVO;
import com.iruri.ex.service.ReportService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/mypage/admin/*")
public class MypageAdminController {

    @Autowired
    private ReportService reportService;
    
    
	// mypageAdmin() ModelAndView 관리자 마이페이지로 이동
	@GetMapping("main")
	public ModelAndView mypageAdmin(ModelAndView mav, Criteria cri) {
	    log.info("mypageAdmin()...");
	    mav.setViewName("mypage_admin/mypage_admin");
	    mav.addObject("reportList", reportService.getReportList(cri));
	    int total = reportService.countReportId();
	    mav.addObject("pageMaker", new PageVO(cri, total));
	    
		return mav;
	}

	// showMemberList_Admin() ModelAndView 관리자 유저 목록 보기
	@GetMapping("member/list")
	public String showMemberList_Admin(Locale locale, Model model) {

		return "mypage_admin/mypage_admin_memberlist";
	}

	// showMemberBlackList_Admin() ModelAndView 관리자 블랙리스트유저 목록 보기
	@GetMapping("member/blacklist")
	public String showMemberBlackList_Admin(Locale locale, Model model) {

		return "mypage_admin/mypage_admin_memberBlackList";
	}

	// showMemberDetail_Admin() ModelAndView 관리자 유저기본정보 상세보기
	@GetMapping("member/info")
	public String showMemberDetail_Admin(Locale locale, Model model) {

		return "mypage_admin/admin_memberInfo";
	}

	// showMemberDetailExercise_Admin() ModelAndView 관리자 유저운동정보 상세보기
	@GetMapping("member/exerciseinfo")
	public String showMemberDetailExercise_Admin(Locale locale, Model model) {

		return "mypage_admin/admin_memberExerciseInfo";
	}

	// showTrainerList_Admin() ModelAndView 관리자 트레이너 목록 보기
	@GetMapping("trainer/list")
	public String showTrainerList_Admin(Locale locale, Model model) {

		return "mypage_admin/admin_managementTrainer";
	}
	
	// showProfileTrainer_Admin() ModelAndView 트레이너 프로필 보기
	@GetMapping("trainer/info")
	public String showProfileTrainer_Admin(Locale locale, Model model) {

		return "mypage_admin/admin_trainerInfo";
	}

	// showPayList_Admin() ModelAndView 관리자 수익 목록 보기
	@GetMapping("paylist")
	public String showPayList_Admin(Locale locale, Model model) {

		return "mypage_admin/admin_managementMoney";
	}

	// updateBlackList_Admin() ModelAndView 관리자 블랙리스트 수정
	// insertPoint_Admin() ModelAndView 관리자 포인트 등록
	// insertNewTrainer_Admin() ResponseEntity 관리자 트레이너 등록하기
	// deleteTrainer_Admin() ResponseEntity 관리자 트레이너 탈퇴 전환
	// showPayDetail_Admin() ModelAndView 관리자 수익 상세 보기
}