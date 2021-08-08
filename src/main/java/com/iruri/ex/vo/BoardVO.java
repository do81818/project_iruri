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
 * BOARD_ID	NUMBER
BOARD_TITLE	VARCHAR2(100 BYTE)
BOARD_CONTENT	VARCHAR2(2000 BYTE)
BOARD_FILE	VARCHAR2(500 BYTE)
BOARD_DATE	DATE
BOARD_STATE	VARCHAR2(20 BYTE)
BOARD_HIT	NUMBER
BOARD_LIKE	NUMBER
BOARD_GROUPID	NUMBER
CATEGORY_ID	NUMBER
USER_ID	NUMBER
*/

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class BoardVO {
    
    private int boardId;
    private String boardTitle;
    private String boardContent;
    private String boardFile;
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date boardDate;
    private String boardState;
    private int boardHit;
    private int boardLike;
    private int boardGroupId;
    private int categoryId;
    private IUserVO iUserVO;
    private int rn;
    private int classId;
  
    private List<IClassVO> iClassList;


    
}
