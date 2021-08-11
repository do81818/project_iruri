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
COMMENT_ID      NOT NULL NUMBER         
COMMENT_DATE    NOT NULL DATE           
COMMENT_CONTENT NOT NULL VARCHAR2(3000) 
USER_NICKNAME   NOT NULL VARCHAR2(20)   
USER_PHONE      NOT NULL CHAR(16)       
USER_ID         NOT NULL NUMBER         
CLASS_ID                 NUMBER    
*/

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ICommentVO {
    
    private int commentId;
    
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date commentDate;
    
    private String commentContent;
    
    private String userNickname;
    
    private int userPhone;
    
    private int classId;


    
}
