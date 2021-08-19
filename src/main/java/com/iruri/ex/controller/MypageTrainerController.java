package com.iruri.ex.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iruri.ex.page.Criteria;
import com.iruri.ex.page.PageVO;
import com.iruri.ex.page.mypageTainerPageVO;
import com.iruri.ex.security.CurrentUser;
import com.iruri.ex.service.IClassService;
import com.iruri.ex.service.IUserService;
import com.iruri.ex.service.MypageTrainerService;
import com.iruri.ex.vo.BoardVO;
import com.iruri.ex.vo.IClassVO;
import com.iruri.ex.vo.ICommentVO;
import com.iruri.ex.vo.IUserVO;
import com.iruri.ex.vo.ProfitVO;
import com.iruri.ex.vo.trainerUserManagementVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class MypageTrainerController {
    
    @Autowired
    IUserService iUserService;
    @Autowired
    IClassService iClassService;
    @Autowired
    MypageTrainerService mypageTrainerService;
    
    //---- 트레이너 마이페이지
    @RequestMapping("/mypage/trainer")
    public String mypageT(@CurrentUser IUserVO vo, Model model) {
        log.info("main() ... ");
      
        model.addAttribute("user", vo);
        int userId = vo.getUserId();
        //트레이너의 운영중인 클래스
        int countMypageTrainerClass =mypageTrainerService.countMypageTrainerClass(userId);
        model.addAttribute("countMypageTrainerClass", countMypageTrainerClass);
        
        // 트레이너 총수익
        int trainerProfit = mypageTrainerService.trainerProfit(userId);
        int trainerProfitMan = trainerProfit/10000;
        
        model.addAttribute("trainerProfitMan", trainerProfitMan);
      
        return "mypage_trainer/mypage_trainer_main";
    }

    // 트레이너 마이페이지 메인-페이징 처리(ajax)
    @ResponseBody
    @GetMapping("/ajax/mypage/trainerCurrent")
    public ResponseEntity<HashMap<String, Object>> mypageTrainerMainAjax(@CurrentUser IUserVO vo,
            @RequestParam("pageNum") int pageNum) {
        log.info("mypageTrainerMainAjax");

        Criteria cri = new Criteria(pageNum, 6);

        HashMap<String, Object> result = new HashMap<>();

        int userId = vo.getUserId();
        log.info("유저아이디: " + userId);

        int total = iClassService.getTotal_mypageTrainerClassList(cri, userId);
        log.info("토탈: " + total);

        List<IClassVO> list = iClassService.mypageTrainerClassList(cri, userId);
        // ajax 로 페이징 처리가 되어 다중값이 처리가 안됨
        result.put("list", list);
        
        log.info("리스트: " + list);

        result.put("pageMaker", new PageVO(cri, total));
        // 다중 값 처리를 위해 클래스 리스트를 받아옴
        List<IClassVO> classList = iClassService.classList(vo.getUserId());
        result.put("jebal", classList);
        return ResponseEntity.ok(result);
    }

    // 종료된 클랴스
    @ResponseBody
    @GetMapping("/ajax/mypage/trainerEnd")
    public ResponseEntity<HashMap<String, Object>> mypageTrainerMainAjaxEnd(@CurrentUser IUserVO vo,
            @RequestParam("pageNum") int pageNum) {
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
        
        List<IClassVO> classList = iClassService.classEndList(vo.getUserId());
        result.put("jebal", classList);

        
        return ResponseEntity.ok(result);
    }

    // 수익
    @RequestMapping("/mypage/trainer/profit")
    public String mypageProfit(Principal principal, Model model) {
        log.info("profit() ... ");

        // 유저정보 받기
        IUserVO vo = iUserService.selectOne(principal.getName());
        model.addAttribute("user", vo);
        int userId = vo.getUserId();
        
        //트레이너의 운영중인 클래스
        int countMypageTrainerClass = mypageTrainerService.countMypageTrainerClass(userId);
        model.addAttribute("countMypageTrainerClass", countMypageTrainerClass);
        
        // 트레이너 총수익
        int trainerProfit = mypageTrainerService.trainerProfit(userId);
        int trainerProfitMan = trainerProfit/10000;
        
        model.addAttribute("trainerProfitMan", trainerProfitMan);
        
        // 트레이너 월별 수익
        //List<ProfitVO> monthProfitList = mypageTrainerService.monthProfitList(userId);
       // model.addAttribute("monthProfitList", monthProfitList);
      //  log.info("monthProfitList");
       // log.info(monthProfitList);
        
        return "mypage_trainer/mypage_trainer_profit";
    }
    
    // 월수익 ajax
//    @ResponseBody
//    @GetMapping("/ajax/mypage/monthProfit")
//    public ResponseEntity<HashMap<String, Object>> mypageTrainerMonthProfit(@CurrentUser IUserVO vo, @RequestParam("pageNum") int pageNum) {
//        log.info("mypageTrainerMonthProfit");
//        // 1개의 리스트
//        Criteria cri = new Criteria(pageNum, 1);
//
//        HashMap<String, Object> result = new HashMap<>();
//
//        int userId = vo.getUserId();
//        log.info("유저아이디: " + userId);
//
//        int total = mypageTrainerService.getTotalCount_monthProfit(cri, userId);
//        log.info("토탈: " + total);
//
//        // 트레이너 월별 수익
//        List<ProfitVO> monthProfitList = mypageTrainerService.monthProfitList(cri, userId);
//        
//        result.put("monthProfitList", monthProfitList);
//        log.info("monthProfitList");
//        
//        result.put("pageMaker", new mypageTainerPageVO(cri, total));
//
//        return ResponseEntity.ok(result);
//    }
    
    
    
    @ResponseBody
    @GetMapping("/ajax/mypage/monthProfit")
    public ResponseEntity<HashMap<String, Object>> mypageTrainerMonth(@CurrentUser IUserVO vo) {
        log.info("mypageTrainerMonthProfit");
        HashMap<String, Object> result = new HashMap<>();
        
        int userId = vo.getUserId();
     // 트레이너 월별 수익
        List<ProfitVO> monthProfitList = mypageTrainerService.monthProfitList(userId);
        
        result.put("monthProfitList", monthProfitList);
        log.info("monthProfitList");
        
        return ResponseEntity.ok(result);
    }
    
    
    
    // 수익 ajax
    @ResponseBody
    @GetMapping("/ajax/mypage/trainerProfit")
    public ResponseEntity<HashMap<String, Object>> mypageTrainerProfit(@CurrentUser IUserVO vo, @RequestParam("pageNum") int pageNum) {
        log.info("mypageTrainerProfit");
        // 10개의 리스트
        Criteria cri = new Criteria(pageNum, 10);

        HashMap<String, Object> result = new HashMap<>();

        int userId = vo.getUserId();
        log.info("유저아이디: " + userId);

        int total = mypageTrainerService.getTotal_mypageTrainerProfit(cri, userId);
        log.info("토탈: " + total);

        // 트레이너 수익 리스트 테스트
        List<ProfitVO> profitList = mypageTrainerService.profitList(cri, userId);
        result.put("profitList", profitList);

        log.info("리스트: " + profitList);
        
        result.put("pageMaker", new PageVO(cri, total));

        return ResponseEntity.ok(result);
    }
    
    // 회원관리
    @RequestMapping("/mypage/trainer/userManagement")
    public String userManagement(@CurrentUser IUserVO vo, Model model) {
        log.info("userManagement() ... ");
        
        // 유저정보 받기
        model.addAttribute("user", vo);
        
        int userId = vo.getUserId();
        //트레이너의 운영중인 클래스
        int countMypageTrainerClass =mypageTrainerService.countMypageTrainerClass(userId);
        model.addAttribute("countMypageTrainerClass", countMypageTrainerClass);
        
        // 트레이너 총수익
        int trainerProfit = mypageTrainerService.trainerProfit(userId);
        int trainerProfitMan = trainerProfit/10000;
        model.addAttribute("trainerProfitMan", trainerProfitMan);
        
        return "mypage_trainer/mypage_trainer_user_management";
    }
    
    
    // 회원관리 ajax- 클래스 리스트와 등록한 유저 리스트 출력
    @ResponseBody
    @GetMapping("/ajax/mypage/userManagement")
    public ResponseEntity<HashMap<String, Object>> userManagementAjax(@CurrentUser IUserVO vo, @RequestParam("pageNum") int pageNum) {
        log.info("userManagementAjax() ... ");
        
        Criteria cri = new Criteria(pageNum, 3);
        HashMap<String, Object> result = new HashMap<>();
        
        int userId = vo.getUserId();
        int total = mypageTrainerService.countPagingClassList(cri, userId);
        
        // 트레이너 개설 클래스 리스트
        result.put("list", mypageTrainerService.pagingTrainerClassList(cri, userId));
        
        // 클래스에 등록한 유저 정보 리스트
        result.put("userInfo", mypageTrainerService.ClassBuyUserList());
        
        result.put("pageMaker", new PageVO(cri, total));
        
        return ResponseEntity.ok(result);
    }
    
    @ResponseBody
    @GetMapping("/insertComment")
    public ResponseEntity<HashMap<String, Object>> insertComment(@Param("userId") int userId, @Param("classId") int classId, @Param("commentContent") String commentContent) {
       log.info("insertComment()");   
       
       HashMap<String, Object> result = new HashMap<>();
       mypageTrainerService.insertComment(userId, classId, commentContent);
       result.put("commentList", mypageTrainerService.ClassBuyUserCommentList(userId,classId));
       
       return ResponseEntity.ok(result);
    }
    /*
     * @ResponseBody
     * 
     * @GetMapping("/ajax/mypage/userManagement") public
     * ResponseEntity<HashMap<String, Object>> userManagementAjax(@CurrentUser
     * IUserVO vo, @RequestParam("pageNum") int pageNum) {
     * log.info("userManagementAjax() ... ");
     * 
     * Criteria cri = new Criteria(pageNum, 3); HashMap<String, Object> result = new
     * HashMap<>();
     * 
     * int userId = vo.getUserId(); int total =
     * mypageTrainerService.getTotal_trainerUserManagement(cri, userId);
     * 
     * List<trainerUserManagementVO> trainerUserManagement =
     * mypageTrainerService.trainerUserManagement(cri, userId);
     * List<trainerUserManagementVO> list2 =
     * mypageTrainerService.trainerUserManagementList2(userId);
     * List<trainerUserManagementVO> commentList =
     * mypageTrainerService.commentList(userId);
     * 
     * result.put("trainerUserManagement", trainerUserManagement);
     * result.put("pageMaker", new PageVO(cri, total)); result.put("list2", list2);
     * result.put("commentList", commentList);
     * 
     * return ResponseEntity.ok(result); }
     */
    
    // 회원관리 ajax- 코멘트 리스트
    @ResponseBody
    @GetMapping("/ajax/mypage/userManagement/comment")
    public ResponseEntity<HashMap<String, Object>> userManagementCommentAjax(@CurrentUser IUserVO vo, @Param("userId") int userIdInput, @Param("classId") int classId) {
        log.info("userManagementAjax() ... ");
        
        HashMap<String, Object> result = new HashMap<>();
        
        int userId = vo.getUserId();
        
        // 트레이너 개설 클래스 리스트
        result.put("commentList", mypageTrainerService.ClassBuyUserCommentList(userIdInput,classId));
        
        return ResponseEntity.ok(result);
    }
    
    // 클래스 댓글조회
    @RequestMapping("/mypage/trainer/classReply")
    public String mypageclassReply(@CurrentUser IUserVO vo, Model model) {
        log.info("classReply() ... ");
        
        // 유저정보 받기
        model.addAttribute("user", vo);
        
        int userId = vo.getUserId();
        //트레이너의 운영중인 클래스
        int countMypageTrainerClass =mypageTrainerService.countMypageTrainerClass(userId);
        model.addAttribute("countMypageTrainerClass", countMypageTrainerClass);
        
        // 트레이너 총수익
        int trainerProfit = mypageTrainerService.trainerProfit(userId);
        int trainerProfitMan = trainerProfit/10000;
        model.addAttribute("trainerProfitMan", trainerProfitMan);
        
        return "mypage_trainer/mypage_trainer_class_comment";
    }
    
    // 클래스 댓글조회
    @ResponseBody
    @GetMapping("/ajax/mypage/classReply")
    public ResponseEntity<HashMap<String, Object>> mypageclassReplyAjax(@CurrentUser IUserVO vo, @RequestParam("pageNum") int pageNum) {
        log.info("mypageTrainerProfit");
        // 3개의 리스트
        Criteria cri = new Criteria(pageNum, 3);

        HashMap<String, Object> result = new HashMap<>();

        int userId = vo.getUserId();
        log.info("유저아이디: " + userId);

        int total = mypageTrainerService.countReply(cri, userId);
        log.info("토탈: " + total);

        // 클래스 댓글 리스트
        List<BoardVO> ReplyList = mypageTrainerService.classReplyList(cri, userId);
        result.put("ReplyList", ReplyList);

        log.info("리스트: " + ReplyList);
        
        result.put("pageMaker", new PageVO(cri, total));

        return ResponseEntity.ok(result);
    }
    

   
    
    
}
