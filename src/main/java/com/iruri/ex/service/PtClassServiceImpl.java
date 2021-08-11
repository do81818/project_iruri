package com.iruri.ex.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iruri.ex.mapper.PtClassMapper;
import com.iruri.ex.page.Criteria;
import com.iruri.ex.security.CurrentUser;
import com.iruri.ex.vo.ExerciseDateVO;
import com.iruri.ex.vo.ExerciseKindVO;
import com.iruri.ex.vo.IClassVO;
import com.iruri.ex.vo.IUserVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class PtClassServiceImpl implements PtClassService {

    @Autowired
    PtClassMapper ptClassMapper;
    
    @Override
    public void insertPtClass(IClassVO vo) {
        log.info("유저아이디: " + vo.getIUserVO().getUserId());
        log.info("타이틀: " + vo.getClassTitle());
        log.info("운동종류: " + vo.getExerciseKindList());
        
        log.info("준비물: " + vo.getClassNeed());
        log.info("운동강도: " + vo.getClassLevel());
        log.info("시작일: " + vo.getClassStartDate());
        log.info("종료일: " + vo.getClassEndDate());
        log.info("운동요일: " + vo.getExerciseDateList());
        
        log.info("운동시간: " + vo.getClassTime());
        log.info("운동인원: " + vo.getClassTotalMember());
        log.info("가격: " + vo.getClassPrice());
        log.info("목표: " + vo.getClassGoal());
        log.info("클래스 소개: " + vo.getClassContent());
        log.info("트레이너 소개: " + vo.getClassTrainerInfo());
        
        ptClassMapper.insertPtClass(vo);
    }

    @Override
    public List<IClassVO> recommendList() {
        return ptClassMapper.recommendList();
    }

    @Override
    public int getTotalClass(Criteria cri, String type, int userId) {
        
        if(type.equals("all")) {
            return ptClassMapper.getTotalClassAll(); 
        }
        
        if(type.equals("buy")) {
            return ptClassMapper.getTotalClassBuy(userId);
        }
        
        if(type.equals("interest")) {
            return 0;
        }
        
        if(type.equals("past")) {
            return 0;
        }
        
        return 0;
    }
    
    @Override
    public List<IClassVO> getClassList(Criteria cri) {
        List<IClassVO> classList = ptClassMapper.getClassList(cri);
        
        // ExerciseDateList & ExerciseKindList
        for(int i = 0; i < classList.size(); i++) {
            String date = classList.get(i).getExerciseDateList().get(0).getExerciseDate();
            String kind = classList.get(i).getExerciseKindList().get(0).getExerciseKind();
            List<ExerciseDateVO> dateList = new ArrayList<ExerciseDateVO>();
            List<ExerciseKindVO> kindList = new ArrayList<ExerciseKindVO>();
            
            String[] dateArr = date.split(",");
            for(int j = 0; j < dateArr.length; j++) {
                ExerciseDateVO dateVO = new ExerciseDateVO();
                
                dateVO.setExerciseDate(dateArr[j]);
                dateVO.setClassId(classList.get(i).getClassId());
                dateList.add(dateVO);
            }
            
            String[] kindArr = kind.split(",");
            for(int j = 0; j < kindArr.length; j++) {
                ExerciseKindVO kindVO = new ExerciseKindVO();
                
                kindVO.setExerciseKind(kindArr[j]);
                kindVO.setClassId(classList.get(i).getClassId());
                kindList.add(kindVO);
            }
            
            classList.get(i).setExerciseDateList(dateList);
            classList.get(i).setExerciseKindList(kindList);
        }

        return classList;
    };

}
