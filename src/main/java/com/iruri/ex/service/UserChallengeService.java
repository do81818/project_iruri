package com.iruri.ex.service;

import java.util.List;

import com.iruri.ex.page.Criteria;
import com.iruri.ex.vo.IClassVO;

public interface UserChallengeService {
	
	// 유저가 참여하는 챌린지 갯수
	 int challengecount(int UserId);

	// 유저의 챌린지리스트
	List<IClassVO> userchallengelist(int userId);

	// 유저의 관심챌린지 리스트
	List<IClassVO> userlikelist(Criteria cri,int userId);

	// 유저의 지난챌린지 리스트
	List<IClassVO> userendlist(int userId);
	
	// 유저의 관심챌린지 갯수
	int likecount(int userId);
	
	// 유저의 지난챌린지 갯수
	int endcount(int userId);

}
