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
    IUserVO findKakaoUser(String socialEmail);
    IUserVO findNaverUser(String socialEmail);
    IUserVO findGoogleUser(String socialEmail);
    // 닉네임 중복 체크
    int checkOverNickname(String userNickname);
    
    
    
    // 6. 메퍼에서 메소드를 만든다 servicelImpl에서받는 메소드이다.
    IUserVO selectOne(String userEmail);
    
}
