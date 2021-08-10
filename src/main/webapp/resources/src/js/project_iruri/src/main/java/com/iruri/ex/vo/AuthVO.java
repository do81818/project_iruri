package com.iruri.ex.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
    name            type(size)          Nullable    default 
    AUTH_NUMBER     NUMBER              No                          권한pk
    AUTH_ID         NUMBER              No          1               권한번호
    AUTH_CONTENT    VARCHAR2(20 BYTE)   No          ROLE_USER       권한내용
    USER_ID         NUMBER              No                          회원번호
*/

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class AuthVO {
    
    private int authNumber;
    private int authId;
    private String authContent;
    private int userId;
    
}
