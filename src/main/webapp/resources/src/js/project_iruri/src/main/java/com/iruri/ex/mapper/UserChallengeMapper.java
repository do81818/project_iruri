
package com.iruri.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.iruri.ex.page.Criteria;
import com.iruri.ex.vo.IClassVO;
import com.iruri.ex.vo.IUserVO;

@Mapper
public interface UserChallengeMapper {
    
   
int challengecount(int userId);

List<IClassVO>userchallengelist(int userId);

List<IClassVO> userlikelist(@Param("cri") Criteria cri,@Param("userId") int userId);

List<IClassVO> userendlist(@Param("cri") Criteria cri,@Param("userId") int userId);

int likecount(int userId);

int endcount(int userId);

int userlikecount(int userId);

int userendcount(int userId);


// 유저 클래스 //
int classcount(int userId);

int classlikecount(int userId);

int classendcount(int userId);

List<IClassVO> userclasslist(int userId);

List<IClassVO> userclasslikelist_kind(int userId);
List<IClassVO> userclasslikelist_date(int userId);

List<IClassVO> userclasslikelist(@Param("cri") Criteria cri,@Param("userId") int userId);

int class_likecount(int userId);


int class_endcount(int userId);

List<IClassVO> userclassendlist(@Param("cri") Criteria cri,@Param("userId") int userId);

List<IClassVO> userclassendlist_kind(int userId);

List<IClassVO> userclassendlist_date(int userId);
}
