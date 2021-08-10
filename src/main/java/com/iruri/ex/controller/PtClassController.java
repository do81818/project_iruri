package com.iruri.ex.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.iruri.ex.page.Criteria;
import com.iruri.ex.security.CurrentUser;
import com.iruri.ex.service.IClassService;
import com.iruri.ex.service.PtClassService;
import com.iruri.ex.vo.ExerciseDateVO;
import com.iruri.ex.vo.ExerciseKindVO;
import com.iruri.ex.vo.IClassVO;
import com.iruri.ex.vo.IUserVO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Log4j
@RestController
public class PtClassController {
    
    @Autowired
    PtClassService ptClassService;
    @Autowired
    ImageController imageController;

    // 이루리 PT클래스 메인 페이지
    @GetMapping("/iruri/ptClassList")
    public ModelAndView pt_main(ModelAndView mav) {

        log.info(ptClassService.recommendList());
        mav.addObject("recommendList", ptClassService.recommendList());
        mav.setViewName("ptclass/ptclass_main");
        
        return mav;
    }
    
    // 이루리 PT클래스 메인 클래스 리스트
    @GetMapping("/ajax/class")
    public ResponseEntity<HashMap<String, Object>> iruriClass(@RequestParam("pageNum") int pageNum) {
        
        HashMap<String, Object> result = new HashMap<>();
        Criteria cri = new Criteria(pageNum, 9);
        
        int total = ptClassService.getTotalClass(cri);
        log.info(total);
        
        result.put("test", total); // 임시 에러방지 (이거 지우고 리스트부터 시작)
        
        return ResponseEntity.ok(result);
    }
    
    @GetMapping("/iruri/ptClassDetails")
    public ModelAndView pt_details(ModelAndView mav) {
        
        mav.setViewName("ptclass/ptclass_details");
        
        return mav;
    }
    
    @GetMapping("/iruri/ptClassMakeForm")
    public ModelAndView pt_make_form(ModelAndView mav) {

        mav.setViewName("/ptclass/ptClass_make_form");

        return mav;
    }
    
    @ResponseBody
    @PostMapping(value = "/iruri/insertPtClass", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public String insert_pt_class(@RequestParam("imageCheck") String imageCheck, MultipartFile uploadFile, 
            IClassVO iClassVO, 
            @RequestParam("exerciseKind") List<String> kind,
            @RequestParam("exerciseDate") List<String> date,
            @CurrentUser IUserVO iUserVO) {
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
        return "SUCCESS";
    }
    
    
}
