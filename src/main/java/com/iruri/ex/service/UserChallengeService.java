package com.iruri.ex.service;

import java.util.List;

import com.iruri.ex.page.Criteria;
import com.iruri.ex.vo.IClassVO;
import com.iruri.ex.vo.IUserVO;

public interface UserChallengeService {
	
	// 유저가 참여하는 챌린지 갯수
	 int challengecount(int UserId);

	// 유저의 챌린지리스트
	List<IClassVO> userchallengelist(int userId);

	// 유저의 관심챌린지 리스트
	List<IClassVO> userlikelist(Criteria cri,int userId);
	
	// 유저의 관심챌린지 갯수
	int likecount(int userId);
	
	// 유저의 지난챌린지 갯수
	int endcount(int userId);

	int userlikecount(int userId);

	int userendcount(int userId);

	List<IClassVO> userendlist(Criteria cri, int userId);
	
	
	
	// 유저 클래스 //
	
	int classcount(int userId);

	int classlikecount(int userId);

	int classendcount(int userId);

	List<IClassVO> userclasslist(int userId);

	List<IClassVO> userclasslikelist_kind(int userId);

	List<IClassVO> userclasslikelist(Criteria cri, int userId);

	int class_likecount(int userId);

	List<IClassVO> userclasslikelist_date(int userId);

	int class_endcount(int userId);

	List<IClassVO> userclassendlist(Criteria cri, int userId);

	List<IClassVO> userclassendlist_kind(int userId);

	List<IClassVO> userclassendlist_date(int userId);
	
	
	// 챌린지 삭제
	void challenge_delete(int userId, int classId);

}
