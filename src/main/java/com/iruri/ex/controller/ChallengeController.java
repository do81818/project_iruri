package com.iruri.ex.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.http.HttpRequest;
import java.nio.file.Files;
import java.security.Principal; 
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.iruri.ex.page.Criteria;
import com.iruri.ex.page.PageVO;
import com.iruri.ex.security.CurrentUser;
import com.iruri.ex.service.ChallengeService;
import com.iruri.ex.service.IClassService;
import com.iruri.ex.service.IUserService;
import com.iruri.ex.vo.BoardVO;
import com.iruri.ex.vo.BuyVO;
import com.iruri.ex.vo.ExerciseDateVO;
import com.iruri.ex.vo.ExerciseKindVO;
import com.iruri.ex.vo.IClassVO;
import com.iruri.ex.vo.IUserVO;
import com.iruri.ex.vo.LikeListVO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Log4j
@Controller
public class ChallengeController {

    @Autowired
    IUserService iUserService;
    @Autowired
    IClassService iClassService;
    @Autowired
    ChallengeService challengeService;
    @Autowired
    ImageController imageController;

   
    
    /*----------챌린지 메인-----------*/
    // 챌린지 메인
    @GetMapping("/iruri/challengeList")
    public ModelAndView c_main(ModelAndView mav) {
        
        mav.setViewName("challenge/challenge_main2");
        // mav.addObject(null, mav);
        
        return mav;
    }
    

    
    //챌린지 메인 페이징 처리(ajax)
    @ResponseBody
    @GetMapping("/ajax/challengeList")
    public ResponseEntity<HashMap<String, Object>> challengeList(@RequestParam("pageNum") int pageNum, 
            @RequestParam("keyword") String keyword) {
        
        HashMap<String, Object> result = new HashMap<>();
        Criteria cri = new Criteria(pageNum, 9);
   
        cri.setKeyword(keyword);
        
            
        //전체챌린지
        int total = challengeService.getTotal_challenge(cri);
        log.info("ajax_getTotal_challenge:" + total);
        
        result.put("pageMaker", new PageVO(cri, total));
        log.info("ajax_pageMaker" + cri);
        
        result.put("list", challengeService.challengeList(cri));
        log.info("ajax_challengeList()..");
        
      
        return ResponseEntity.ok(result);
    }
    
    

    // 챌린지 메인 - 지난 챌린지
    @GetMapping("/iruri/challengeEndList")
    public ModelAndView challengeEndList(ModelAndView mav) {
        
        mav.setViewName("challenge/challenge_endList");
        
        return mav;
    }
    

    //챌린지 메인 - 지난 챌린지 페이징 처리(ajax)
    @ResponseBody
    @GetMapping("/ajax/challengeEndList")
    public ResponseEntity<HashMap<String, Object>> challengeEndList(@RequestParam("pageNum") int pageNum, @RequestParam("keyword") String keyword) {
        log.info("challengeEndList() keyword: " + keyword);
        
        HashMap<String, Object> result = new HashMap<>();
        Criteria cri = new Criteria(pageNum, 9);
        
        cri.setKeyword(keyword);

        int total = challengeService.getTotal_challengeEndList(cri);
        log.info("ajax_getTotal_challenge:" + total);
        
        result.put("pageMaker", new PageVO(cri, total));
        log.info("ajax_pageMaker" + cri);
        
        result.put("list", challengeService.challengeEndList(cri));
        log.info("ajax_challengeList()..");
        

        return ResponseEntity.ok(result);
    }
    
    

    // 챌린지 메인 - 관심 챌린지
    @GetMapping("/iruri/challengeLikeList")
    public ModelAndView challengeLikeList(ModelAndView mav) {
       
        mav.setViewName("challenge/challenge_LikeList");
        
        return mav;
    }

   //챌린지 메인 - 관심 챌린지 페이징 처리(ajax)
    @ResponseBody
    @GetMapping("/ajax/challengeLikeList")
    public ResponseEntity<HashMap<String, Object>> testtest(@CurrentUser IUserVO vo, Criteria cri) {
      
        HashMap<String, Object> result = new HashMap<>();
        
        int userId = vo.getUserId();
        log.info("유저아이디: " + userId);
        log.info("cri: " + cri);
        
        int total = challengeService.getTotal_challengeLikeList(cri, userId);
        log.info("토탈: " + total);
        
        List<IClassVO> list = challengeService.challengeLikeList(cri, userId);
        result.put("list", list);
        log.info("리스트: " + list);
        
        result.put("pageMaker", new PageVO(cri, total));

        return ResponseEntity.ok(result);
    }
    
    
    
    
    /*-------------챌린지 개설 폼-------------*/
    // 챌린지 개설 작성 페이지 폼
    @GetMapping("/iruri/challenge_make_form")
    public ModelAndView c_make_form(ModelAndView mav) {

        log.info("c_make_form () ... ");
        mav.setViewName("/challenge/challenge_make_form");
        // mav.addObject(null, mav);

        return mav;
    }

    // 챌린지 개설 폼 작성 후 입력 (챌린지 등록)
    @PostMapping(value = "/iruri/insert_challenge", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public String c_make_form2(@RequestParam("imageCheck") String imageCheck, MultipartFile uploadFile, IClassVO iClassVO, @CurrentUser IUserVO vo) {
        log.info("challenge_make_form()...");

        log.info("upload File Name: " + uploadFile.getOriginalFilename());
        log.info("upload File Size: " +uploadFile.getSize());            
        
        if(imageCheck == "customImage") {
            String uploadFolder = "C:\\upload";
            String uploadFileName = uploadFile.getOriginalFilename();
            
            uploadFileName = uploadFileName
                    .substring(uploadFileName.lastIndexOf("\\") + 1); 
            
            UUID uuid = UUID.randomUUID();
            uploadFileName = uuid.toString() + "_" + uploadFileName;

            iClassVO.setClassImage(uploadFileName);

            try {
                File saveFile = new File(uploadFolder, uploadFile.getOriginalFilename());
                uploadFile.transferTo(saveFile);
                
                if(imageController.checkImageType(saveFile)) {
                    FileOutputStream thumbnail = new FileOutputStream(
                            new File(uploadFolder, "s_" + uploadFileName));
                    
                    Thumbnailator.createThumbnail(
                            uploadFile.getInputStream(), thumbnail, 537, 490);
                    
                    thumbnail.close();
                    
                }
            } catch (Exception e) {
                log.error(e.getMessage());
            }
        } else {
            iClassVO.setClassImage("default.png");
        }
        
        // default.png 기본 이미지
        // classTitle 챌린지명      
        // classLevel 운동강도
        // startdate, enddate 운동 기간 
        // classExerciseCount 주 몇회
        // classTotalMember 총 모집인원
        // classGoal 목표
        // classContent 상세정보
        // classImage 대표이미지
        
        iClassVO.setIUserVO(vo);
        challengeService.insertChallenge(iClassVO);
        log.info("iClassVO: " + iClassVO);

        return "redirect:challengeList";
    }

   
    /*-------------챌린지 상세 페이지-------------*/
    // 챌린지 상세 -참여 전
    @GetMapping("/iruri/challenge_detail_before")
    public ModelAndView c_detail_before(ModelAndView mav, IClassVO iClassVO) {
        mav.setViewName("challenge/challenge_detail_before");
        //챌린지 정보
        mav.addObject("challengeInfo", challengeService.getChallengeInfo(iClassVO.getClassId()));
        return mav;
    }
    
    //댓글부분
    @ResponseBody
    @GetMapping("/ajax/c_detail_before_reply")
    public ResponseEntity<HashMap<String, Object>> challenge_detail_before(@RequestParam("pageNum") int pageNum, 
            @RequestParam("classId") int classId){
        HashMap<String, Object> result = new HashMap<>();
        Criteria cri = new Criteria(pageNum, 6);
        log.info(classId);
       int total = challengeService.getTotal_challengeReply(cri,classId);
       result.put("pageMaker", new PageVO(cri,total));
       result.put("replyList", challengeService.challengeReplyList(cri,classId));
       
       return ResponseEntity.ok(result); 
    }
    
    
    //챌린지 참여 버튼 클릭(참여전 -> 참여후)
    @ResponseBody
    @PostMapping("/iruri/insert_user_challenge")
    public void insertUserChallenge(BuyVO buyVO, @CurrentUser IUserVO vo,
           @RequestParam("classId") int classId, 
            HttpServletResponse response) throws IOException {
        
        //참여인원 update
        challengeService.upJoinMember(classId);
        log.info("challenge up join member()..");
        
        //유저챌린지목록(buy table) insert
        buyVO.setIUserVO(vo);
        challengeService.userJoinChallenge(buyVO, vo.getUserId());
        log.info("insert user Join Challenge()..");

 
        response.sendRedirect("/ex/iruri/challenge_detail_after?classId=" + classId);
    }

    //유저가 챌린지 신청 기록이 있는지 
    @GetMapping("/iruri/challengeJoinCheck")
    @ResponseBody
    public void joinCheck(@RequestParam("classId") int classId, @CurrentUser IUserVO vo, HttpServletResponse response) throws IOException {
        
        int check = challengeService.getUserJoinChallengeListCheck(classId, vo.getUserId());
    
        if(check == 0) {
            response.sendRedirect("/ex/iruri/challenge_detail_before?classId=" + classId);            
        } else {
            response.sendRedirect("/ex/iruri/challenge_detail_after?classId=" + classId);
        }
    }
    

    //챌린지 상세-참여 후 
    @GetMapping("/iruri/challenge_detail_after")
    public ModelAndView c_detail_after(ModelAndView mav, IClassVO iClassVO, 
             @CurrentUser IUserVO vo) {
        mav.setViewName("challenge/challenge_detail_after");
        //챌린지 정보
        mav.addObject("challengeInfo", challengeService.getChallengeInfo(iClassVO.getClassId()));
        

        return mav;
    }
    
    
    //인증글 리스트
    @ResponseBody
    @GetMapping("/ajax/certifyImgList")
    public ResponseEntity<HashMap<String, Object>> certify_img_list(@RequestParam("pageNum") int pageNum,
            @RequestParam("classId") int classId){
        HashMap<String, Object> result = new HashMap<>();
        Criteria cri = new Criteria(pageNum, 8);
        log.info(classId);
        int total = challengeService.getTotal_challengeImg(cri, classId);
        result.put("pageMaker", new PageVO(cri, total));
        result.put("imgList", challengeService.challengeImgList(cri, classId));
        
        return ResponseEntity.ok(result);
    }
    
    // 인증모달 - 인증글 작성
    @ResponseBody
    @PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public void uploadAjaxPost(MultipartFile uploadFile, BoardVO boardVO, @CurrentUser IUserVO iUservo) {
        
        String uploadFolder = "C:\\upload";

            log.info("upload File Name: " + uploadFile.getOriginalFilename());
            log.info("upload File Size: " +uploadFile.getSize());            

            String uploadFileName = uploadFile.getOriginalFilename();

            // IE has file path
            uploadFileName = uploadFileName
                    .substring(uploadFileName.lastIndexOf("\\") + 1);
            log.info("only file name: " + uploadFileName);
            
            // 이름 중복방지 난수
            UUID uuid = UUID.randomUUID();
            uploadFileName = uuid.toString() + "_" + uploadFileName;

            boardVO.setBoardFile(uploadFileName);
            boardVO.setCategoryId(5);
            boardVO.setIUserVO(iUservo);
            
            try {
                File saveFile = new File(uploadFolder, uploadFileName);
                uploadFile.transferTo(saveFile);
                
                if(imageController.checkImageType(saveFile)) {
                    FileOutputStream thumbnail = new FileOutputStream(
                            new File(uploadFolder, "s_" + uploadFileName));
                    
                    Thumbnailator.createThumbnail(
                            uploadFile.getInputStream(), thumbnail, 270, 270);
                    
                    thumbnail.close();
                    
                    challengeService.insertChallengeCertify(boardVO);
                }
            } catch (Exception e) {
                e.printStackTrace();
            } 
    }
    

    
    //댓글 작성
    @ResponseBody
    @PostMapping("/iruri/c_detail_reply_insert")
    public String c_detail_reply_insert(BoardVO boardVO, @RequestParam("classId") int classId, @CurrentUser IUserVO vo) {
        log.info("challenge reply insert()..");
        
        boardVO.setIUserVO(vo);
        
        challengeService.challengeReplyInsert(boardVO, classId);
        
        log.info("challengeReplyInsert()..");
        
        return "success";
    }
 
    
    //댓글부분
    @ResponseBody
    @GetMapping("/ajax/c_detail_after_reply")
    public ResponseEntity<HashMap<String, Object>> challenge_after_before(@RequestParam("pageNum") int pageNum, 
            @RequestParam("classId") int classId){
        HashMap<String, Object> result = new HashMap<>();
        Criteria cri = new Criteria(pageNum, 6);
        log.info(classId);
       int total = challengeService.getTotal_challengeReply(cri,classId);
       result.put("pageMaker", new PageVO(cri,total));
       result.put("replyList", challengeService.challengeReplyList(cri,classId));
       
       return ResponseEntity.ok(result); 
    }
    
    
    
    
   
    /*-------------관심수-------------*/
    //유저가 좋아요 한 기록이 있는지
    @GetMapping("/iruri/heart")
    @ResponseBody
    public int heart(@RequestParam("classId") int classId, @CurrentUser IUserVO vo) {
        
        return challengeService.getUserLikeListCheck(classId, vo.getUserId());
    }
    
    //좋아요 하면 likelist에 추가하고 삭제하기 
    @GetMapping("/iruri/heartList")
    @ResponseBody
    public int heartList(@RequestParam("classId") int classId, @CurrentUser IUserVO vo) {
        
        return challengeService.getUserHeartList(classId, vo.getUserId());
    }
    
   

}
