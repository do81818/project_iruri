package com.iruri.ex.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.iruri.ex.service.IUserInfoService;
import com.iruri.ex.service.IUserService;
import com.iruri.ex.service.IUserUpdateService;
import com.iruri.ex.service.PointService;
import com.iruri.ex.service.UserChallengeService;
import com.iruri.ex.page.Criteria;
import com.iruri.ex.page.PageVO;
import com.iruri.ex.security.CurrentUser;
import com.iruri.ex.service.BoardService;
import com.iruri.ex.service.ChallengeService;
import com.iruri.ex.service.IClassService;
import com.iruri.ex.service.IUserInfoService;
import com.iruri.ex.service.IUserService;
import com.iruri.ex.vo.BoardVO;
import com.iruri.ex.vo.IClassVO;
import com.iruri.ex.vo.IUserInfoVO;

import com.iruri.ex.vo.IUserVO;
import com.iruri.ex.vo.PointVO;

import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Post;

@Log4j
@Controller
public class MypageUserController {
	
	
	@Autowired
	IUserService iUserService;
	@Autowired
	IUserInfoService iUserinfoService;
	@Autowired
    IClassService iClassService;
	@Autowired
	BoardService boardService;
	@Autowired
	PointService pointService;
	@Autowired
	IUserUpdateService iuserupdateService;
	@Autowired
	UserChallengeService userchallengeService;
	@Autowired
	ChallengeService challengeService;

		
	// 마이페이지의 메인
	@GetMapping("/mypage")
    public String main(Principal principal, IUserVO iuservo, Model model) {
        log.info("test()..");

        // 로그인한 유저의 정보 받아오기
        IUserVO vo = iUserService.selectOne(principal.getName());
        model.addAttribute("user",vo) ;

        // 유저의 신체정보 받아오기
        List<IUserInfoVO> infoVO = iUserinfoService.userinfoList(vo.getUserId());
        model.addAttribute("userinfo",infoVO) ;
        log.info(infoVO);

        // 유저의 챌린지 갯수 받아오기 (수정해야함)
		  int challengecountvo = userchallengeService.challengecount(vo.getUserId());
		  log.info(challengecountvo);
		  model.addAttribute("userchallengecount",challengecountvo);
        

		// 유저의 작성글 갯수 받아오기
        int boardcountvo = boardService.boardcount(vo.getUserId());
        model.addAttribute("boardcount",boardcountvo);
        log.info(boardcountvo);
        
        // 유저의 토탈 포인트
        int totalpointvo = pointService.totalpoint(vo.getUserId());
        model.addAttribute("totalpoint",totalpointvo);
        log.info(totalpointvo);

		/*
		 * //몸무게 입력한 월 받아오기 int writedatevo =
		 * iUserinfoService.userheightdate(vo.getUserId());
		 * model.addAttribute("writedate",writedatevo);
		 */
        // 유저의 참여 클래스 갯수
        int classcountvo = userchallengeService.classcount(vo.getUserId());
        log.info(classcountvo);
        model.addAttribute("userclasscount",classcountvo);  
        
        // 유저의 올해 몸무게 그래프
        List<IUserInfoVO> useryearweight = iUserinfoService.useryearweight(vo.getUserId());
        model.addAttribute("useryearweight",useryearweight);
        log.info("유저의올해 몸무게"+useryearweight);
        
        // 유저의 이번달 몸무게 그래프
        List<IUserInfoVO> usermonthweight = iUserinfoService.usermonthweight(vo.getUserId());
        model.addAttribute("usermonthweight",usermonthweight);
        log.info("유저의 이번달 몸무게"+usermonthweight);
        
        // 유저의 비만도 (BMI)
        int userbmi = iUserinfoService.userbmi(vo.getUserId());
        model.addAttribute("userbmi",userbmi);
        log.info("유저의bmi"+userbmi);
        

        return "/mypage_user/mypage_user_main";  
    }
	
	// 캘린더 ajax 통신
	@ResponseBody
	@GetMapping("/calendar")
	public List<IClassVO> calendar(@CurrentUser IUserVO user) {
		
		/*
		 * Date nowDate = new Date(); 
		 * SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd"); 
		 * log.info(simpleDateFormat.format(nowDate));
		 */
		
		int userId = user.getUserId();
		List<IClassVO> calendar = userchallengeService.getCalendar(userId);
		
		return calendar;
	}

	// 유저정보 업데이트
	@GetMapping("/update")
    public String update(Principal principal, IUserVO iuservo, Model model) {
        log.info("test()..");

        // 로그인한 유저의 정보 받아오기
        IUserVO vo = iUserService.selectOne(principal.getName());
        model.addAttribute("user",vo) ;


        // 모달 회원정보 업데이트
 		log.info("modify().." + iuservo);	
 		log.info("principal.getName().." + principal.getName());	
 		
 		iuservo.setUserId(vo.getUserId());
 	    iuserupdateService.update(iuservo);
 	    

        return "redirect:/mypage";
        
    }
	
	// 유저신체정보 업데이트
	@GetMapping("/infoupdate")
    public String infoupdate(Principal principal, IUserInfoVO iuserinfovo, Model model) {
        log.info("test()..");

        // 로그인한 유저의 정보 받아오기
        IUserVO vo = iUserService.selectOne(principal.getName());
        model.addAttribute("user",vo) ;


        // 모달 회원정보 업데이트
 		log.info("modify().." + iuserinfovo);	
 		log.info("principal.getName().." + principal.getName());	
 		
 		iuserinfovo.setUserId(vo.getUserId());
 	    iuserupdateService.infoupdate(iuserinfovo);

        return "redirect:/mypage";
        
    }

	
	// 마이페이지의 보드리스트 페이지
    // 메인 페이지 이동
	@GetMapping("/mypage/boardlist")
	   public String boardmain(Principal principal,Model model,Criteria cri) {
	       log.info("main() ... ");
	       
	       
	        // 로그인한 유저의 정보 받아오기
	        IUserVO vo = iUserService.selectOne(principal.getName());
	        model.addAttribute("user",vo) ;
	        
	        // 유저의 클래스 갯수 받아오기 (수정해야함)
	        // 내가 한거
			/*
			 * int classcountvo = iClassService.classcount(vo.getUserId());
			 * model.addAttribute("iclass",classcountvo); log.info(classcountvo);
			 */
	        
			// 유저의 작성글 갯수 받아오기
	        int boardcountvo = boardService.boardcount(vo.getUserId());
	        model.addAttribute("boardcount",boardcountvo);
	        log.info(boardcountvo);
	        
	        
	        // 내가 작성한 인증글의 갯수 보기
	        int confirmcountvo = boardService.boardconfirmcount(vo.getUserId());
	        model.addAttribute("confirmcount",confirmcountvo);
	        log.info(confirmcountvo);
	        
	        // 내가 작성한 게시글의 갯수 보기
	        int myboardcountvo = boardService.myboardcount(vo.getUserId());
	        model.addAttribute("myboardcount",myboardcountvo);
	        log.info(myboardcountvo);
	        
	        // 내가 작성한 댓글의 갯수 보기(클래스,챌린지,게시판)
	        int commentcountvo = boardService.commentcount(vo.getUserId());
	        model.addAttribute("commentcount",commentcountvo);
	        log.info(commentcountvo);
			/*
			 * // 내가 작성한 인증글 list List<BoardVO> confirmlistVO =
			 * boardService.boardconfirmList(vo.getUserId());
			 * model.addAttribute("confirmlist",confirmlistVO) ; log.info(confirmlistVO);
			 * 
			 * // 내가 작성한 게시글 list List<BoardVO> boardlistVO =
			 * boardService.myboardList(vo.getUserId());
			 * model.addAttribute("myboardlist",boardlistVO); log.info(boardlistVO);
			 */
	
	        // 내가 작성한 댓글 list ( 페이징 )
	        List<BoardVO> commentlistVO = boardService.commentList(vo.getUserId(),cri);
	        log.info(commentlistVO);
	        
	        int total = boardService.total(vo.getUserId());
	        log.info(total);
	        model.addAttribute("commentlist",commentlistVO);
	        model.addAttribute("pageMaker", new PageVO(cri, total));
	        
	        log.info("list"+commentlistVO);
	        
	        // 유저의 토탈 포인트
	        int totalpointvo = pointService.totalpoint(vo.getUserId());
	        model.addAttribute("totalpoint",totalpointvo);
	        log.info("totalpoont" +totalpointvo);
	        
	        // 유저의 챌린지 갯수 받아오기 (수정해야함)
			  int challengecountvo = userchallengeService.challengecount(vo.getUserId());
			  log.info(challengecountvo);
			  model.addAttribute("userchallengecount",challengecountvo);
		        // 유저의 참여 클래스 갯수
		        int classcountvo = userchallengeService.classcount(vo.getUserId());
		        log.info(classcountvo);
		        model.addAttribute("userclasscount",classcountvo);
	        
	        // 페이징
			/*
			 * // 유저의 챌린지랑 클래스 댓글 List<BoardVO> myjoinlist =
			 * boardService.myjoinlist(vo.getUserId());
			 * model.addAttribute("myjoinlist",myjoinlist);
			 */
	        
	       
	      return "/mypage_user/mypage_user_boardlist";
	   }
	   
	   
	   // 마이페이지 포인트 리스트
	   @GetMapping("/mypage/pointlist")
	   public String pointmain(Principal principal,Model model,Criteria cri) {
	       log.info("main() ... ");
	       
	    // 로그인한 유저의 정보 받아오기
	        IUserVO vo = iUserService.selectOne(principal.getName());
	        model.addAttribute("user",vo) ;
	        
	        // 유저의 클래스 갯수 받아오기 (수정해야함)
	        // 내가 한거
			/*
			 * int classcountvo = iClassService.classcount(vo.getUserId());
			 * model.addAttribute("iclass",classcountvo); log.info(classcountvo);
			 */
	        

			// 유저의 작성글 갯수 받아오기
	        int boardcountvo = boardService.boardcount(vo.getUserId());
	        model.addAttribute("boardcount",boardcountvo);
	        log.info(boardcountvo);
	        

	        // 유저의 현재 포인트 
	        int savepointvo = pointService.savepoint(vo.getUserId());
	        model.addAttribute("savepoint",savepointvo);
	        log.info(savepointvo);
	        
	        // 유저의 적립예정 포인트
	        int appointedpointvo = pointService.appointedpoint(vo.getUserId());
	        model.addAttribute("appointedpoint",appointedpointvo);
	        log.info(appointedpointvo);
	        
	        // 유저의 사용 포인트 
	        int usepointvo = pointService.usepoint(vo.getUserId());
	        model.addAttribute("usepoint",usepointvo);
	        log.info(usepointvo);
	        
	        // 유저의 토탈 포인트
	        int totalpointvo = pointService.totalpoint(vo.getUserId());
	        model.addAttribute("totalpoint",totalpointvo);
	        log.info(totalpointvo);
	        
	        // 유저의 포인트 list
			/*
			 * List<PointVO> pointlistVO = pointService.pointList(vo.getUserId());
			 * model.addAttribute("pointlist",pointlistVO); log.info(pointlistVO);
			 */
	        
	        // 유저의 포인트 list ( 페이징 )
	        List<PointVO> pointlistVO =  pointService.pointList(vo.getUserId(),cri);
	        
	        int total = boardService.total(vo.getUserId());
	        log.info(total);
	        model.addAttribute("pointlist",pointlistVO);
	        model.addAttribute("pageMaker", new PageVO(cri, total));
	        
	        log.info("list"+pointlistVO);
	        
	        // 유저의 챌린지 갯수 받아오기 (수정해야함)
			  int challengecountvo = userchallengeService.challengecount(vo.getUserId());
			  log.info(challengecountvo);
			  model.addAttribute("userchallengecount",challengecountvo);
	        
		        // 유저의 참여 클래스 갯수
		        int classcountvo = userchallengeService.classcount(vo.getUserId());
		        log.info(classcountvo);
		        model.addAttribute("userclasscount",classcountvo);
	        
	        
	        
	       return "/mypage_user/mypage_user_pointlist";
	       
	   }
	   
	   
	   
	   @GetMapping("/mypage/challengelist")
	   public ModelAndView challengelist(Principal principal,ModelAndView mav, Model model) {
	       log.info("main() ... ");
			//
			  
			  // 로그인한 유저의 정보 받아오기
				
				  IUserVO vo = iUserService.selectOne(principal.getName());
				  model.addAttribute("user",vo) ;
				 
		        

				// 유저의 작성글 갯수 받아오기
		        int boardcountvo = boardService.boardcount(vo.getUserId());
		        model.addAttribute("boardcount",boardcountvo);
		        log.info(boardcountvo);
		        

		        // 유저의 토탈 포인트
		        int totalpointvo = pointService.totalpoint(vo.getUserId());
		        model.addAttribute("totalpoint",totalpointvo);
		        log.info(totalpointvo);
		        
		        // 유저의 챌린지 갯수 받아오기 
				  int challengecountvo = userchallengeService.challengecount(vo.getUserId());
				  log.info(challengecountvo);
				  model.addAttribute("userchallengecount",challengecountvo); 
				  
			        
			      //유저의 관심챌린지 갯수 
					
					  int userlikecountvo = userchallengeService.userlikecount(vo.getUserId());
					  log.info(userlikecountvo); model.addAttribute("userlikecount",userlikecountvo);
					 
			         
			        
			        // 유저의 지난챌린지 갯수
			       int endcountvo = userchallengeService.endcount(vo.getUserId());
			       log.info(endcountvo);
			       model.addAttribute("endcount",endcountvo);
			        
			        
			     // 유저의 신청 챌린지 리스트 
			       List<IClassVO> userchallengelistvo = userchallengeService.userchallengelist(vo.getUserId());
			       log.info(userchallengelistvo);
			       model.addAttribute("userchallengelist",userchallengelistvo);	
			       
			        // 유저의 참여 클래스 갯수
			        int classcountvo = userchallengeService.classcount(vo.getUserId());
			        log.info(classcountvo);
			        model.addAttribute("userclasscount",classcountvo);
			     // 유저의 관심챌린지 리스트
					/*
					 * List<IClassVO> userlikelistvo =
					 * userchallengeService.userlikelist(vo.getUserId()); log.info(userlikelistvo);
					 * model.addAttribute("userlikelist",userlikelistvo);
					 */
			      
			      // 유저의 지난챌린지 리스트
					/*
					 * List<IClassVO> userendlistvo =
					 * userchallengeService.userendlist(vo.getUserId()); log.info(userendlistvo);
					 * model.addAttribute("userendlist",userendlistvo);
					 */
	  			  
		      mav.setViewName("mypage_user/mypage_user_challengelist");
			 
		      return mav;
	   }
	   
		
	   // 유저의 챌린지 페이지 - 관심챌린지 페이징 처리(ajax)
		  @ResponseBody
		  @GetMapping("/ajax/challengelist") 
		  public ResponseEntity<HashMap<String,Object>> challengelist(@CurrentUser IUserVO vo, @RequestParam("pageNum")int pageNum){
			  log.info("challengelist");
			  
			  
		  HashMap<String, Object> result = new HashMap<>();
		  Criteria cri = new Criteria(pageNum,3);
		  
		  int userId = vo.getUserId();
		  log.info("유저아이디: "+userId);
		  
		  int total = userchallengeService.likecount(userId);
		  log.info("토탇" +total);
		  
		  List<IClassVO> userlikelistvo = userchallengeService.userlikelist(cri,userId);
		  result.put("list", userlikelistvo);
		  log.info("리스트"+userlikelistvo);
		  
		  result.put("pageMaker", new PageVO(cri,total));
		  
		  return ResponseEntity.ok(result);
		  
		  }
		  
		  // 유저의 지난 챌린지 ajax 페이징
		  @ResponseBody
		  @GetMapping("/ajax/endchallengelist") 
		  public ResponseEntity<HashMap<String,Object>> endchallengelist(@CurrentUser IUserVO vo, @RequestParam("pageNum")int pageNum){
			  log.info("endchallengelist");
			  
			  
		  HashMap<String, Object> result = new HashMap<>();
		  Criteria cri = new Criteria(pageNum,3);
		  
		  int userId = vo.getUserId();
		  log.info("유저아이디: "+userId);
		  
		  int total = userchallengeService.userendcount(userId);
		  log.info("토탇" +total);
		  
		  List<IClassVO> userendlistvo = userchallengeService.userendlist(cri,userId);
		  result.put("endlist", userendlistvo);
		  log.info("지난리스트"+userendlistvo);
		  
		  result.put("pageMaker", new PageVO(cri,total));
		  
		  return ResponseEntity.ok(result);
		  
		  }
		  
		  
		  
		  // 유저의 클래스 ajax
		  @GetMapping("/mypage/classlist")
		  public ModelAndView classlist(Principal principal, IUserVO iuservo, Model model, ModelAndView mav) {
			  

		        // 로그인한 유저의 정보 받아오기
		        IUserVO vo = iUserService.selectOne(principal.getName());
		        model.addAttribute("user",vo) ;


		        // 유저의 챌린지 갯수 받아오기 (수정해야함)
				  int challengecountvo = userchallengeService.challengecount(vo.getUserId());
				  log.info(challengecountvo);
				  model.addAttribute("userchallengecount",challengecountvo);
		        

				// 유저의 작성글 갯수 받아오기
		        int boardcountvo = boardService.boardcount(vo.getUserId());
		        model.addAttribute("boardcount",boardcountvo);
		        log.info(boardcountvo);
		        
		        // 유저의 토탈 포인트
		        int totalpointvo = pointService.totalpoint(vo.getUserId());
		        model.addAttribute("totalpoint",totalpointvo);
		        log.info(totalpointvo);
		        
		        // 유저의 참여 클래스 갯수
		        int classcountvo = userchallengeService.classcount(vo.getUserId());
		        log.info(classcountvo);
		        model.addAttribute("userclasscount",classcountvo);
		        
		        // 유저의 관심 클래스 갯수
		        int classlikecount = userchallengeService.classlikecount(vo.getUserId());
		        log.info(classlikecount);
		        model.addAttribute("classlikecount",classlikecount);
		        
		        // 유저의 지난 클래스 갯수
		        int classendcount = userchallengeService.classendcount(vo.getUserId());
		        log.info(classendcount);
		        model.addAttribute("classendcount",classendcount);
		        
		        // 신청 클래스 list
			    List<IClassVO> userclasslistvo = userchallengeService.userclasslist(vo.getUserId());
			    log.info(userclasslistvo);
			    model.addAttribute("userclasslist",userclasslistvo);	
			    
			    
			    // 관심 클래스 list
				/*
				 * List<IClassVO> userclasslikelist =
				 * userchallengeService.userclasslikelist(vo.getUserId());
				 * log.info(userclasslikelist);
				 * model.addAttribute("userclasslikelist",userclasslikelist);
				 */
			    
			    // 관심클래스 종류 list
			    List<IClassVO> userclasslikelist_kind = userchallengeService.userclasslikelist_kind(vo.getUserId());
			    log.info(userclasslikelist_kind);
			    model.addAttribute(userclasslikelist_kind);
		        
			    
			    // 관심클래스 요일 list
			    List<IClassVO> userclasslikelist_date = userchallengeService.userclasslikelist_date(vo.getUserId());
			    log.info("like운동요일!!!!!!!!!!"+userclasslikelist_date);
			    model.addAttribute("userclasslikelist_date",userclasslikelist_date);
			    
			 
			    // 지난클래스 요일 list
			    List<IClassVO> userclassendlist_date = userchallengeService.userclassendlist_date(vo.getUserId());
			    log.info("end운동요일!!!!!!!!!!"+userclassendlist_date);
			    model.addAttribute(userclassendlist_date);
			    
			    
			    // 트레이너 이름
			    List<IClassVO> userptClassList = iClassService.mainPagePtClassLIst();
			    model.addAttribute(userptClassList);
			    
			    mav.setViewName("mypage_user/mypage_user_classlist");
				 
			      return mav;
			  
		  }
		  
		  
		  
			
		   // 유저의 클래스 페이지 - 관심클래스 페이징 처리(ajax)
			  @ResponseBody
			  @GetMapping("/ajax/classlikelist") 
			  public ResponseEntity<HashMap<String,Object>> classlikelist(@CurrentUser IUserVO vo, @RequestParam("pageNum")int pageNum){
				  log.info("classlikelist");
				  
				  
			  HashMap<String, Object> result = new HashMap<>();
			  Criteria cri = new Criteria(pageNum,3);
			  
			  int userId = vo.getUserId();
			  log.info("유저아이디: "+userId);
		      

			  int total = userchallengeService.class_likecount(userId);
			  log.info("토탇" +total);
			  
	
			  
			  result.put("pageMaker", new PageVO(cri,total));
			  
			    // 관심클래스 종류 list
			    List<IClassVO> userclasslikelist_kind = userchallengeService.userclasslikelist_kind(vo.getUserId());
			   
			    
			    result.put("jebal", userclasslikelist_kind);
			    log.info(" 제발리스트좋아하는(종류)"+userclasslikelist_kind);
			  
				  // 운동 종류가 포함된 likelist
				  List<IClassVO> userclasslikelistvo = userchallengeService.userclasslikelist(cri,userId);
				  result.put("list", userclasslikelistvo);
				  log.info(" like리스트"+userclasslikelistvo);
				  
			  return ResponseEntity.ok(result);
			  
			  }
			  
			  
			  
			  
			   // 유저의 클래스 페이지 - 지난클래스 페이징 처리(ajax)
				  @ResponseBody
				  @GetMapping("/ajax/classendlist") 
				  public ResponseEntity<HashMap<String,Object>> classendlist(@CurrentUser IUserVO vo, @RequestParam("pageNum")int pageNum){
					  log.info("classendlist");
					  
					  
				  HashMap<String, Object> result = new HashMap<>();
				  Criteria cri = new Criteria(pageNum,3);
				  
				  int userId = vo.getUserId();
				  log.info("유저아이디: "+userId);
			      

				  int total = userchallengeService.class_endcount(userId);
				  log.info("지난클래스토탇" +total);
				  
				  List<IClassVO> userclassendlistvo = userchallengeService.userclassendlist(cri,userId);
				  result.put("endlist", userclassendlistvo);
				  log.info("엔드리스트"+userclassendlistvo);
				  
				  result.put("pageMaker", new PageVO(cri,total));
				  
				    // 관심클래스 종류 list
				    List<IClassVO> userclassendlist_kind = userchallengeService.userclassendlist_kind(vo.getUserId());
				 
				    result.put("jebal", userclassendlist_kind);
				    log.info(" 제발리스트지난(종류)"+userclassendlist_kind);
				  
				  return ResponseEntity.ok(result);
  
				  
				  
				  }
		  
				  
//		  챌린지 관심수 
		  @GetMapping("/userchallenge/heart")
		  @ResponseBody
		  public int heart(@RequestParam("classId") int classId, @CurrentUser IUserVO vo) {
			  return challengeService.getUserLikeListCheck(classId, vo.getUserId());
		  }
		  
		  @GetMapping("/userchallenge/heartList")
		  @ResponseBody
		  public int heartList(@RequestParam("classId") int classId, @CurrentUser IUserVO vo) {
			  return challengeService.getUserHeartList(classId, vo.getUserId());
		  }
		  
		  
		  
//		  클래스 관심수 
		  @GetMapping("/userclass/heart")
		  @ResponseBody
		  public int clheart(@RequestParam("classId") int classId, @CurrentUser IUserVO vo) {
			  return challengeService.getUserLikeListCheck(classId, vo.getUserId());
		  }
		  
		  @GetMapping("/userclass/heartList")
		  @ResponseBody
		  public int clheartList(@RequestParam("classId") int classId, @CurrentUser IUserVO vo) {
			  return challengeService.getUserHeartList(classId, vo.getUserId());
		  }
		  
		  
		  
			// 신청한 챌린지 취소
			@GetMapping("/mypage/challenge_delete")
		    public String challenge_delete(@CurrentUser IUserVO iUserVO ,@RequestParam ("hihi") int classId, IUserVO iuservo, Model model) {
		        log.info("test()..");
		        log.info("히히" + classId);
		        
		        // 로그인한 유저의 정보 받아오기
		        model.addAttribute("user", iUserVO) ;
		 		
		 	    userchallengeService.challenge_delete(iUserVO.getUserId(), classId);
		 	   

		        return "redirect:/mypage/challengelist";
		        
		    }
			
			
			// 신청한 클래스 취소
			@GetMapping("/mypage/class_delete")
		    public String class_delete(@CurrentUser IUserVO iUserVO ,@RequestParam ("hihi2") int classId, IUserVO iuservo, Model model) {
		        log.info("test()..");
		        log.info("히히" + classId);
		        
		        // 로그인한 유저의 정보 받아오기
		        model.addAttribute("user", iUserVO) ;
		 		
		 	    userchallengeService.class_delete_insert(iUserVO.getUserId(), classId);
		 	   userchallengeService.class_delete_update(iUserVO.getUserId(), classId);
		 	   

		        return "redirect:/mypage/classlist";
		        
		    }
		   
				// 신청한 클래스 취소
				@GetMapping("/iruritip/submit")
			    public String iruritip_submit(Principal principal,Model model) {


			        return "redirect:/iruritip/freeboard";
			        
			    }
		  
		  
		 
}
