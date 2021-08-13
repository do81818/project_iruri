package com.iruri.ex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iruri.ex.mapper.AdminMapper;
import com.iruri.ex.page.Criteria;
import com.iruri.ex.vo.IUserVO;
import com.iruri.ex.vo.PointVO;
import com.iruri.ex.vo.ReportVO;
import com.iruri.ex.vo.TableJoinVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper mapper;

    // 신고알림 리스트
    @Override
    public List<ReportVO> getReportList() {

        return mapper.getReportList();
    }

    // 신고알림 페이징 리스트
    @Override
    public List<ReportVO> getReportList(Criteria cri) {

        List<ReportVO> vo = mapper.getReportListWithPaging(cri);
        if (vo == null) {
            return null;
        } else {
            return vo;
        }
    }

    // 신고알림 리스트 갯수
    @Override
    public int countReportId() {
        try {
            int count = mapper.countReportId();
            return count;
        } catch (Exception e) {
            return 0;
        }
    }

    // 일반/유료회원 전체 리스트
    @Override
    public List<TableJoinVO> getNormalUserList(Criteria cri) {
        return mapper.getNormalUserList(cri);
    }

    // 일반/유료회원 리스트 갯수
    @Override
    public int countNormalMember() {
        try {
            int count = mapper.countNormalMember();
            return count;
        } catch (Exception e) {
            return 0;
        }
    }

    // 일반/유료회원 블랙리스트
    @Override
    public List<TableJoinVO> getNormalUserBlackList(Criteria cri) {
        return mapper.getNormalUserBlackList(cri);
    }

    // 일반/유료회원 블랙리스트 갯수
    @Override
    public int countNormalBlackMember() {
        try {
            int count = mapper.countNormalBlackMember();
            return count;
        } catch (Exception e) {
            return 0;
        }
    }

    // 트레이너회원 리스트
    @Override
    public List<TableJoinVO> getTrainerMemberList(String keyword, Criteria cri) {
        int pageNum = cri.getPageNum();
        int amount = cri.getAmount();
        log.info(mapper.getTrainerMemberList(keyword, pageNum, amount));
        log.info(keyword);
        return mapper.getTrainerMemberList(keyword, pageNum, amount);
    }
//    public List<IUserVO> getTrainerMemberList3(Criteria cri) {
//        log.info(mapper.getTrainerMemberList3(cri));
//        return mapper.getTrainerMemberList3(cri);
//    }
    
    // 트레이너회원 리스트 갯수
    @Override
    public int countTrainerMemberList(String keyword) {
        try {
            int count = mapper.countTrainerMemberList(keyword);
            return count;
        } catch (Exception e) {
            return 0;
        }
    }

    // 트레이너 별 등급(평점)
    @Override
 	public double getTrainerGrade(int userId) {
    	String str = mapper.getTrainerGrade(userId);
    	double grade = 0.0;
    	if(str != null) {
    		grade = Double.parseDouble(str); 
    	}
 		return grade;
 	}
    
    // 트레이너회원 블랙리스트
    @Override
    public List<TableJoinVO> getTrainerBlackList(Criteria cri) {
        return mapper.getTrainerBlackList(cri);
    }

    // 트레이너회원 블랙리스트 갯수
    @Override
    public int countTrainerBlackList() {
        try {
            int count = mapper.countTrainerBlackList();
            return count;
        } catch (Exception e) {
            return 0;
        }
    }

    // 트레이너 등록
    @Override
    public void trainerRegistInsert(IUserVO vo) {
        mapper.trainerRegistInsert(vo);
    }

    // 트레이너 권한수정
    @Override
    public void trainerAuthUpdate() {
        mapper.trainerAuthUpdate();
    }

    // 일반/유료회원 정보 보기
    @Override
    public TableJoinVO getUserBasicInfo(int userId) {
        return mapper.getUserBasicInfo(userId);
    }

    // 일반/유료회원 포인트리스트 보기
    @Override
    public List<PointVO> getUserBasicInfoPoint(int userId, Criteria cri) {
        int pageNum = cri.getPageNum();
        int amount = cri.getAmount();
        return mapper.getUserBasicInfoPoint(userId, pageNum, amount);
    }

    // 일반/유료회원 포인트리스트 갯수
    @Override
    public int countUserBasicInfoPoint(int userId) {
        try {
            int count = mapper.countUserBasicInfoPoint(userId);
            return count;
        } catch (Exception e) {
            return 0;
        }
    }

    // 일반/유료회원 현재 보유포인트
    @Override
    public int getUserBasicInfoPointTotal(int userId) {
        try {
//            String totalPoint = String.valueOf(mapper.getUserBasicInfoPointTotal(userId));
//            int point = Integer.parseInt(totalPoint);
//            log.info(point);
//            return point;
            int totalPoint = mapper.getUserBasicInfoPointTotal(userId);
            log.info(totalPoint);
            return totalPoint;
        } catch (Exception e) {
            log.info(e);
            return 0;
        }
    }


    // 일반/유료회원정보 운동정보 리스트보기 _all
    @Override
    public List<TableJoinVO> getUserExInfoList(int userId, int categoryId, Criteria cri) {
        int pageNum = cri.getPageNum();
        int amount = cri.getAmount();
        return mapper.getUserExInfoList(userId, categoryId, pageNum, amount);
    }

    // 일반/유료회원 운동정보 리스트 갯수
    @Override
    public Integer countUserExInfoList(int userId, int categoryId) {
        return mapper.countUserExInfoList(userId, categoryId);
    }
    
    
    // 트레이너정보_수익관리 리스트
    @Override
    public List<TableJoinVO> getTrainerMoneyList(int userId, int month, Criteria cri){
        int pageNum = cri.getPageNum();
        int amount = cri.getAmount();
        return mapper.getTrainerMoneyList(userId, month, pageNum, amount);
    }

    // 트레이너 정보_수익관리 리스트 갯수
    @Override
    public int countTrainerMoneyList(int userId, int month) {
        try {
            int count = mapper.countTrainerMoneyList(userId, month);
            return count;
        } catch (Exception e) {
            return 0;
        }
    }
    
    // 트레이너정보_수익관리 월별 수익 합계
    @Override
    public int trainerMoneyMonthTotal(int userId, int month) {
        try {
            int monthTotal = mapper.trainerMoneyMonthTotal(userId, month);
            return monthTotal;
        } catch (Exception e) {
            return 0;
        }
    }

    @Override
    public void updateBlackList(int userId, int number) {
        mapper.updateBlackList(userId, number);
    }

    @Override
    public void updateBlackListReason(int userId, String reason) {
        mapper.updateBlackListReason(userId, reason);
    }

    @Override
    public void updateWithdrawMember(int userId) {
        mapper.updateWithdrawMember(userId);
    }

    @Override
    public List<TableJoinVO> getTotalMoneyInOutList(String inquire, String periodStartDate, String periodEndDate, Criteria cri) {
        int pageNum = cri.getPageNum();
        int amount = cri.getAmount();
        return mapper.getTotalMoneyInOutList(inquire, periodStartDate, periodEndDate, pageNum, amount);
    }

    @Override
    public Integer countTotalMoneyInOutList(String inquire, String periodStartDate, String periodEndDate) {
        try {
            int count = mapper.countTotalMoneyInOutList(inquire, periodStartDate, periodEndDate);
            return count;
        } catch (Exception e) {
            return 0;
        }
    }
    
}