package com.iruri.ex.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.iruri.ex.mapper.IUserMapper;
import com.iruri.ex.vo.IUserVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class IUserDetailsService implements UserDetailsService {

        @Autowired
        private IUserMapper iUserMapper;

        @Override
        public UserDetails loadUserByUsername(String userEmail) throws UsernameNotFoundException {
            
            log.warn("Load User By UserName : " + userEmail);
            
            IUserVO IUser = iUserMapper.getIUser(userEmail);
            
            log.warn("queried by IUserVO mapper:" + IUser);
            
            return IUser == null ? null : new CustomUser(IUser);
        }
        
}
