package com.iruri.ex.vo;


import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;



@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ProfitVO {
	
	
	private int buyRealpay;
	private int buyPoint;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date buyDate;
	private IUserVO iUserVO;
	private int classId;
	private String classTitle;
	
	private int rnum;

	// 달마다 수익을 담기위한 객체 
	private int profit;
	private int buyProfit;
	private int mm;

	
}
