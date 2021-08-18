package com.iruri.ex.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.iruri.ex.page.Criteria;
import com.iruri.ex.page.PageVO;
import com.iruri.ex.security.CurrentUser;
import com.iruri.ex.security.PayService;
import com.iruri.ex.service.ChallengeService;
import com.iruri.ex.service.PtClassService;
import com.iruri.ex.vo.BoardVO;
import com.iruri.ex.vo.ExerciseDateVO;
import com.iruri.ex.vo.ExerciseKindVO;
import com.iruri.ex.vo.IClassVO;
import com.iruri.ex.vo.IUserVO;
import com.iruri.ex.vo.PortProfile;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Log4j
@RestController
public class PtClassController {
    
    @Autowired
    PtClassService ptClassService;
    @Autowired
    ChallengeService challengeService;
    @Autowired
    ImageController imageController;
    @Autowired
    PayService payService;

    // 이루리 PT클래스 메인 페이지
    @GetMapping("/iruri/ptClassList")
    public ModelAndView pt_main(ModelAndView mav) {

        log.info(ptClassService.recommendList());
        mav.addObject("recommendList", ptClassService.recommendList());
        mav.setViewName("ptclass/ptclass_main");
        
        return mav;
    }
    
    // 이루리 PT클래스 메인 클래스 리스트
    @PostMapping("/ajax/class")
    public ResponseEntity<HashMap<String, Object>> iruriClass(
            @RequestParam("type") String type, 
            @RequestParam("pageNum") int pageNum,
            @CurrentUser IUserVO iUserVO, 
            @RequestParam("g1") String g1, 
            @RequestParam("g2") String g2,
            @RequestParam("ek1") String ek1, 
            @RequestParam("ek2") String ek2, 
            @RequestParam("ek3") String ek3,
            @RequestParam("ek4") String ek4, 
            @RequestParam("ek5") String ek5, 
            @RequestParam("p1") String p1,
            @RequestParam("p2") String p2, 
            @RequestParam("p3") String p3, 
            @RequestParam("p4") String p4,
            @RequestParam("ed1") String ed1, 
            @RequestParam("ed2") String ed2, 
            @RequestParam("ed3") String ed3,
            @RequestParam("ed4") String ed4, 
            @RequestParam("day1") String day1, 
            @RequestParam("day2") String day2,
            @RequestParam("day3") String day3, 
            @RequestParam("day4") String day4, 
            @RequestParam("day5") String day5,
            @RequestParam("day6") String day6,
            @RequestParam("day7") String day7,
            @RequestParam("el1") String el1,
            @RequestParam("el2") String el2,
            @RequestParam("el3") String el3,
            @RequestParam("ep1") String ep1,
            @RequestParam("ep2") String ep2,
            @RequestParam("ep3") String ep3,
            @RequestParam("ep4") String ep4) {

        g1 = g1.equals("") ? null : g1;
        g2 = g2.equals("") ? null : g2;
        ek1 = ek1.equals("") ? null : ek1;
        ek2 = ek2.equals("") ? null : ek2;
        ek3 = ek3.equals("") ? null : ek3;
        ek4 = ek4.equals("") ? null : ek4;
        ek5 = ek5.equals("") ? null : ek5;
        p1 = p1.equals("") ? null : p1;
        p2 = p2.equals("") ? null : p2;
        p3 = p3.equals("") ? null : p3;
        p4 = p4.equals("") ? null : p4;
        ed1 = ed1.equals("") ? null : ed1;
        ed2 = ed2.equals("") ? null : ed2;
        ed3 = ed3.equals("") ? null : ed3;
        ed4 = ed4.equals("") ? null : ed4;
        day1 = day1.equals("") ? null : day1;
        day2 = day2.equals("") ? null : day2;
        day3 = day3.equals("") ? null : day3;
        day4 = day4.equals("") ? null : day4;
        day5 = day5.equals("") ? null : day5;
        day6 = day6.equals("") ? null : day6;
        day7 = day7.equals("") ? null : day7;
        el1 = el1.equals("") ? null : el1;
        el2 = el2.equals("") ? null : el2;
        el3 = el3.equals("") ? null : el3;
        ep1 = ep1.equals("") ? null : ep1;
        ep2 = ep2.equals("") ? null : ep2;
        ep3 = ep3.equals("") ? null : ep3;
        ep4 = ep4.equals("") ? null : ep4;

        HashMap<String, Object> result = new HashMap<>();
        Criteria cri = new Criteria(pageNum, 9);
        
        
        int userId = 0;
        if(iUserVO != null) {
            userId = iUserVO.getUserId();
        }
        int total = ptClassService.getTotalClass(cri, 
                type, userId,
                g1, g2,
                ek1, ek2, ek3, ek4, ek5,
                p1, p2, p3, p4,
                ed1, ed2, ed3, ed4,
                day1, day2, day3, day4, day5, day6, day7,
                el1, el2, el3, 
                ep1, ep2, ep3, ep4);
        List<IClassVO> list = ptClassService.getClassList(cri, type, userId,
                g1, g2,
                ek1, ek2, ek3, ek4, ek5,
                p1, p2, p3, p4,
                ed1, ed2, ed3, ed4,
                day1, day2, day3, day4, day5, day6, day7,
                el1, el2, el3, 
                ep1, ep2, ep3, ep4);
        
        result.put("list", list);
        result.put("pageMaker", new PageVO(cri, total));
        
        log.info(total);

        return ResponseEntity.ok(result);
    }
    
    // 하트
    @GetMapping("/ajax/ptClassLike")
    public int iruriPtClassLike(@CurrentUser IUserVO vo, @RequestParam("classId") int classId, @RequestParam("checkNum") int checkNum) {
        
        if(checkNum == 1) {
            challengeService.challenge_likeDelete(classId, vo.getUserId());
            challengeService.challenge_likeCountDown(classId);
            return 0;
        }
        
        if(checkNum == 0) {
            challengeService.challenge_likeInsert(classId, vo.getUserId());
            challengeService.challenge_likeCountUp(classId);
            return 1;
        }
        
        return challengeService.getUserHeartList(classId, vo.getUserId());
    }
    
    
    @GetMapping("/iruri/ptClassDetails")
    public ModelAndView pt_details(ModelAndView mav, @RequestParam("classId") int classId) {
        mav.setViewName("ptclass/ptclass_details");
        
        return mav;
    }
    
    // ptDetails 클래스 정보
    @GetMapping("/iruri/ptClassJoinCheck")
    public ResponseEntity<HashMap<String, Object>> joinCheck(@RequestParam("classId") int classId, @CurrentUser IUserVO vo) {
        
        if(vo == null) {
            vo = new IUserVO();
            vo.setUserId(0);
        }
        
        HashMap<String, Object> result = ptClassService.joinCheck(classId, vo.getUserId());
        
        return ResponseEntity.ok(result);
    }
    
    // ptDetails 인증글 정보
    @GetMapping("iruri/ptClassCertifyList")
    public ResponseEntity<HashMap<String, Object>> ptClassCertifyList(@RequestParam("pageNum") int pageNum, @RequestParam("classId") int classId)  {
        
        
        int total = ptClassService.ptClassCertifyCount(classId);

        Criteria cri = new Criteria(pageNum, 8);
        
        List<BoardVO> list = ptClassService.ptClassCertifyList(cri, classId);
        
        HashMap<String, Object> result = new HashMap<>();
        result.put("list", list);
        result.put("pageMaker", new PageVO(cri, total));
        
        return ResponseEntity.ok(result);
    }
    
    // ptDetails 댓글
    @GetMapping("iruri/ptClassReplyList")
    public ResponseEntity<HashMap<String, Object>> ptClassReplyList(@RequestParam("pageNum") int pageNum, @RequestParam("classId") int classId) {
        
        int total = ptClassService.ptClassReplyCount(classId);
        
        Criteria cri = new Criteria(pageNum, 6);
        
        List<BoardVO> list = ptClassService.ptClassReplyList(cri, classId);
        
        HashMap<String, Object> result = new HashMap<>();
        result.put("list", list);
        result.put("pageMaker", new PageVO(cri, total));
        
        return ResponseEntity.ok(result);
    }
    
    // pt 구매
    @PostMapping("iruri/ptClassBuy")
    public void ptClassBuy(@RequestParam("imp_uid") String imp_uid, @RequestParam("merchant_uid") String merchant_uid) {
        log.info(imp_uid);
        log.info(merchant_uid);
        
        PortProfile token = payService.getAuthToken();
        // ResponseEntity<String> data = payService.getPaymentData(token, imp_uid);
        
        // log.info(data);
        
    }
    
//    인증글 작성
//    @PostMapping(value = "/ptClassUpload", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
//    public void ptClassUpload(MultipartFile uploadFile, BoardVO boardVO, @CurrentUser IUserVO iUservo) {
//        
//            String uploadFolder = "C:\\upload";
//
//            log.info("upload File Name: " + uploadFile.getOriginalFilename());
//            log.info("upload File Size: " +uploadFile.getSize());            
//
//            String uploadFileName = uploadFile.getOriginalFilename();
//
//            // IE has file path
//            uploadFileName = uploadFileName
//                    .substring(uploadFileName.lastIndexOf("\\") + 1);
//            log.info("only file name: " + uploadFileName);
//            
//            // 이름 중복방지 난수
//            UUID uuid = UUID.randomUUID();
//            uploadFileName = uuid.toString() + "_" + uploadFileName;
//
//            boardVO.setBoardFile(uploadFileName);
//            boardVO.setCategoryId(5);
//            boardVO.setIUserVO(iUservo);
//            
//            try {
//                File saveFile = new File(uploadFolder, uploadFileName);
//                uploadFile.transferTo(saveFile);
//                
//                if(imageController.checkImageType(saveFile)) {
//                    FileOutputStream thumbnail = new FileOutputStream(
//                            new File(uploadFolder, "s_" + uploadFileName));
//                    
//                    Thumbnailator.createThumbnail(
//                            uploadFile.getInputStream(), thumbnail, 270, 270);
//                    
//                    thumbnail.close();
//                    
//                    // challengeService.insertChallengeCertify(boardVO);
//                    ptClassService.insertChallengeCertify(boardVO);
//                }
//            } catch (Exception e) {
//                e.printStackTrace();
//            } 
//    }
    
    @GetMapping("/iruri/ptClassMakeForm")
    public ModelAndView pt_make_form(ModelAndView mav) {

        mav.setViewName("/ptclass/ptClass_make_form");

        return mav;
    }
    
    @PostMapping(value = "/iruri/insertPtClass", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public void insert_pt_class(@RequestParam("imageCheck") String imageCheck, MultipartFile uploadFile, IClassVO iClassVO, 
            @RequestParam("exerciseKind") List<String> kind, @RequestParam("exerciseDate") List<String> date,
            @CurrentUser IUserVO iUserVO, HttpServletResponse response) throws IOException {
        log.info("insert_pt_Class () ... ");
            
        log.info(imageCheck);
        
        if(imageCheck.equals("customImage")) {
            String uploadFolder = "C:\\upload";
            String uploadFileName = uploadFile.getOriginalFilename();
            
            uploadFileName = uploadFileName
                    .substring(uploadFileName.lastIndexOf("\\") + 1);
            
            UUID uuid = UUID.randomUUID();
            uploadFileName = uuid.toString() + "_" + uploadFileName;

            iClassVO.setClassImage(uploadFileName);
        
            try {
                File saveFile = new File(uploadFolder, uploadFileName);
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
        
        List<ExerciseKindVO> kindList = new ArrayList<>();
        for(String item : kind) {
            ExerciseKindVO exerciseKindVO = new ExerciseKindVO();
            exerciseKindVO.setExerciseKind(item);
            kindList.add(exerciseKindVO);
        }
        iClassVO.setExerciseKindList(kindList);

        List<ExerciseDateVO> dateList = new ArrayList<>();
        for(String item : date) {
            ExerciseDateVO exerciseDateVO = new ExerciseDateVO();
            exerciseDateVO.setExerciseDate(item);
            dateList.add(exerciseDateVO);
        }
        iClassVO.setExerciseDateList(dateList);
        
        iClassVO.setIUserVO(iUserVO);
        
        ptClassService.insertPtClass(iClassVO);
        

        // 현재 사용자가 생성한 PT 클래스 중 가장 높은 번호의 챌린지 아이디를 찾아서
        // 해당 클래스 상세 보기로 이동하기
        response.sendRedirect("/ex/iruri/ptClassList");
       

    }
    
    
    
    
}
