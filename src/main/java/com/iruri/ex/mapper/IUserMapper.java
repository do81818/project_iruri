package com.iruri.ex.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.iruri.ex.vo.IUserVO;

@Mapper
public interface IUserMapper {
    
    // 회원가입
    void signUpUser(IUserVO iUserVO);
    // 로그인
    IUserVO getIUser(String userEmail);
    // 소셜회원 찾기
    IUserVO findSocialUser(int socialId);
    
    // 동훈님설명
    // 6. 메퍼에서 메소드를 만든다. serviceImpl에서 받는 메소드 이다
	IUserVO selectOne(String userEmail);
    
}
