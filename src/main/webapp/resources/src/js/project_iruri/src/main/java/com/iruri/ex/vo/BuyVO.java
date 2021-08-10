package com.iruri.ex.vo;


import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
    name        type(size)    Nullable      default 
    BUY_ID		NUMBER			No						구매번호			
	BUY_REALPAY	NUMBER			No						실제구매금액
	BUY_POINT	NUMBER			No						구매시사용한 포인트
	BUY_DATE	DATE			No			sysdate		구매날짜	
	USER_ID		NUMBER			No						유저번호		
	PAY_ID		NUMBER			No						지불번호	
	CLASS_ID	NUMBER			No						클래스번호	
*/

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class BuyVO {
	
	private int buyId;
	private int buyRealpay;
	private int buyPoint;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date buyDate;
	private IUserVO iUserVO; 
	private int payId;
	private int classId;
	private int rnum;
	
	private List<IClassVO> iClassList;
    private List<PayVO> payList;
    private List<MoneyVO> moneyList;
	
}
