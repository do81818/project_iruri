
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
	List<TableJoinVO> getTrainerMemberList(Criteria cri);

	// 트레이너회원 리스트 갯수
	int countTrainerMemberList();

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
	List<PointVO> getUserBasicInfoPoint(@Param("userId") int userId, @Param("pageNum") int pageNum, @Param("amount") int amount);
	
	// 일반/유료회원 포인트리스트 갯수
	int countUserBasicInfoPoint(@Param("userId")int userId);
	
	// 일반/유료회원 현재 보유포인트
	int getUserBasicInfoPointTotal(int userId);

	// 일반/유료회원정보 운동정보보기 _all
	List<PointVO> getUserExInfoAll(int userId, Criteria cri);
	
	// 일반/유료회원 운동정보 갯수
	int countUserExInfoAll();
}
