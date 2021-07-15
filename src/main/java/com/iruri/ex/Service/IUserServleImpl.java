package com.iruri.ex.Service;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

}
