package com.iruri.ex.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.SecureRandom;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;
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

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.iruri.ex.security.ApiKeys;
import com.iruri.ex.security.IUserDetailsService;
import com.iruri.ex.vo.GoogleAuth;
import com.iruri.ex.vo.GoogleProfile;
import com.iruri.ex.vo.IUserVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class GoogleService {
    
    @Autowired
    IUserService iUserService;
    @Autowired
    IUserDetailsService iUserDetailsService;
    
    private final static String G_CLIENT_ID = ApiKeys.G_CLIENT_ID;
    private final static String G_REDIRECT_URI = "http://localhost:8282/ex/auth/google/callback";
    
    public String getAuthorizationUrl() {
        SecureRandom random = new SecureRandom();
        String state = new BigInteger(130, random).toString();
                
        String googleUrl = "https://accounts.google.com/o/oauth2/v2/auth?"
                + "scope=email%20profile%20openid"
                + "&response_type=code"
                + "&state=" + state
                + "&client_id=" + G_CLIENT_ID
                + "&redirect_uri=" + G_REDIRECT_URI
                + "&access_type=offline";
        
        return googleUrl;
    }
    
    private final static String G_TOKEN_URI = "https://www.googleapis.com/oauth2/v4/token";
    private final static String G_CLIENT_SECRET = ApiKeys.G_CLIENT_SECRET;
    
    public GoogleAuth getGoogleTokenInfo(String code) {
        
        RestTemplate restTemplate = new RestTemplate();
        
        HttpHeaders headers = new HttpHeaders();
        
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("grant_type", "authorization_code");
        params.add("client_id", G_CLIENT_ID);
        params.add("client_secret", G_CLIENT_SECRET);
        params.add("redirect_uri", G_REDIRECT_URI);
        params.add("code", code);
        
        HttpEntity<MultiValueMap<String, String>> googleTokenRequest = new HttpEntity<>(params, headers);
        
        ResponseEntity<String> response = restTemplate.postForEntity(G_TOKEN_URI, googleTokenRequest, String.class);
        
        log.info("getGoogleTokenInfo response.getBody(): " + response.getBody());
        log.info("getGoogleTokenInfo response.getHeaders(): " + response.getHeaders());
        
        Gson gson = new Gson();
        if(response.getStatusCode() == HttpStatus.OK) {
            return gson.fromJson(response.getBody(), GoogleAuth.class);
        }
        
        return null;
    }
    
    private final static String G_PROFILE_URI = "https://www.googleapis.com/oauth2/v2/userinfo";
    
    public GoogleProfile getGoogleProfile(String accessToken) {
        
        final HttpClient client = HttpClientBuilder.create().build();
        final HttpGet get = new HttpGet(G_PROFILE_URI);
 
        GoogleProfile googleProfile = null;
        
        get.addHeader("Authorization", "Bearer " + accessToken);
 
        try {
            final HttpResponse response = client.execute(get);
            final int responseCode = response.getStatusLine().getStatusCode();
          
            ObjectMapper mapper = new ObjectMapper();
            JsonNode jsonNode = mapper.readTree(response.getEntity().getContent());

            googleProfile = mapper.treeToValue(jsonNode, GoogleProfile.class);
 
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            // clear resources
        }
        
        return googleProfile;
        
    }
    
    public void setContextHolder(String code) {
        log.info("setContextHolder: " + code);
        
        GoogleAuth googleAuth = getGoogleTokenInfo(code);
        GoogleProfile profile = getGoogleProfile(googleAuth.getAccess_token());

        IUserVO originUser = iUserService.findGoogleUser(profile.getEmail());
        UserDetails userDetails = iUserDetailsService.loadUserByUsername(originUser.getUserEmail());
        Authentication authentication = new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(authentication);
    }
    
}
