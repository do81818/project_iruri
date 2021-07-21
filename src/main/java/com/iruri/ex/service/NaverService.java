package com.iruri.ex.service;

import java.math.BigInteger;
import java.security.SecureRandom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;
import com.iruri.ex.security.ApiKeys;
import com.iruri.ex.security.IUserDetailsService;
import com.iruri.ex.vo.IUserVO;
import com.iruri.ex.vo.NaverAuth;
import com.iruri.ex.vo.NaverProfile;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class NaverService {
    
    @Autowired
    IUserService iUserService;
    @Autowired
    IUserDetailsService iUserDetailsService;
    
    private final static String N_CLIENT_ID = ApiKeys.N_CLIENT_ID;
    private final static String N_REDIRECT_URI = "http://localhost:8282/ex/auth/naver/callback";

    public String getAuthorizationUrl() {
        SecureRandom random = new SecureRandom();
        String state = new BigInteger(130, random).toString();
        
        String naverUrl = "https://nid.naver.com/oauth2.0/authorize?response_type=code"
                + "&client_id=" + N_CLIENT_ID + "&redirect_uri=" + N_REDIRECT_URI
                + "&state=" + state;
        
        return naverUrl;
    }
    
    private final static String N_TOKEN_URI = "https://nid.naver.com/oauth2.0/token";
    private final static String N_CLIENT_SECRET = ApiKeys.N_CLIENT_SECRET;
    
    public NaverAuth getNaverTokenInfo(String code, String state) {
        
        RestTemplate restTemplate = new RestTemplate();
        
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
        
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("grant_type", "authorization_code");
        params.add("client_id", N_CLIENT_ID);       
        params.add("client_secret", N_CLIENT_SECRET);
        params.add("code", code);
        params.add("state", state);
        
        HttpEntity<MultiValueMap<String, String>> naverTokenRequest = new HttpEntity<>(params, headers);
        
        ResponseEntity<String> response = restTemplate.postForEntity(N_TOKEN_URI, naverTokenRequest, String.class);
        
        log.info("getNaverTokenInfo response.getBody(): " + response.getBody());
        log.info("getNaverTokenInfo response.getHeaders(): " + response.getHeaders());
        
        Gson gson = new Gson();
        if(response.getStatusCode() == HttpStatus.OK) {
            return gson.fromJson(response.getBody(), NaverAuth.class);
        }
        
        return null;
    }
    
    private final static String N_PROFILE_URI = "https://openapi.naver.com/v1/nid/me";
    
    public NaverProfile getNaverProfile(String accessToken) {
        
        RestTemplate restTemplate = new RestTemplate();
        
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer " + accessToken);
        
        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(null, headers);
        
        ResponseEntity<String> response = restTemplate.postForEntity(N_PROFILE_URI, request, String.class);
        
        log.info("getNaverProfile response.getBody(): " + response.getBody());
        
        Gson gson = new Gson();
        if(response.getStatusCode() == HttpStatus.OK) {
            return gson.fromJson(response.getBody(), NaverProfile.class);
        }
        
        return null;
    }
    
    public void setContextHolder(String code, String state) {
        log.info("setContextHolder: " + "CODE: " + code + "STATE: " + state);
        
        NaverAuth naverAuth = getNaverTokenInfo(code, state);
        NaverProfile profile = getNaverProfile(naverAuth.getAccess_token());
        
        IUserVO originUser = iUserService.findNaverUser(profile.getResponse().getEmail());
        UserDetails userDetails = iUserDetailsService.loadUserByUsername(originUser.getUserEmail());
        Authentication authentication = new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(authentication);
    }
}
