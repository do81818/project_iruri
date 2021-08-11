package com.iruri.ex.vo;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatTypes;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class trainerUserManagementVO {
    
    private int classId;
    private String classTitle;
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date classEndDate;
    private String classState;
    private int classJoinMember;
    private int rnum;
    
    private List<IUserVO> iUserList;
    
}


