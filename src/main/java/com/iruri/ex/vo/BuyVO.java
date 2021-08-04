package com.iruri.ex.vo;

import java.sql.Timestamp;
import java.sql.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
    name            type(size)          Nullable  default        
BUY_ID	NUMBER		No	1	
BUY_REALPAY	NUMBER		No	2	
BUY_POINT	NUMBER	0 	No	3	
BUY_DATE	DATE	sysdate 	No	4	
USER_ID	NUMBER		No	5	
PAY_ID	NUMBER		No	6	
CLASS_ID	NUMBER		No	7	
 */

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class BuyVO {
    
    private int BuyId;
    private int Buyrealpay;
    private int BuyPoint;
    @JsonFormat(pattern = "yyyy-MM-dd")
    private int BuyDate;
    private IUserVO iUserVO; 
    private int PayId;
    private int ClassId;
    private int rnum;
   
    

}
