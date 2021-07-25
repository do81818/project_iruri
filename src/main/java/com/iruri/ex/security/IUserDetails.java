package com.iruri.ex.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.SpringSecurityCoreVersion;
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
public class IUserDetails extends User {

    private static final long serialVersionUID = SpringSecurityCoreVersion.SERIAL_VERSION_UID;
    private IUserVO currentUser;
    
    public IUserDetails(String username, String password, Collection<? extends GrantedAuthority> authorities) {
        super(username, password, authorities);
    }
    
    public IUserDetails(IUserVO currentUser) {
        super(currentUser.getUserEmail(), currentUser.getUserPw(), getAuth(currentUser));
        this.currentUser = currentUser;
        
    }

    public static Collection<? extends GrantedAuthority> getAuth(IUserVO currentUser) {
        
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        
        for(AuthVO auth : currentUser.getAuthList()) {
            authorities.add(new SimpleGrantedAuthority(auth.getAuthContent()));
        }
        return authorities;
    }
}
