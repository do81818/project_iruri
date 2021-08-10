package com.iruri.ex.vo;


import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
POINT_ID	NUMBER
POINT_CHANGEDATE	DATE
POINT_SAVEDATE	DATE
POINT_STATE	VARCHAR2(100 BYTE)
POINT_VALUE	NUMBER
POINT_CONTENT	VARCHAR2(100 BYTE)
USER_ID	NUMBER
*/

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class PointVO {
    
    private int pointId;
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date pointChangedate;
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date pointSavedate;
    private String pointState;
    private int pointValue;
    private String pointContent;
    private int userId;
    private int rnum;



    
}
