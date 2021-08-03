package com.iruri.ex.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

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
    
    private int boardId;
    private String reportContent;
    private Date reportDate;
    private int reportId;
    private int userId;
    
    private String reportUserNickName;
    private String reportUserRoll;
}
