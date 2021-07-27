package com.iruri.ex.service;

import java.util.List;

import com.iruri.ex.vo.ReportVO;

public interface ReportService {
    
    // 신고알림 리스트
    List<ReportVO> getReportList();
    
}
