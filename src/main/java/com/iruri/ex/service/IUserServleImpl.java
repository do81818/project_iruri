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
    
    public IUserVO findSocialUser(int socialId) {
        
        IUserVO vo = iUserMapper.findSocialUser(socialId);
        if(vo == null) {
            return null;
        }
        return vo;
    }
    
    // 4. 서비스에서 만든 메소드를 구현한다.
    // 5. 메퍼에 메소드를만든 후 파라미터로 보내준다.
    // 6. 메퍼에서 받은 객체를 받는다
    // 7. 컨트롤러에서 사용해주기 위해 7번으로 리턴해준다.
    
    public IUserVO selectOne(String userEmail) {
    	IUserVO vo = iUserMapper.selectOne(userEmail);
    	if(vo == null) {
    		return null;
    	}
    	return vo;
    }

}
