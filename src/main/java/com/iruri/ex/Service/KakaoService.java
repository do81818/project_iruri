package com.iruri.ex.Service;

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
import com.iruri.ex.security.IUserDetailsService;
import com.iruri.ex.vo.IUserVO;
import com.iruri.ex.vo.KakaoAuth;
import com.iruri.ex.vo.KakaoProfile;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class KakaoService {
    
    @Autowired
    IUserService iUserService;
    @Autowired
    IUserDetailsService iUserDetailsService;

    private final static String K_CLIENT_ID = "d575d2c5d3ba998a1b5e51f9f6a24072";
    private final static String K_REDIRECT_URI = "http://localhost:8282/ex/auth/kakao/callback";
    
    public String getAuthorizationUrl() {
        String kakaoUrl = "https://kauth.kakao.com/oauth/authorize?" + "client_id=" + K_CLIENT_ID + "&redirect_uri="
              + K_REDIRECT_URI + "&response_type=code";
        
        return kakaoUrl;
     }

     private final static String K_TOKEN_URI = "https://kauth.kakao.com/oauth/token";
     
     public KakaoAuth getKakaoTokenInfo(String code) {
         
         RestTemplate restTemplate = new RestTemplate();
         
         // HttpHeader 오브젝트 생성
         HttpHeaders headers = new HttpHeaders();
         headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
         
         // HttpBody 오브젝트 생성
         MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
         params.add("grant_type", "authorization_code");
         params.add("client_id", K_CLIENT_ID);
         params.add("redirect_uri", K_REDIRECT_URI);
         params.add("code", code);
         
         // HttpHeader와 HttpBody를 하나의 오브젝트에 담기
         HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(params, headers);
         
         // Http요청하기 - POST 요청을 보내고 결과로 ResponseEntity로 반환받는다
         ResponseEntity<String> response = restTemplate.postForEntity(K_TOKEN_URI, kakaoTokenRequest, String.class);

         // response 에서 .getBody() 와 .getHeaders() 로 HTTP 메시지를 나눠서 확인할 수 있다.
         log.info("getKakaoTokenInfo response.getBody(): " + response.getBody());
         log.info("getKakaoTokenInfo response.getHeaders(): " + response.getHeaders());
         
         // gson 라이브러리를 이용해서 Http 통신 결과가 200 OK 일때
         // response.getBody() 의 JSON 데이터를 KakaoAuth.class 에 담는다.
         Gson gson = new Gson();
         if(response.getStatusCode() == HttpStatus.OK) {
             return gson.fromJson(response.getBody(), KakaoAuth.class);
         }
         
         return null;
     }
     
     private final static String K_PROFILE_URI = "https://kapi.kakao.com/v2/user/me";
     
     // 토큰을 통한 사용자 조회
     public KakaoProfile getKakaoProfile(String accessToken) {
         
         RestTemplate restTemplate = new RestTemplate();
         
         HttpHeaders headers = new HttpHeaders();
         headers.set("Authorization", "Bearer " + accessToken);
         
         HttpEntity<MultiValueMap<String, String>> request  = new HttpEntity<>(null, headers);
         
         ResponseEntity<String> response = restTemplate.postForEntity(K_PROFILE_URI, request, String.class);
         
         log.info("getKakaoProfile response.getBody(): " + response.getBody());
         
         Gson gson = new Gson();
         if(response.getStatusCode() == HttpStatus.OK) {
             return gson.fromJson(response.getBody(), KakaoProfile.class);
         }

         return null;
     }
     
     public void setContextHolder(String code) {
         log.info("KakaoService: " + code);
         
         KakaoAuth kakaoAuth = getKakaoTokenInfo(code);
         KakaoProfile profile = getKakaoProfile(kakaoAuth.getAccess_token());
     
         // 1. 사용자 로그인
         IUserVO originUser = iUserService.findSocialUser(profile.getId());
  
         // 2. 사용자 정보를 받아 UserDetailsService 에 전달해서 UserDetails 객체 생성
         UserDetails userDetails = iUserDetailsService.loadUserByUsername(originUser.getUserEmail());
         
         // 3. 해당 객체를 Authentication 에 전달하여 인증함
         Authentication authentication = new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
         
         // 4. 인증된 정보를 Security Context에 전달하여 "인증된 유저" 로 정의함
         SecurityContextHolder.getContext().setAuthentication(authentication);
     }

}
