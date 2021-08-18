package com.iruri.ex.vo;

import java.util.List;

import lombok.Data;

@Data
public class PortVO {
    public Integer code;
    public Object message;
    public Response response;
    
    @Data
    public class Response {
        public Integer amount;
        public String apply_num;
        public Object bank_code;
        public Object bank_name;
        public Object buyer_addr;
        public Object buyer_email;
        public Object buyer_name;
        public Object buyer_postcode;
        public Object buyer_tel;
        public Integer cancel_amount;
        public List<Object> cancel_history = null;
        public Object cancel_reason;
        public List<Object> cancel_receipt_urls = null;
        public Integer cancelled_at;
        public Object card_code;
        public Object card_name;
        public Object card_number;
        public Integer card_quota;
        public Object card_type;
        public Boolean cash_receipt_issued;
        public String channel;
        public String currency;
        public Object custom_data;
        public Object customer_uid;
        public Object customer_uid_usage;
        public Object emb_pg_provider;
        public Boolean escrow;
        public Object fail_reason;
        public Integer failed_at;
        public String imp_uid;
        public String merchant_uid;
        public String name;
        public Integer paid_at;
        public String pay_method;
        public String pg_id;
        public String pg_provider;
        public String pg_tid;
        public String receipt_url;
        public Integer started_at;
        public String status;
        public String user_agent;
        public Object vbank_code;
        public Integer vbank_date;
        public Object vbank_holder;
        public Integer vbank_issued_at;
        public Object vbank_name;
        public Object vbank_num;

    }
}
