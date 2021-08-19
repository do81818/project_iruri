package com.iruri.ex.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iruri.ex.mapper.MypageTrainerMapper;
import com.iruri.ex.page.Criteria;
import com.iruri.ex.vo.BoardVO;
import com.iruri.ex.vo.BuyVO;
import com.iruri.ex.vo.IClassVO;
import com.iruri.ex.vo.ICommentVO;
import com.iruri.ex.vo.ProfitVO;
import com.iruri.ex.vo.TableJoinVO;
import com.iruri.ex.vo.trainerUserManagementVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MypageTrainerServiceImpl implements MypageTrainerService {
    
    @Autowired
    private MypageTrainerMapper mypageTrainerMapper;
    
    
    // 운영중인 클래스 갯수
    public int countMypageTrainerClass(int userId) {
        return mypageTrainerMapper.countMypageTrainerClass(userId);
    }
    
 // 수익---------------------------------------------------
    // 총수익
    public int trainerProfit(int userId) {
        try {
        return mypageTrainerMapper.trainerProfit(userId);
    } catch (Exception e) {
        return 0;
    }
    }
    
    // 이달의 수익
    /*
     * @Override public int monthProfit(int userId) { return
     * mypageTrainerMapper.monthProfit(userId); }
     */
    
    @Override
    public int getTotalCount_monthProfit(Criteria cri, int userId) {
        return mypageTrainerMapper.getTotalCount_monthProfit(cri, userId);
    }
    
    /*
     * @Override public List<ProfitVO> monthProfitList(Criteria cri, int userId) {
     * return mypageTrainerMapper.monthProfitList(cri, userId); }
     */
    @Override
    public List<ProfitVO> monthProfitList(int userId) {   
        return mypageTrainerMapper.monthProfitList(userId);
    }

    // 수익
    @Override
    public int getTotal_mypageTrainerProfit(Criteria cri, int userId) {
        log.info("MypageTrainerServiceImpl");
        return mypageTrainerMapper.getTotalCount_mypageTrainerProfit(cri, userId);
    }
    
    // 트레이너 수익리스트
    @Override
    public List<ProfitVO> profitList(Criteria cri, int userId) {
        return mypageTrainerMapper.profitList(cri, userId);
    }
    
// 회원관리 --------------------------------------------------------
    // 특정 트레이너가 개설한 클래스 리스트
    @Override
    public List<IClassVO> pagingTrainerClassList(Criteria cri, int userId) {
        return mypageTrainerMapper.pagingTrainerClassList(cri, userId);
    }

    // 특정 트레이너가 개설한 클래스 리스트 갯수
    @Override
    public Integer countPagingClassList(Criteria cri, int userId) {
        try {
            int total = mypageTrainerMapper.countPagingClassList(cri, userId);
            return total;
        } catch (Exception e) {
            return 0;
        }
    }

    // 클래스에 등록한 유저 리스트
    @Override
    public List<TableJoinVO> ClassBuyUserList() {
        return mypageTrainerMapper.ClassBuyUserList();
    }

    // 해당 클래스의 특정 유저에 대한 코멘트 리스트
    @Override
    public List<ICommentVO> ClassBuyUserCommentList(int userId, int classId) {
        return mypageTrainerMapper.ClassBuyUserCommentList(userId, classId);
    }

    @Override
    public void insertComment(int userId, int classId, String commentContent) {
        mypageTrainerMapper.insertComment(userId, classId, commentContent);
    }

    // 클래스 댓글조회
    @Override
    public Integer countReply(Criteria cri, int userId) {
        try {
            int total = mypageTrainerMapper.countReply(cri, userId);
            return total;
        } catch (Exception e) {
            return 0;
        }
    }

    @Override
    public List<BoardVO> classReplyList(Criteria cri, int userId) {
        
        return mypageTrainerMapper.classReplyList(cri, userId);
    }

  

   
    
}
