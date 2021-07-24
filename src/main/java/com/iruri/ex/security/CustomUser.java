package com.iruri.ex.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.iruri.ex.vo.AuthVO;
import com.iruri.ex.vo.IUserVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class CustomUser extends User {

    private IUserVO iUser;
    
    public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
        super(username, password, authorities);
    }
    
    public CustomUser(IUserVO iUserVO) {
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
