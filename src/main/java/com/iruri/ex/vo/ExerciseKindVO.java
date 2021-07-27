package com.iruri.ex.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
이름            널?       유형            
------------- -------- ------------- 
EXERCISE_KIND NOT NULL VARCHAR2(100) 
CLASS_ID      NOT NULL NUMBER    
*/

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ExerciseKindVO {
    
    private String exerciseKind;
    private int classId;
  
}
