package com.iruri.ex.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

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
    // 비밀번호 찾기
    void updatePw(@Param("userEmail") String userEmail, @Param("userPw") String userPw);
    // 6. 메퍼에서 메소드를 만든다 servicelImpl에서받는 메소드이다.
    IUserVO selectOne(String userEmail);
    // 파라미터로 뭘가져올지 써준다.
    

}
