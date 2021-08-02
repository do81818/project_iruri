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

/*
이름          널?       유형     
----------- -------- ------ 
LIKELIST_ID NOT NULL NUMBER 
USER_ID              NUMBER 
CLASS_ID             NUMBER 
BOARD_ID             NUMBER 
*/

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class LikeListVO {
    
    private int likeListId;
    private int userId;
    private int classId;
    private int boardId;


    
}
