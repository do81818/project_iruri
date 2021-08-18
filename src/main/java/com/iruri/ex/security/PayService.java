package com.iruri.ex.security;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;
import com.iruri.ex.mapper.PtClassMapper;
import com.iruri.ex.vo.IClassVO;
import com.iruri.ex.vo.PortProfile;
import com.iruri.ex.vo.PortVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class PayService {
    
    @Autowired
    PtClassMapper ptClassMapper;

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
    public PortVO getPaymentData(PortProfile token, String imp_uid) {
        
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", token.getResponse().getAccess_token());
        headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
        
        HttpEntity entity = new HttpEntity(headers);
        
        String url = "https://api.iamport.kr/payments/" + imp_uid;
        
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, entity, String.class);
        
        Gson gson = new Gson();
        if(response.getStatusCode() == HttpStatus.OK) {
            return gson.fromJson(response.getBody(), PortVO.class);
        }
        return null;
    }
    
    @Transactional
    public int getBuyId(int userId, int classId, int buyRealPay) {
        
        ptClassMapper.insertQuery(userId, classId, buyRealPay);
        return ptClassMapper.getBuyId();
    }
    
    public int getRealPay(int buyId) {
        
        return ptClassMapper.getRealPay(buyId);
    }
    
    public void updatePay(int buyId) {
        
        ptClassMapper.updatePay(buyId);
    }
    
    public void updateCancle(int buyId) {
        
        ptClassMapper.updateCancle(buyId);
    }
    
}
