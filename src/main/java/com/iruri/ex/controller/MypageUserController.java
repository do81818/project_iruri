package com.iruri.ex.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import com.iruri.ex.service.IUserInfoService;
import com.iruri.ex.service.IUserService;
import com.iruri.ex.service.BoardService;
import com.iruri.ex.service.IClassService;
import com.iruri.ex.service.IUserInfoService;
import com.iruri.ex.service.IUserService;
import com.iruri.ex.vo.BoardVO;
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
	@Autowired
	BoardService boardService;

		
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
        

		// 유저의 작성글 갯수 받아오기
        int boardcountvo = boardService.boardcount(vo.getUserId());
        model.addAttribute("boardcount",boardcountvo);
        log.info(boardcountvo);

		/*
		 * //몸무게 입력한 월 받아오기 int writedatevo =
		 * iUserinfoService.userheightdate(vo.getUserId());
		 * model.addAttribute("writedate",writedatevo);
		 */

        return "/mypage_user/mypage_user_main";
    }

	
	// 마이페이지의 보드리스트 페이지
    // 메인 페이지 이동
	   @RequestMapping("/mypage/boardlist")
	   public String main(Principal principal,Model model) {
	       log.info("main() ... ");
	       
	       
	        // 로그인한 유저의 정보 받아오기
	        IUserVO vo = iUserService.selectOne(principal.getName());
	        model.addAttribute("user",vo) ;
	        
	        // 유저의 클래스 갯수 받아오기 (수정해야함)
	        // 내가 한거
	        int classcountvo = iClassService.classcount(vo.getUserId());
	        model.addAttribute("iclass",classcountvo);
	        log.info(classcountvo);
	        
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
	        
	        // 내가 작성한 인증글 list
	        List<BoardVO> confirmlistVO = boardService.boardconfirmList(vo.getUserId());
	        model.addAttribute("confirmlist",confirmlistVO) ;
	        log.info(confirmlistVO);
	        
	        // 내가 작성한 게시글 list
	        List<BoardVO> boardlistVO = boardService.myboardList(vo.getUserId());
	        model.addAttribute("myboardlist",boardlistVO);
	        log.info(boardlistVO);
	        
	        // 내가 작성한 댓글 list
	        List<BoardVO> commentlistVO = boardService.commentList(vo.getUserId());
	        model.addAttribute("commentlist",commentlistVO);
	        log.info(commentlistVO);
	       
	      return "/mypage_user/mypage_user_boardlist";
	   }
}
