
package com.iruri.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.iruri.ex.vo.ReportVO;

@Mapper
public interface AdminMapper {
    
    // 신고알림 리스트
    List<ReportVO> getReportList();
}
