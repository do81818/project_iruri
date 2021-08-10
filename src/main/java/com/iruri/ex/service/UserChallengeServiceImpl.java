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
public List<IClassVO> userchallengelist(int userId){
	return userchallengeMapper.userchallengelist(userId);
}

@Override
public List<IClassVO> userlikelist(Criteria cri, int userId){
	return userchallengeMapper.userlikelist(cri,userId);
}

@Override
public List<IClassVO> userendlist(int userId){
	return userchallengeMapper.userendlist(userId);
}
  

@Override
public int likecount(int userId) {
	return userchallengeMapper.likecount(userId);
}

@Override
public int endcount(int userId) {
	return userchallengeMapper.endcount(userId);
}


 
}
