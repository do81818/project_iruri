package com.iruri.ex.service;

import java.util.List;

import com.iruri.ex.page.Criteria;
import com.iruri.ex.vo.ReportVO;

public interface ReportService {
    
    // 신고알림 리스트
	List<ReportVO> getReportList();
    
	// 신고알림 페이징 리스트
    List<ReportVO> getReportList(Criteria cri);
    
    // 신고알림 리스트 갯수
    int countReportId();
}
