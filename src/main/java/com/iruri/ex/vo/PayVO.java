package com.iruri.ex.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
    name            type(size)          Nullable  default        
PAY_ID	NUMBER		No	1	
PAY_STATE	VARCHAR2(20 BYTE)	'pay' 	No	2	
PAY_WAY	VARCHAR2(20 BYTE)		No	3	
BUY_ID	NUMBER		No	4	
 */

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class PayVO {
	
    private int payId;
    private String payState;
    private String payWay;
    private int buyId;
    private int rnum;
    
}
