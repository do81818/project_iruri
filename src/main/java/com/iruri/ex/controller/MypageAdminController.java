package com.iruri.ex.controller;

import java.util.HashMap;
import java.util.Locale;

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

		log.info("trainerRegist_Admin()...");
		mav.setViewName("mypage_admin/admin_managementTrainerInsert");
		return mav;
	}
	// insertNewTrainer_Admin() ResponseEntity 관리자 트레이너 등록하기
//	@ResponseBody
//	@PostMapping("trainer/regist/insert")
//	public ResponseEntity<IUserVO> insertNewTrainer_Admin(@RequestParam("inputName") String inputName,
//			@RequestParam("email1") String email1, @RequestParam("email2") String email2, 
//			@RequestParam("inputPhoneNumber") String inputPhoneNumber, @RequestParam("inputPassword") String inputPassword) {
//		
//		log.info("insertNewTrainer_Admin()...");
//		
//		String userName = inputName;
//		String userEmail = email1 +"@"+ email2;
//		String userPhone = inputPhoneNumber;
//		String userPw = inputPassword;
//		
//		IUserVO vo = new IUserVO();
//		vo.setUserName(userName);
//		vo.setUserEmail(userEmail);
//		vo.setUserPhone(userPhone);
//		vo.setUserPw(userPw);
//		log.info(vo);
//		
//		return 
//		
//		
//		
//		
//		mav.setViewName("mypage_admin/admin_managementTrainer_insert");
//		return mav;
//	}
	
	
	// showMemberDetail_Admin() ModelAndView 관리자 유저기본정보 상세보기
	@GetMapping("member/info")
	public ModelAndView showMemberDetail_Admin(ModelAndView mav, @RequestParam("userId") int userId) {
		log.info("showMemberDetail_Admin()...");
		mav.setViewName("mypage_admin/admin_memberInfo");
		mav.addObject("info", adminService.getUserBasicInfo(userId));
		log.info(mav);
		return mav;
	}

	@ResponseBody
	@GetMapping("ajax/member/info")
	public ResponseEntity<HashMap<String, Object>> restMemberDetail(@RequestParam("userId") int userId, @RequestParam("pageNum") int pageNum) {

		HashMap<String, Object> result = new HashMap<>();
		Criteria cri = new Criteria(pageNum, 10);
		int total = adminService.countUserBasicInfoPoint();
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
	
	// deleteTrainer_Admin() ResponseEntity 관리자 트레이너 탈퇴 전환
	// showPayDetail_Admin() ModelAndView 관리자 수익 상세 보기
}