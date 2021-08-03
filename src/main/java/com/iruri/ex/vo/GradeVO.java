package com.iruri.ex.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
    name        type(size)  Nullable    default 
    GRADE_ID	NUMBER		No					평점번호	
	GRADE_SCORE	NUMBER		No					평점
	USER_ID		NUMBER		No					유저번호	
	CLASS_ID	NUMBER		No					클래스번호	
*/

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class GradeVO {
    
    private int gradeId;
    private int gradeScore;
    private int userId;
    private int classId;
    
}
