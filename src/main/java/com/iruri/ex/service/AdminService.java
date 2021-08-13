package com.iruri.ex.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.iruri.ex.page.Criteria;
import com.iruri.ex.vo.IUserVO;
import com.iruri.ex.vo.PointVO;
import com.iruri.ex.vo.ReportVO;
import com.iruri.ex.vo.TableJoinVO;

public interface AdminService {

	// 신고알림 리스트
	List<ReportVO> getReportList();

	// 신고알림 페이징 리스트
	List<ReportVO> getReportList(Criteria cri);

	// 신고알림 리스트 갯수
	int countReportId();

	// 일반/유료회원 전체 리스트
	List<TableJoinVO> getNormalUserList(Criteria cri);

	// 일반/유료회원 리스트 갯수
	int countNormalMember();

	// 일반/유료회원 블랙리스트
	List<TableJoinVO> getNormalUserBlackList(Criteria cri);

	// 일반/유료회원 블랙리스트 갯수
	int countNormalBlackMember();

	// 트레이너회원 리스트
	List<TableJoinVO> getTrainerMemberList(String keyword,Criteria cri);
//	List<IUserVO> getTrainerMemberList3(Criteria cri);
	
	// 트레이너 별 등급(평점)
	double getTrainerGrade(int userId);

	// 트레이너회원 리스트 갯수
	int countTrainerMemberList(String keyword);

	// 트레이너회원 블랙리스트
	List<TableJoinVO> getTrainerBlackList(Criteria cri);

	// 트레이너회원 블랙리스트 갯수
	int countTrainerBlackList();

	// 트레이너 등록
	void trainerRegistInsert(IUserVO vo);

	// 트레이너 권한수정
	void trainerAuthUpdate();

	// 일반/유료회원 정보 보기
	TableJoinVO getUserBasicInfo(int userId);

	// 일반/유료회원 포인트리스트 보기
	List<PointVO> getUserBasicInfoPoint(int userId, Criteria cri);

	// 일반/유료회원 포인트리스트 갯수
	int countUserBasicInfoPoint(int userId);

	// 일반/유료회원 현재 보유포인트
	int getUserBasicInfoPointTotal(int userId);

	// 일반/유료회원정보 운동정보리스트 보기
    List<TableJoinVO> getUserExInfoList(int userId, int categoryId, Criteria cri);
    
    // 일반/유료회원 운동정보 리스트 갯수
    Integer countUserExInfoList(int userId, int categoryId);
	
	// 트레이너정보_수익관리 리스트
	List<TableJoinVO> getTrainerMoneyList(int userId, int month, Criteria cri1);
    
    // 트레이너 정보_수익관리 리스트 갯수
    int countTrainerMoneyList(int userId, int month);
    
    // 트레이너정보_수익관리 월별 수익 합계
    int trainerMoneyMonthTotal(int userId, int month);
    
    // 블랙리스트/일반회원 등록(전환)
    void updateBlackList(int userId, int number);
    
    // 블랙리스트 이유 등록
    void updateBlackListReason(int userId, String reason);
	
    // 탈퇴회원으로 전환
    void updateWithdrawMember(int userId);
    
    // 수익관리 - 전체수익 매출 리스트
    List<TableJoinVO> getTotalMoneyInOutList(String inquire, String periodStartDate, String periodEndDate, Criteria cri);
    
    // 수익관리 - 전체수익 매출리스트 갯수
    Integer countTotalMoneyInOutList(String inquire, String periodStartDate, String periodEndDate);
    
}
