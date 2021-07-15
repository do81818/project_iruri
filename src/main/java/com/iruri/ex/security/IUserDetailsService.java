package com.iruri.ex.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.iruri.ex.mapper.IUserMapper;
import com.iruri.ex.vo.IUserUser;
import com.iruri.ex.vo.IUserVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class IUserDetailsService implements UserDetailsService {

        @Autowired
        private IUserMapper iUserMapper;

        @Override
        public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
            
            log.warn("Load User By UserName : " + username);
            
            
            IUserVO vo = iUserMapper.getIUser(username);
            
            log.warn("queried by IUserVO mapper:" + vo);
            
            return vo == null ? null : new IUserUser(vo);
        }
        
}
