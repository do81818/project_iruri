
package com.iruri.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.iruri.ex.page.Criteria;
import com.iruri.ex.vo.ReportVO;

@Mapper
public interface AdminMapper {
    
    // 신고알림 전체 리스트
    List<ReportVO> getReportList();
    
    // 신고알림 페이징 리스트
    List<ReportVO> getReportListWithPaging(Criteria cri);
    
    // 신고알림 리스트 갯수
    int countReportId();
}
