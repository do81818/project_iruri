package com.iruri.ex.vo;

import lombok.Data;

@Data
public class PortProfile {

    public Integer code;
    public Object message;
    public Response response;
    
    @Data
    public class Response {
        public String access_token;
        public Integer now;
        public Integer expired_at;
    }
}
