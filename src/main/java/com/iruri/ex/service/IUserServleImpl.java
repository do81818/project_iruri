package com.iruri.ex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iruri.ex.mapper.IUserMapper;
import com.iruri.ex.vo.IUserVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class IUserServleImpl implements IUserService {

//    @Autowired
//    private BCryptPasswordEncoder passEncoder;
    
    @Autowired
    private IUserMapper iUserMapper;
    
    public void signUpUser(IUserVO iUserVO) {
        log.info("signUpUser");
        
//        String password = userVO.getPassword();
//        String encode = passEncoder.encode(password);
        
        iUserMapper.signUpUser(iUserVO);
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

}
