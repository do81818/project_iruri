package com.iruri.ex.vo;

import java.sql.Timestamp;
import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
    name            type(size)          Nullable  default        
    USER_ID         NUMBER              No                  회원번호
    USER_EMAIL      VARCHAR2(100 BYTE)  No                  이메일
    USER_PW         VARCHAR2(20 BYTE)   No                  비밀번호
    USER_NICKNAME   VARCHAR2(30 BYTE)   No                  닉네임
    USER_NAME       VARCHAR2(20 BYTE)   Yes                 이름
    USER_PHONE      CHAR(12 BYTE)       No                  전화번호
    USER_SIGNDATE   DATE                No        sysdate   가입일
    USER_POINT      NUMBER              No        0         포인트
    USER_BLACKLIST  CHAR(1 BYTE)        No        0         블랙리스트
    KAKAO_ID        NUMBER              YES                 카카오 아이디
 */

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class IUserVO {
    
    private int userId;
    private String userEmail;
    private String userPw;
    private String userNickname;
    private String userName;
    private String userPhone;
    private Date userSigndate;
    private int userPoint;
    private boolean userBlackList;
    private String userBlaskListReason;
    private String kakaoId;
    private String naverId;
    private String googleId;
    
    private List<AuthVO> authList;
}
