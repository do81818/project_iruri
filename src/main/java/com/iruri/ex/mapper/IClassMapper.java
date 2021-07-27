
package com.iruri.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.iruri.ex.vo.IClassVO;
import com.iruri.ex.vo.IUserVO;

@Mapper
public interface IClassMapper {
    
    // 모든 클래스
    List<IClassVO> selectAll(int userId);
    
    // 현재 운영중인 클래스
    List<IClassVO> selectAllCurrent(int userId);
    
    // 종료된 클래스
    List<IClassVO> selectAllEnd(int userId);
    
    //챌린지 개설 폼
    void insertChallenge(IClassVO iClassVO);
}
