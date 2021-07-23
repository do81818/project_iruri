package com.iruri.ex.vo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class IUserUser extends User {

    private IUserVO iUser;
    
    public IUserUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
        super(username, password, authorities);
    }
    
    public IUserUser(IUserVO iUserVO) {
        super(iUserVO.getUserEmail(), iUserVO.getUserPw(), getAuth(iUserVO));
        this.iUser = iUserVO;
        
    }

    public static Collection<? extends GrantedAuthority> getAuth(IUserVO iUserVO) {
        
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        
        for(AuthVO auth : iUserVO.getAuthList()) {
            authorities.add(new SimpleGrantedAuthority(auth.getAuthContent()));
        }
        return authorities;
    }
}
