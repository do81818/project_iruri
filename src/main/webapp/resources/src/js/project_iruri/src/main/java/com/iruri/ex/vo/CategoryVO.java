package com.iruri.ex.vo;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatTypes;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
CATEGORY_ID	NUMBER
CATEGORY_NAME	VARCHAR2(30 BYTE)
*/

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class CategoryVO {
    
    private int categoryId;
    private String categoryName;


    
}
