package com.iruri.ex.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
    BOARD_ID        NUMBER              No  
    REPORT_CONTENT  VARCHAR2(100 BYTE)  No  
    REPORT_DATE     DATE                No  sysdate 
    REPORT_ID       NUMBER              No  
    USER_ID         NUMBER              No  
*/

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ReportVO {
    
    private int boardId;
    private String reportContent;
    private Date reportDate;
    private int reportId;
    private int userId;
    
    private String userNickName;
    private String userAuthContent;
}
