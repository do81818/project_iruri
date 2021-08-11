
package com.iruri.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.iruri.ex.page.Criteria;
import com.iruri.ex.vo.IUserVO;
import com.iruri.ex.vo.PointVO;
import com.iruri.ex.vo.ReportVO;
import com.iruri.ex.vo.TableJoinVO;

@Mapper
public interface AdminMapper {

	// 신고알림 전체 리스트
	List<ReportVO> getReportList();

	// 신고알림 페이징 리스트
	List<ReportVO> getReportListWithPaging(Criteria cri);

	// 신고알림 리스트 갯수
	Integer countReportId();

	// 일반/유료회원 전체 리스트
	List<TableJoinVO> getNormalUserList(Criteria cri);

	// 일반/유료회원 리스트 갯수
	Integer countNormalMember();

	// 일반/유료회원 블랙리스트
	List<TableJoinVO> getNormalUserBlackList(Criteria cri);

	// 일반/유료회원 블랙리스트 갯수
	Integer countNormalBlackMember();

	// 트레이너회원 리스트
	List<TableJoinVO> getTrainerMemberList(Criteria cri);
//	List<IUserVO> getTrainerMemberList3(Criteria cri);

	// 트레이너회원 리스트 갯수
	Integer countTrainerMemberList();

	// 트레이너 별 등급(평점)
	String getTrainerGrade(int userId);
	
	// 트레이너회원 블랙리스트
	List<TableJoinVO> getTrainerBlackList(Criteria cri);

	// 트레이너회원 블랙리스트 갯수
	Integer countTrainerBlackList();
	
	// 트레이너 등록
	void trainerRegistInsert(IUserVO vo);
	
	// 트레이너 권한수정
	void trainerAuthUpdate();
	
	// 일반/유료회원 정보 보기
	TableJoinVO getUserBasicInfo(int userId);
	
	// 일반/유료회원 포인트리스트 보기
	List<PointVO> getUserBasicInfoPoint(@Param("userId") int userId, @Param("pageNum") int pageNum, @Param("amount") int amount);
	
	// 일반/유료회원 포인트리스트 갯수
	Integer countUserBasicInfoPoint(@Param("userId")int userId);
	
	// 일반/유료회원 현재 보유포인트
	Integer getUserBasicInfoPointTotal(int userId);

	// 일반/유료회원정보 운동정보보기 _all
	List<PointVO> getUserExInfoAll(int userId, Criteria cri);
	
	// 일반/유료회원 운동정보 갯수
	Integer countUserExInfoAll();
	
	// 트레이너정보_수익관리 리스트
	List<TableJoinVO> getTrainerMoneyList(@Param("userId") int userId, @Param("month") int month, @Param("pageNum") int pageNum, @Param("amount") int amount);
	
	// 트레이너정보_수익관리 리스트 갯수
	Integer countTrainerMoneyList(int userId, int month);
	
	// 트레이너정보_수익관리 월별 수익 합계
	Integer trainerMoneyMonthTotal(@Param("userId") int userId, @Param("month") int month);
	
	// 블랙리스트/일반회원 등록(전환)
	void updateBlackList(@Param("userId") int userId, @Param("number") int number);
	
	// 블랙리스트 이유 등록
    void updateBlackListReason(@Param("userId") int userId, @Param("reason") String reason);
    
    // 탈퇴회원으로 전환
    void updateWithdrawMember(@Param("userId") int userId);
	
}
