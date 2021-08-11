package com.iruri.ex.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iruri.ex.mapper.PtClassMapper;
import com.iruri.ex.page.Criteria;
import com.iruri.ex.vo.ExerciseDateVO;
import com.iruri.ex.vo.IClassVO;

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
    public int getTotalClass(Criteria cri) {
        return ptClassMapper.getTotalClass(cri);
    }
    
    @Override
    public List<IClassVO> getClassList(Criteria cri) {
        List<IClassVO> classList = ptClassMapper.getClassList(cri);
        
        List<ExerciseDateVO> dateList = new ArrayList<ExerciseDateVO>();
        
        for(int i = 0; i < classList.size(); i++) {
            String date = classList.get(i).getExerciseDateList().get(0).getExerciseDate();
            log.info(date);
            String[] dateArr = date.split(",");
        }
        
        return classList;
    };

}
