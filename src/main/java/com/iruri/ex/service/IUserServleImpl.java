package com.iruri.ex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iruri.ex.mapper.IUserMapper;
import com.iruri.ex.security.UserRegService;
import com.iruri.ex.vo.IUserVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class IUserServleImpl implements IUserService {

//    @Autowired
//    private BCryptPasswordEncoder passEncoder;
    
    // 매퍼와 연결해준다.
    @Autowired
    private IUserMapper iUserMapper;
    @Autowired
    private UserRegService regService;
    
    public int signUpUser(IUserVO iUserVO, Boolean authCheck, String userPwCheck, String agree) {
        
        final int SIGNUP_FAILURE = 1;
        
        if(regService.userEmailCheck(iUserVO.getUserEmail()) != 0) {
            return SIGNUP_FAILURE;            
        }
           
        if(authCheck != true) {
            return SIGNUP_FAILURE;
        }
        
        if(regService.userPasswordCheck(iUserVO.getUserPw()) < 4 || !(iUserVO.getUserPw().equals(userPwCheck))) {
            return SIGNUP_FAILURE;
        }
        
        if(regService.userNicknameCheck(iUserVO.getUserNickname()) > 0) {
            return SIGNUP_FAILURE;
        }
        
        if(!(agree.equals("true"))) {
            return 1;
        }
        
//        String password = userVO.getPassword();
//        String encode = passEncoder.encode(password);
        iUserMapper.signUpUser(iUserVO);
        
        return 0;
    }
    
    public IUserVO findKakaoUser(String socialEmail) {
        
        IUserVO vo = iUserMapper.findKakaoUser(socialEmail);
        if(vo == null) {
            return null;
        }
        return vo;
    }
    
    public IUserVO findNaverUser(String socialEmail) {
        
        IUserVO vo = iUserMapper.findNaverUser(socialEmail);
        if(vo == null) {
            return null;
        }
        return vo;
    }
    
    public IUserVO findGoogleUser(String socialEmail) {
        
        IUserVO vo = iUserMapper.findGoogleUser(socialEmail);
        if(vo == null) {
            return null;
        }
        return vo;
    }

    public int signUpPwUpdate(String userEmail, String userPw, Boolean authCheck) {
        
        if(authCheck != true) {
            return -1;
        } else {
            iUserMapper.updatePw(userEmail, userPw);
            return 0;
        }
    }
    
    
    
    
    // @Override 우리가 정의한거랑 다를 때 오류를 내준다 
    
    // 4. 서비스에서 만든 메소드를 구현한다. 
    // 5. 매퍼에 메소드를 만든 후 파라미터로 보내준다
    // 8. 메퍼에서 받은 객체를 받는다. 
    // 9. 컨트롤러에서 사용해주기 위해 7번으로 리턴해준다
    @Override
    public IUserVO selectOne(String userEmail) {
        
        IUserVO vo = iUserMapper.selectOne(userEmail);
        
        // null이면 exception 이 안뜨고 null 을 리턴? 
        if(vo == null) {
            return null;
        }
         
        return vo;
    }

}
