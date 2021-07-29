package com.iruri.ex.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.iruri.ex.vo.IUserInfoVO;
import com.iruri.ex.vo.IUserVO;

// @Mapper 어노테이션 
@Mapper
public interface IUserUpdateMapper {
    
    // 유저정보 업데이트
    void update(IUserVO iuservo);
    
    // 유저신체정보 업데이트
    void infoupdate(IUserInfoVO iuserinfovo);
   
    

}
