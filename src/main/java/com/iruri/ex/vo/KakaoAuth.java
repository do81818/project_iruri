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
public class KakaoAuth {

    public String access_token;
    public String token_type;
    public String refresh_token;
    public Integer expires_in;
    public String scope;
    public Integer refresh_token_expires_in;

}
