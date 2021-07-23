package com.iruri.ex.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
   이름            널?       유형           
------------- -------- ------------ 
EXERCISE_DATE NOT NULL VARCHAR2(20) 
CLASS_ID      NOT NULL NUMBER  
*/

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ExerciseDateVO {
    
    private String exerciseDate;
    private int classId;
  
    
}
