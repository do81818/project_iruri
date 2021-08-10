package com.iruri.ex.vo;

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
public class TableJoinVO {

	private IUserVO iuserVo;
	private AuthVO authVo;
	private ReportVO reportVo;
	private MoneyVO moneyVo;
	private PayVO payVo;
	private BuyVO buyVo;
	private IClassVO iclassVo;
	
	private double avgGrade;
	private int totalMoney;
}
