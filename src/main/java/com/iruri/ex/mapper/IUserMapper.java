package com.iruri.ex.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.iruri.ex.vo.IUserVO;

// @Mapper 어노테이션 
@Mapper
public interface IUserMapper {
    
    // 회원가입
    void signUpUser(IUserVO iUserVO);
    // 로그인
    IUserVO getIUser(String userEmail);
    // 소셜회원 찾기
    IUserVO findKakaoUser(String socialEmail);
    IUserVO findNaverUser(String socialEmail);
    IUserVO findGoogleUser(String socialEmail);
    // 닉네임 중복 체크
    int checkOverNickname(String userNickname);
    // 이메일 중복 체크
    int checkOverEmail(String userEmail);
    // 6. 메퍼에서 메소드를 만든다 servicelImpl에서받는 메소드이다.
    IUserVO selectOne(String userEmail);
    // 파라미터로 뭘가져올지 써준다.
    
    // 동훈님설명
    // 6. 메퍼에서 메소드를 만든다. serviceImpl에서 받는 메소드 이다
	IUserVO selectOne(String userEmail);
    
}
