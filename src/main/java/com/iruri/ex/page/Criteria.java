package com.iruri.ex.page;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class Criteria {
    private int pageNum; //페이지 넘버
    private int amount; //한 페이지 당 몇개의 데이터를 보여 줄건지
    private String keyword; //챌린지 메인 검색
    
    public Criteria() {
        this(1,9);
        //1페이지에 9개의 데이터
    }
    
    public Criteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
        this.keyword = null;
       
    }

    
    
    
}
