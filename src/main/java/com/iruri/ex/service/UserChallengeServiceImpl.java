package com.iruri.ex.service;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iruri.ex.mapper.ChallengeMapper;
import com.iruri.ex.mapper.IClassMapper;
import com.iruri.ex.mapper.UserChallengeMapper;
import com.iruri.ex.page.Criteria;
import com.iruri.ex.vo.IClassVO;
import com.iruri.ex.vo.IUserVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class UserChallengeServiceImpl implements UserChallengeService {
    

    @Autowired
    private UserChallengeMapper userchallengeMapper;
    
	
@Override
public int challengecount(int userId) {
	return userchallengeMapper.challengecount(userId);
}

@Override
public int userlikecount(int userId) {
	return userchallengeMapper.userlikecount(userId);
}


@Override
public List<IClassVO> userchallengelist(int userId){
	return userchallengeMapper.userchallengelist(userId);
}

@Override
public List<IClassVO> userlikelist(Criteria cri, int userId){
	return userchallengeMapper.userlikelist(cri,userId);
}

@Override
public List<IClassVO> userendlist(Criteria cri,int userId){
	return userchallengeMapper.userendlist(cri,userId);
}
  

@Override
public int likecount(int userId) {
	return userchallengeMapper.likecount(userId);
}

@Override
public int endcount(int userId) {
	return userchallengeMapper.endcount(userId);
}


@Override
public int userendcount(int userId) {
	return userchallengeMapper.userendcount(userId);
}


@Override
public int classcount(int userId) {
	return userchallengeMapper.classcount(userId);
}

@Override
public int classlikecount(int userId) {
	return userchallengeMapper.classlikecount(userId);
}

@Override
public int classendcount(int userId) {
	return userchallengeMapper.classendcount(userId);
	
}


@Override
public List<IClassVO> userclasslist(int userId){
	return userchallengeMapper.userclasslist(userId);
}
 

@Override
public List<IClassVO> userclasslikelist_kind(int userId){
	return userchallengeMapper.userclasslikelist_kind(userId);
}

@Override
public List<IClassVO> userclasslikelist(Criteria cri,int userId){
	return userchallengeMapper.userclasslikelist(cri,userId);
}


@Override
public int class_likecount(int userId){
	return userchallengeMapper.class_likecount(userId);
}

@Override
public List<IClassVO> userclasslikelist_date(int userId){
	return userchallengeMapper.userclasslikelist_date(userId);
}


@Override
public int class_endcount(int userId){
	return userchallengeMapper.class_endcount(userId);
}

@Override
public List<IClassVO> userclassendlist(Criteria cri,int userId){
	return userchallengeMapper.userclassendlist(cri,userId);
}

@Override
public List<IClassVO> userclassendlist_kind(int userId){
	return userchallengeMapper.userclassendlist_kind(userId);
}

@Override
public List<IClassVO> userclassendlist_date(int userId){
	return userchallengeMapper.userclassendlist_date(userId);
}


// 유저 챌린지 삭제
@Override
public void challenge_delete(int userId) {
	return userchallengeMapper.challeng_delete(userId);
}


}
