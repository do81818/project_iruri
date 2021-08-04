
package com.iruri.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.iruri.ex.page.Criteria;
import com.iruri.ex.vo.IClassVO;
import com.iruri.ex.vo.IUserVO;

@Mapper
public interface UserChallengeMapper {
    
   
int challengecount(int userId);

List<IClassVO>userchallengelist(int userId);

List<IClassVO> userlikelist(int userId);
}
