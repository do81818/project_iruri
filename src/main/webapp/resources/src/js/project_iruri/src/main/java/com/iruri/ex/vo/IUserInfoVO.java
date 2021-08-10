package com.iruri.ex.vo;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;



//INFO_ID	NUMBER
//USER_BIRTH	DATE	
//USER_HEIGHT	NUMBER(5,2)
//USER_WEIGHT	NUMBER(5,2)
//USER_GENDER	CHAR(10 BYTE)	
//USER_ID	NUMBER	


@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class IUserInfoVO {
    
    private int infoId;
    private Date  userBirth;
    private int userHeight;
    private int userWeight;
    private String userGender;
    private int userId;

}
