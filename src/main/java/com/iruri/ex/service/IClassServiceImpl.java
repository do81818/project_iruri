package com.iruri.ex.service;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iruri.ex.mapper.IClassMapper;
import com.iruri.ex.page.Criteria;
import com.iruri.ex.vo.ExerciseDateVO;
import com.iruri.ex.vo.ExerciseKindVO;
import com.iruri.ex.vo.IClassVO;
import com.iruri.ex.vo.IUserVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class IClassServiceImpl implements IClassService {
    
    @Autowired
    private IClassMapper iClassMapper;


    // 현재 운영중인 클래스 조회
    @Override
    public List<IClassVO> classList(int userId) {
        List<IClassVO> vo = iClassMapper.selectAllCurrent(userId);
        if(vo == null) {
            return null;
        }
        return vo;
    }
    
    
    // 현재 종료된 클래스 조회
    @Override
    public List<IClassVO> classEndList(int userId) {
        List<IClassVO> vo = iClassMapper.selectAllEnd(userId);
        if(vo == null) {
            return null;
        }
        return vo;
    }

    
    @Override
    public List<IClassVO> mainPageChallengeList() {
        
        return iClassMapper.mainPageChallengeList();
    }
    
    @Override
    public List<IClassVO> mainPagePtClassLIst() {
        
        return iClassMapper.mainPagePtClassLIst();
    }
    
    @Override
    public List<IClassVO> mainPageExerciseVideoList() {
        
        return iClassMapper.mainPageExerciseVideoList();
    }

    //챌린지 메인 리스트
    /*
    @Override
    public List<IClassVO> challengeList() {
        List<IClassVO> vo = iClassMapper.ChallengeSelectAll();
        if(vo == null) {
            return null;
        }
        return vo;
    }
    */
   
   
  
    
    //챌린지 개설 폼 값 입력
    @Override
    public void insertChallenge(IClassVO iClassVO) {
        log.info("insertChallenge");
        
        iClassMapper.insertChallenge(iClassVO);
        
    }


    // 클래스 페이징
    @Override
    public int getTotal(int userId, Criteria cri) {
        return iClassMapper.getTotalCount(userId,cri);
    }

    @Override
    public List<IClassVO> getList(int userId,Criteria cri) {
        return iClassMapper.getListWithPaging(userId,cri);
    }
    
    public List<IClassVO> challengeList(Criteria criteria) {
        log.info("getList()..");
      
        return iClassMapper.getListWithPaging_challenge(criteria);
    }

    @Override
    public int getTotal_challenge(Criteria cri) {
        log.info("getTotal_Challenge()..");
        return iClassMapper.getTotalCount_challenge(cri);

    }

   
    //지난 챌린지 
    @Override
    public List<IClassVO> challengeEndList(Criteria criteria) {
        log.info("get challengeEndList()..");
        return iClassMapper.getListWithPaging_challengeEndList(criteria);
    }

    @Override
    public int getTotal_challengeEndList(Criteria cri) {
        log.info("getTotal_challengeEndList()..");
        return iClassMapper.getTotalCount_challengeEndList(cri);
    }
    
    // 현재 진행중인 클래스(+페이징)
    @Override
    public List<IClassVO> mypageTrainerClassList(Criteria cri, int userId) {
       
        log.info("get mypageTrainerClassList()..");
        return iClassMapper.getListWithPaging_mypageTrainerClassList(cri, userId);
    }

    @Override
    public int getTotal_mypageTrainerClassList(Criteria cri, int userId) {
        log.info("getTotal_mypageTrainerClassList()..");
        return iClassMapper.getTotalCount_mypageTrainerClassList(cri, userId);
    }
    
  
    // 종료된 클래스(+페이징)
    @Override
    public List<IClassVO> mypageTrainerClassListEnd(Criteria cri, int userId) {
       
        log.info("get mypageTrainerClassListEnd()..");
        return iClassMapper.getListWithPaging_mypageTrainerClassListEnd(cri, userId);
    }

    @Override
    public int getTotal_mypageTrainerClassListEnd(Criteria cri, int userId) {
        log.info("getTotal_mypageTrainerClassListEnd()..");
        return iClassMapper.getTotalCount_mypageTrainerClassListEnd(cri, userId);
    }


  
   
    //운동종류
    @Override
    public List<ExerciseKindVO> selectExerciseKind(int userId) {
        List<ExerciseKindVO> kind = iClassMapper.selectExerciseKind(userId);
        if(kind == null) {
            return null;
        }
        return kind;
    }


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
        
        iClassMapper.insertPtClass(vo);
    }

 
}
