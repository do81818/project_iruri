package com.iruri.ex.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/*
    BOARD_ID        NUMBER              No  
    REPORT_CONTENT  VARCHAR2(100 BYTE)  No  
    REPORT_DATE     DATE                No  sysdate 
    REPORT_ID       NUMBER              No  
    USER_ID         NUMBER              No  
*/

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReportVO {
    
    private int reportId;
    private String reportContent;
    private int boardId;
    private Date reportDate;
    private int userId;
    
}
