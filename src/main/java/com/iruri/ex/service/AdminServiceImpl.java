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
        return mapper.countReportId();
    }

    // 일반/유료회원 전체 리스트
    @Override
    public List<TableJoinVO> getNormalUserList(Criteria cri) {
        return mapper.getNormalUserList(cri);
    }

    // 일반/유료회원 리스트 갯수
    @Override
    public int countNormalMember() {
        return mapper.countNormalMember();
    }

    // 일반/유료회원 블랙리스트
    @Override
    public List<TableJoinVO> getNormalUserBlackList(Criteria cri) {
        return mapper.getNormalUserBlackList(cri);
    }

    // 일반/유료회원 블랙리스트 갯수
    @Override
    public int countNormalBlackMember() {
        return mapper.countNormalBlackMember();
    }

    // 트레이너회원 리스트
    @Override
    public List<TableJoinVO> getTrainerMemberList(Criteria cri) {
        log.info(mapper.getTrainerMemberList(cri));
        return mapper.getTrainerMemberList(cri);
    }

    // 트레이너회원 리스트 갯수
    @Override
    public int countTrainerMemberList() {
        return mapper.countTrainerMemberList();
    }

    // 트레이너회원 블랙리스트
    @Override
    public List<TableJoinVO> getTrainerBlackList(Criteria cri) {
        return mapper.getTrainerBlackList(cri);
    }

    // 트레이너회원 블랙리스트 갯수
    @Override
    public int countTrainerBlackList() {
        return mapper.countTrainerBlackList();
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
        return mapper.countUserBasicInfoPoint(userId);
    }

    // 일반/유료회원 현재 보유포인트
    @Override
    public Integer getUserBasicInfoPointTotal(int userId) {
    	Integer totalPoint = mapper.getUserBasicInfoPointTotal(userId);
    	if(!(totalPoint > 0)) {
    		return mapper.getUserBasicInfoPointTotal(userId);
    	}
    	return 0;
    }

    // 일반/유료회원정보 운동정보 리스트보기 _all
    @Override
    public List<PointVO> getUserExInfoAll(int userId, Criteria cri) {
        return mapper.getUserExInfoAll(userId, cri);
    }

}
