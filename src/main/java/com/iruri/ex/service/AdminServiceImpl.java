package com.iruri.ex.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iruri.ex.mapper.AdminMapper;
import com.iruri.ex.page.Criteria;
import com.iruri.ex.vo.AuthVO;
import com.iruri.ex.vo.IUserVO;
import com.iruri.ex.vo.PointVO;
import com.iruri.ex.vo.ReportVO;
import com.iruri.ex.vo.TableJoinVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper mapper;

	@Override
	public List<ReportVO> getReportList() {

		return mapper.getReportList();
	}

	@Override
	public List<ReportVO> getReportList(Criteria cri) {
		
		List<ReportVO> vo = mapper.getReportListWithPaging(cri);
		if(vo == null) {
			return null;
		} else {
			return vo;
		}
	}

	@Override
	public int countReportId() {
		return mapper.countReportId();
	}

	@Override
	public List<TableJoinVO> getNormalUserList(Criteria cri) {
		return mapper.getNormalUserList(cri);
	}

	@Override
	public int countNormalMember() {
		return mapper.countNormalMember();
	}

	@Override
	public List<TableJoinVO> getNormalUserBlackList(Criteria cri) {
		return mapper.getNormalUserBlackList(cri);
	}

	@Override
	public int countNormalBlackMember() {
		return mapper.countNormalBlackMember();
	}

	@Override
	public List<TableJoinVO> getTrainerMemberList(Criteria cri) {
		return mapper.getTrainerMemberList(cri);
	}

	@Override
	public int countTrainerMemberList() {
		return mapper.countTrainerMemberList();
	}

	@Override
	public List<TableJoinVO> getTrainerBlackList(Criteria cri) {
		return mapper.getTrainerBlackList(cri);
	}

	@Override
	public int countTrainerBlackList() {
		return mapper.countTrainerBlackList();
	}

	@Override
	public int trainerRegistInsert(IUserVO vo) {
		return mapper.trainerRegistInsert(vo);
	}

	@Override
	public AuthVO trainerAuthUpdate() {
		return mapper.trainerAuthUpdate();
	}

	@Override
	public TableJoinVO getUserBasicInfo(int userId) {
		return mapper.getUserBasicInfo(userId);
	}

	@Override
	public List<PointVO> getUserBasicInfoPoint(int userId, Criteria cri) {
		return mapper.getUserBasicInfoPoint(userId, cri);
	}

	@Override
	public int countUserBasicInfoPoint() {
		return mapper.countUserBasicInfoPoint();
	}

	@Override
	public int getUserBasicInfoPointTotal(int userId) {
		return mapper.getUserBasicInfoPointTotal(userId);
	}

	@Override
	public List<PointVO> getUserExInfoAll(int userId, Criteria cri) {
		return mapper.getUserExInfoAll(userId, cri);
	}

}
