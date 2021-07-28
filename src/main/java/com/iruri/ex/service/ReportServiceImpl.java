package com.iruri.ex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iruri.ex.mapper.AdminMapper;
import com.iruri.ex.vo.ReportVO;

@Service
public class ReportServiceImpl implements ReportService {

    @Autowired
    private AdminMapper mapper;
    
    @Override
    public List<ReportVO> getReportList() {
        
        return mapper.getReportList();
    }

    
    
}
