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
 * CLASS_ID
CLASS_TITLE
CLASS_CONTENT
CLASS_GOAL
CLASS_EXERCISECOUNT
CLASS_STARTDATE
CLASS_ENDDATE
CLASS_IMAGE
CLASS_LIKE
CLASS_STATE
CLASS_HIT
CLASS_JOINMEMBER
CLASS_TRAINERINFO
CLASS_TOTALMEMBER
CLASS_PRICE
CLASS_NEED
CATEGORY_ID
USER_ID
CLASS_LEVEL
*/
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class IClassVO {
    
    private int classId;
    private String classTitle;
    private String classContent;
    private String classGoal;
    private int classExerciseCount;
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date classStartDate;
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date classEndDate;
    private String classImage;
    private int classLike;
    private String classState;
    private int classHit;
    private int classJoinMember;
    private String classTrainerInfo;
    private int classTotalMember;
    private int classPrice;
    private String classNeed;
    private int categoryId;
    private int userId;
    private String classLevel;
    private int rnum;
    
    private List<ExerciseDateVO> ExerciseDateList;
    private List<ExerciseKindVO> ExerciseKindList;
    
}
