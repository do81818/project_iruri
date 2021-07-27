package com.iruri.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.iruri.ex.vo.IUserInfoVO;




@Mapper
public interface IUserInfoMapper {
    
	List<IUserInfoVO> selectAll(int userId);
    
//	int userheightdate(int userId);
}
