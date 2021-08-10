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
            
            IUserVO currentUser = iUserMapper.getIUser(userEmail);
            
            log.warn("queried by IUserVO mapper:" + currentUser);
            
            return currentUser == null ? null : new IUserDetails(currentUser);
        }
        
}
