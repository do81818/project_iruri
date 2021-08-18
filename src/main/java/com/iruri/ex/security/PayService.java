package com.iruri.ex.security;


import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;
import com.iruri.ex.vo.IClassVO;
import com.iruri.ex.vo.PortProfile;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class PayService {

    static final String getTokenURI = "https://api.iamport.kr/users/getToken";
    
    // 엑세스토큰 발급
    public PortProfile getAuthToken() {
        
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
        
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("imp_key", ApiKeys.I_REST_KEY);
        params.add("imp_secret", ApiKeys.I_REST_SECRET);
        
        HttpEntity<MultiValueMap<String, String>> TokenRequest = new HttpEntity<>(params, headers);
        
        RestTemplate restTemplate = new RestTemplate();
        
        ResponseEntity<String> response = restTemplate.postForEntity(getTokenURI, TokenRequest, String.class);
        
        log.info(response.getHeaders());
        log.info(response.getBody());
        
        Gson gson = new Gson();
        if(response.getStatusCode() == HttpStatus.OK) {
            return gson.fromJson(response.getBody(), PortProfile.class);
        }
        
        return null;
    }

    // imp_uid 로 아임포트 서버에서 결제 정보 조회
    public ResponseEntity<String> getPaymentData(PortProfile token, String imp_uid) {
        
        
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", token.getResponse().getAccess_token());
        
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("imp_uid", imp_uid);
        
        HttpEntity<MultiValueMap<String, String>> TokenRequest = new HttpEntity<>(params, headers);
        
        RestTemplate restTemplate = new RestTemplate();
        
        ResponseEntity<String> response = restTemplate.exchange(getTokenURI, HttpMethod.GET, TokenRequest, String.class);
        
        return response;
    }
    
}
