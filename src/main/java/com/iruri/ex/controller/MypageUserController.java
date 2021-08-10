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
            


        return "/mypage_user/mypage_user_main";
        
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
	        
	        
	        // 페이징
	        
	       
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
				  
			        
			     // 유저의 관심챌린지 갯수 
					/*
					 * int likecountvo = userchallengeService.likecount(vo.getUserId());
					 * log.info(likecountvo); model.addAttribute("likecount",likecountvo);
					 */
			         
			        
			        // 유저의 지난챌린지 갯수
			       int endcountvo = userchallengeService.endcount(vo.getUserId());
			       log.info(endcountvo);
			       model.addAttribute("endcount",endcountvo);
			        
			        
			     // 유저의 신청 챌린지 리스트 
			       List<IClassVO> userchallengelistvo = userchallengeService.userchallengelist(vo.getUserId());
			       log.info(userchallengelistvo);
			       model.addAttribute("userchallengelist",userchallengelistvo);	
			       
			       
			     // 유저의 관심챌린지 리스트
					/*
					 * List<IClassVO> userlikelistvo =
					 * userchallengeService.userlikelist(vo.getUserId()); log.info(userlikelistvo);
					 * model.addAttribute("userlikelist",userlikelistvo);
					 */
			      
			      // 유저의 지난챌린지 리스트
			      List<IClassVO> userendlistvo = userchallengeService.userendlist(vo.getUserId());
			      log.info(userendlistvo);
			      model.addAttribute("userendlist",userendlistvo);
	  			  
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
		 
}
