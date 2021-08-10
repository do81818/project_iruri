package com.iruri.ex.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class GoogleAuth {

    public String access_token;
    public Integer expires_in;
    public String refresh_token;
    public String scope;
    public String token_type;
    public String id_token;
    
}
