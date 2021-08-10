package com.iruri.ex.vo;

import lombok.Data;

@Data
public class GoogleProfile {

    public String id;
    public String email;
    public Boolean verified_email;
    public String name;
    public String given_name;
    public String family_name;
    public String picture;
    public String locale;
    
}
