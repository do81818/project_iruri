package com.iruri.ex.vo;


import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
    이름           널?       유형     
------------ -------- ------ 
MONEY_ID     NOT NULL NUMBER 
MONEY_DATE   NOT NULL DATE   
MONEY_INPUT  NOT NULL NUMBER 
MONEY_OUTPUT NOT NULL NUMBER 
PAY_ID       NOT NULL NUMBER 
USER_ID      NOT NULL NUMBER 
*/

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class MoneyVO {
	private int moneyId;
	
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date moneyDate;
	private int moneyInput;
    private int moneyOutput;
    private int payId;
	private IUserVO iUserVO; 
}
