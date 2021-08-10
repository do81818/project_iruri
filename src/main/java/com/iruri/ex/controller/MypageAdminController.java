package com.iruri.ex.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.iruri.ex.page.Criteria;
import com.iruri.ex.page.PageVO;
import com.iruri.ex.service.AdminService;
import com.iruri.ex.vo.IUserVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/mypage/admin/*")
public class MypageAdminController {

	@Autowired
	private AdminService adminService;

	// mypageAdmin() ModelAndView 관리자 마이페이지로 이동
	@GetMapping("main")
	public ModelAndView mypageAdmin(ModelAndView mav) {
		log.info("mypageAdmin()...");
		mav.setViewName("mypage_admin/mypage_admin");

		return mav;
	}

	@ResponseBody
	@GetMapping("ajax/reportList")
	public ResponseEntity<HashMap<String, Object>> restAfter(@RequestParam("pageNum") int pageNum) {
		log.info("restAfter()...");
		HashMap<String, Object> result = new HashMap<>();
		Criteria cri = new Criteria(pageNum, 10);
		int total = adminService.countReportId();
		result.put("pageMaker", new PageVO(cri, total));
		result.put("list", adminService.getReportList(cri));

		return ResponseEntity.ok(result);
	}

//	@GetMapping("main")
//    public ModelAndView mypageAdmin(ModelAndView mav, Criteria cri) {
//        log.info("mypageAdmin()...");
//        mav.setViewName("mypage_admin/mypage_admin");
//        mav.addObject("reportList", reportService.getReportList(cri));
//        int total = reportService.countReportId();
//        mav.addObject("pageMaker", new PageVO(cri, total));
//        
//        return mav;
//    }

	// showMemberList_Admin() ModelAndView 일반유저 목록 보기
	@GetMapping("member/list")
	public ModelAndView showMemberList_Admin(ModelAndView mav) {
		log.info("showMemberList_Admin()...");
		mav.setViewName("mypage_admin/mypage_admin_memberlist");
		return mav;
	}

	@ResponseBody
	@GetMapping("ajax/memberlist")
	public ResponseEntity<HashMap<String, Object>> restMemberList(@RequestParam("pageNum") int pageNum) {

		HashMap<String, Object> result = new HashMap<>();
		Criteria cri = new Criteria(pageNum, 10);
		int total = adminService.countNormalMember();
		result.put("pageMaker", new PageVO(cri, total));
		result.put("list", adminService.getNormalUserList(cri));

		return ResponseEntity.ok(result);
	}

	// showMemberBlackList_Admin() ModelAndView 관리자 블랙리스트유저 목록 보기
	@GetMapping("member/blacklist")
	public ModelAndView showMemberBlackList_Admin(ModelAndView mav) {
		log.info("showMemberBlackList_Admin()...");
		mav.setViewName("mypage_admin/mypage_admin_memberBlackList");
		return mav;

	}

	@ResponseBody
	@GetMapping("ajax/member/blacklist")
	public ResponseEntity<HashMap<String, Object>> restMemberBlackList(@RequestParam("pageNum") int pageNum) {

		HashMap<String, Object> result = new HashMap<>();
		Criteria cri = new Criteria(pageNum, 10);
		int total = adminService.countNormalBlackMember();
		result.put("pageMaker", new PageVO(cri, total));
		result.put("list", adminService.getNormalUserBlackList(cri));

		return ResponseEntity.ok(result);
	}

	// showTrainerList_Admin() ModelAndView 관리자 트레이너 목록 보기
	@GetMapping("trainer/list")
	public ModelAndView showTrainerList_Admin(ModelAndView mav) {
		log.info("showTrainerList_Admin()...");
		mav.setViewName("mypage_admin/admin_managementTrainer");
		return mav;
	}

	@ResponseBody
	@GetMapping("ajax/trainer/list")
	public ResponseEntity<HashMap<String, Object>> restTrainerList(@RequestParam("pageNum") int pageNum) {
		HashMap<String, Object> result = new HashMap<>();
		Criteria cri = new Criteria(pageNum, 10);
		int total = adminService.countTrainerMemberList();
		result.put("pageMaker", new PageVO(cri, total));
		result.put("list", adminService.getTrainerMemberList(cri));
		log.info(result);
		return ResponseEntity.ok(result);
	}

	// showTrainerBlackList_Admin() 트레이너 블랙리스트 목록 보기
	@GetMapping("trainer/blackList")
	public ModelAndView showTrainerBlackList_Admin(ModelAndView mav) {
		log.info("showTrainerBlackList_Admin()...");
		mav.setViewName("mypage_admin/admin_managementTrainerBlackList");
		return mav;
	}

	@ResponseBody
	@GetMapping("ajax/trainer/blackList")
	public ResponseEntity<HashMap<String, Object>> restTrainerBlackList(@RequestParam("pageNum") int pageNum) {

		HashMap<String, Object> result = new HashMap<>();
		Criteria cri = new Criteria(pageNum, 10);
		int total = adminService.countTrainerBlackList();
		result.put("pageMaker", new PageVO(cri, total));
		result.put("list", adminService.getTrainerBlackList(cri));
		log.info(result);
		return ResponseEntity.ok(result);
	}

	// 트레이너 등록페이지
	@GetMapping("trainer/regist")
	public ModelAndView trainerRegist_Admin(ModelAndView mav) {

		log.info("traineAdmin().rRegist_..");
		mav.setViewName("mypage_admin/admin_managementTrainerInsert");
		return mav;
	}
	
	//insertNewTrainer_Admin() ResponseEntity 관리자 트레이너 등록하기
	@PostMapping("trainer/regist/insert")
	public String insertNewTrainer_Admin(@RequestParam("userName") String userName,@RequestParam("email1") String email1,@RequestParam("email2") String email2,
			@RequestParam("userPhone") String userPhone, @RequestParam("userPw") String userPw) {
		
		log.info("insertNewTrainer_Admin()...");
		
		String userEmail = email1+ "@"+ email2;
		
		IUserVO vo = new IUserVO();
		vo.setUserName(userName);
		vo.setUserEmail(userEmail);
		vo.setUserPhone(userPhone);
		vo.setUserPw(userPw);
		log.info(vo);
		
		adminService.trainerRegistInsert(vo);
		adminService.trainerAuthUpdate(); 
		log.info(vo);
		
		return "redirect:/mypage/admin/trainer/list";
	}
	
	
	// showMemberDetail_Admin() ModelAndView 관리자 유저기본정보 상세보기
	@GetMapping("member/info")
	public ModelAndView showMemberDetail_Admin(ModelAndView mav, @RequestParam("userId") int userId) {
		log.info("showMemberDetail_Admin()...");
		mav.setViewName("mypage_admin/admin_memberInfo");
		mav.addObject("info", adminService.getUserBasicInfo(userId));
		int totalPoint = adminService.getUserBasicInfoPointTotal(userId);
		DecimalFormat formatter = new DecimalFormat("###,###");
		mav.addObject("point",formatter.format(totalPoint));
		log.info(mav);
		return mav;
	}

	//  유저기본정보 상세보기 _ 포인트리스트
	@ResponseBody
	@GetMapping("ajax/member/info")
	public ResponseEntity<HashMap<String, Object>> restMemberDetail(@RequestParam("userId") int userId, @RequestParam("pageNum") int pageNum) {
	    log.info(userId);
		HashMap<String, Object> result = new HashMap<>();
		Criteria cri = new Criteria(pageNum, 10);
		int total = adminService.countUserBasicInfoPoint(userId);
		result.put("pageMaker", new PageVO(cri, total));
		result.put("pointlist", adminService.getUserBasicInfoPoint(userId, cri));
		log.info(result);
		return ResponseEntity.ok(result);
	}
	
	
	// showMemberDetailExercise_Admin() ModelAndView 관리자 유저운동정보 상세보기
	@GetMapping("member/exerciseinfo")
	public String showMemberDetailExercise_Admin(Locale locale, Model model) {

		return "mypage_admin/admin_memberExerciseInfo";
	}
	
	
	// showProfileTrainer_Admin() ModelAndView 트레이너 프로필 보기
	@GetMapping("trainer/info")
	public ModelAndView showProfileTrainer_Admin(ModelAndView mav, @RequestParam("userId") int userId) {

        log.info("showProfileTrainer_Admin()...");
        mav.setViewName("mypage_admin/admin_trainerInfo");
        mav.addObject("info", adminService.getUserBasicInfo(userId));
        // 트레이너 평점
        mav.addObject("grade",adminService.getTrainerGrade(userId));
        log.info(mav);
        return mav;
    }
	

    //  트레이너정보 상세보기_수익관리
    @ResponseBody
    @GetMapping("ajax/trainer/info")
    public ResponseEntity<HashMap<String, Object>> restTrainerDetail(@RequestParam("userId") int userId, 
            @RequestParam("month") int month, @RequestParam("pageNum") int pageNum) {
        log.info(userId);
        HashMap<String, Object> result = new HashMap<>();
        Criteria cri = new Criteria(pageNum, 10);
        int total = adminService.countTrainerMoneyList(userId, month);
        result.put("pageMaker", new PageVO(cri, total));
        result.put("list", adminService.getTrainerMoneyList(userId, month, cri));
        result.put("month", month);
        log.info(month);
        result.put("monthTotal", adminService.trainerMoneyMonthTotal(userId, month));
        log.info(adminService.trainerMoneyMonthTotal(userId, month));
        log.info(result);
        return ResponseEntity.ok(result);
    }
	
	
    // updateBlackList_Admin() ModelAndView 관리자 블랙리스트 수정
    @ResponseBody
    @PostMapping("ajax/update/blacklist")
    public ResponseEntity<HashMap<String, Object>> restUpdateBlacklist(@RequestParam("userId") int userId, @RequestParam("number") String numberStr, @RequestParam("reason") String reason) {
        HashMap<String, Object> result = new HashMap<>();
        log.info("restUpdateBlacklist()..");
        int number = 0;
        if(numberStr.equals("true")) {
            number = 1;
        } else {
            number = 0;
        }
        adminService.updateBlackList(userId, number);
        log.info("1");
        if(reason != null) {
            adminService.updateBlackListReason(userId, reason);
        }
        result.put("info", adminService.getUserBasicInfo(userId));
        log.info(result);
        return ResponseEntity.ok(result);
    }
           
//    public void restUpdateBlacklist(HttpServletResponse response, @RequestParam("userId") int userId, @RequestParam("number") String numberStr, ModelAndView mav) throws IOException {
//        int number = 0;
//        if(numberStr.equals("true")) {
//            number = 1;
//        } else {
//            number = 0;
//        }
//        adminService.updateBlackList(userId, number);
//        log.info("restUpdateBlacklist()..");
//        
//        response.sendRedirect("/ex/mypage/admin/trainer/info?userId=" + userId);       
//        
//    }
	
	
	
	
	

	// showPayList_Admin() ModelAndView 관리자 수익 목록 보기
	@GetMapping("paylist")
	public String showPayList_Admin(Locale locale, Model model) {

		return "mypage_admin/admin_managementMoney";
	}

	
	// insertPoint_Admin() ModelAndView 관리자 포인트 등록
	
	// deleteTrainer_Admin() ResponseEntity 관리자 트레이너 탈퇴 전환
	// showPayDetail_Admin() ModelAndView 관리자 수익 상세 보기
	
	
	
	// test
//    @GetMapping("test")
//    public ModelAndView test(ModelAndView mav, @RequestParam("userId") int userId) {
//        log.info("test()...");
//        mav.setViewName("mypage_admin/test");
//        
//        return mav;
//    }
//    
//    @ResponseBody
//    @GetMapping("ajax/test")
//    public ResponseEntity<HashMap<String, Object>> restTest(@RequestParam("userId") int userId, @RequestParam("pageNum") int pageNum) {
//        log.info(userId);
//        HashMap<String, Object> result = new HashMap<>();
//        Criteria cri = new Criteria(pageNum, 10);
//        result.put("pageMaker", new PageVO(cri, 20));
//        result.put("list", adminService.test(userId, cri));
//        log.info(result);
//        return ResponseEntity.ok(result);
//    }
}