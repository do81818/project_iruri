package com.iruri.ex.service;

import java.util.List;

import com.iruri.ex.vo.IClassVO;

public interface UserChallengeService {
	 int challengecount(int UserId);

	List<IClassVO> userchallengelist(int userId);

	List<IClassVO> userlikelist(int userId);

}
