package com.iruri.ex.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.iruri.ex.mapper.ChallengeMapper;
import com.iruri.ex.mapper.PtClassMapper;
import com.iruri.ex.page.Criteria;
import com.iruri.ex.page.PageVO;
import com.iruri.ex.security.CurrentUser;
import com.iruri.ex.vo.BoardVO;
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
    @Autowired
    ChallengeMapper challengeMapper;
    
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
    public int getTotalClass(Criteria cri, String type, int userId,
            String g1, String g2,
            String ek1, String ek2, String ek3, String ek4, String ek5,
            String p1, String p2, String p3, String p4,
            String ed1, String ed2, String ed3, String ed4,
            String day1, String day2, String day3, String day4, String day5, String day6, String day7,
            String el1, String el2, String el3, 
            String ep1, String ep2, String ep3, String ep4) {
        
        if(type.equals("all")) {
            return ptClassMapper.getTotalClassAll(
                    g1, g2,
                    ek1, ek2, ek3, ek4, ek5,
                    p1, p2, p3, p4,
                    ed1, ed2, ed3, ed4,
                    day1, day2, day3, day4, day5, day6, day7,
                    el1, el2, el3,
                    ep1, ep2, ep3, ep4); 
        }
        
        if(type.equals("buy")) {
            return ptClassMapper.getTotalClassBuy(userId, g1, g2,
                    ek1, ek2, ek3, ek4, ek5,
                    p1, p2, p3, p4,
                    ed1, ed2, ed3, ed4,
                    day1, day2, day3, day4, day5, day6, day7,
                    el1, el2, el3,
                    ep1, ep2, ep3, ep4);
        }
        
        if(type.equals("interest")) {
            return ptClassMapper.getTotalClassInterest(userId,
                    g1, g2,
                    ek1, ek2, ek3, ek4, ek5,
                    p1, p2, p3, p4,
                    ed1, ed2, ed3, ed4,
                    day1, day2, day3, day4, day5, day6, day7,
                    el1, el2, el3,
                    ep1, ep2, ep3, ep4);
        }
        
        if(type.equals("past")) {
            return ptClassMapper.getTotalClassPast(userId,
                    g1, g2,
                    ek1, ek2, ek3, ek4, ek5,
                    p1, p2, p3, p4,
                    ed1, ed2, ed3, ed4,
                    day1, day2, day3, day4, day5, day6, day7,
                    el1, el2, el3,
                    ep1, ep2, ep3, ep4);
        }
        
        return 0;
    }
    
    @Override
    public List<IClassVO> getClassList(Criteria cri, String type, int userId,
            String g1, String g2,
            String ek1, String ek2, String ek3, String ek4, String ek5,
            String p1, String p2, String p3, String p4,
            String ed1, String ed2, String ed3, String ed4,
            String day1, String day2, String day3, String day4, String day5, String day6, String day7,
            String el1, String el2, String el3, 
            String ep1, String ep2, String ep3, String ep4) {
        
        List<IClassVO> classList = new ArrayList<IClassVO>();
        
        if(type.equals("all")) {
            classList = ptClassMapper.getClassList(cri,
                    g1, g2,
                    ek1, ek2, ek3, ek4, ek5,
                    p1, p2, p3, p4,
                    ed1, ed2, ed3, ed4,
                    day1, day2, day3, day4, day5, day6, day7,
                    el1, el2, el3,
                    ep1, ep2, ep3, ep4);
        }
        
        if(type.equals("buy")) {
            classList = ptClassMapper.getBuyClassList(cri, userId,
                    g1, g2,
                    ek1, ek2, ek3, ek4, ek5,
                    p1, p2, p3, p4,
                    ed1, ed2, ed3, ed4,
                    day1, day2, day3, day4, day5, day6, day7,
                    el1, el2, el3,
                    ep1, ep2, ep3, ep4);
        }
        
        if(type.equals("interest")) {
            classList = ptClassMapper.getInterestClassList(cri, userId,
                    g1, g2,
                    ek1, ek2, ek3, ek4, ek5,
                    p1, p2, p3, p4,
                    ed1, ed2, ed3, ed4,
                    day1, day2, day3, day4, day5, day6, day7,
                    el1, el2, el3,
                    ep1, ep2, ep3, ep4);
        }
        
        if(type.equals("past")) {
            classList = ptClassMapper.getPastClassList(cri, userId,
                    g1, g2,
                    ek1, ek2, ek3, ek4, ek5,
                    p1, p2, p3, p4,
                    ed1, ed2, ed3, ed4,
                    day1, day2, day3, day4, day5, day6, day7,
                    el1, el2, el3,
                    ep1, ep2, ep3, ep4);
        }
        
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
    }
    
    @Override
    public HashMap<String, Object> joinCheck(int classId, int userId) {
        
        HashMap<String, Object> map = new HashMap<>();
        List<IClassVO> classList = ptClassMapper.ptSelectOne(classId); 
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
        int classPerson = ptClassMapper.ptSelectCount(classId);
        
        int checkNum = ptClassMapper.joinCheck(classId);
        if(checkNum == 1) { // 참여가능
            int joinCheckNum = ptClassMapper.joinCheckNum(classId, userId);
            if(joinCheckNum == 0) { // 유저의 참여 정보가 없으므로 참여가능
                map.put("joinCheck", 0);
            }
            if(joinCheckNum == 1) { // 유저의 참여 정보가 있으므로 참여 불가능
                map.put("joinCheck", 1);
            } 
        }
        if(checkNum == -1) { // 참여불가능         
            map.put("joinCheck", -1);
        }
        
        map.put("classVO", classList);
        map.put("classPerson", classPerson);
        
        return map;
    }
    
    @Override
    public int ptClassCertifyCount(int classId) {
        
        return ptClassMapper.ptClassCertifyCount(classId);
    }
    
    @Override
    public List<BoardVO> ptClassCertifyList(Criteria cri, int classId) {
        
        return ptClassMapper.ptClassCertifyList(cri, classId);
    }
    
    @Override
    public int ptClassReplyCount(int classId) {
        
        return ptClassMapper.ptClassReplyCount(classId);
    }
    
    @Override
    public List<BoardVO> ptClassReplyList(Criteria cri, int classId) {
        
        return ptClassMapper.ptClassReplyList(cri, classId);
    }

    @Override
    public void insertptClassCertify(BoardVO boardVO) {
        
        ptClassMapper.insertptClassCertify(boardVO);
    }
    
    @Override
    public BoardVO getCertifySelectOne(int boardId) {
        
        return ptClassMapper.getCertifySelectOne(boardId);
    }
    
    @Override
    public void insertReply(int boardGroupId, String boardContent, int userId) {
        
        ptClassMapper.insertReply(boardGroupId, boardContent, userId);
    }
}
