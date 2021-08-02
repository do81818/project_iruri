
package com.iruri.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.iruri.ex.page.Criteria;
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

    int classcount(int userId);
    
    List<IClassVO> mainPageChallengeList();
    
    /*
    //챌린지 개설 폼
    void insertChallenge(IClassVO iClassVO);
    
    //챌린지 메인 리스트
    List<IClassVO> ChallengeSelectAll();
    //지난 챌린지 리스트
    List<IClassVO> selectAllEnd_challenge();
    
    //챌린지 메인 페이징처리
    List<IClassVO> getListWithPaging_challenge(Criteria criteria);
    int getTotalCount_challenge(Criteria cri);
    
    //지난 챌린지 
    List<IClassVO> getListWithPaging_challengeEndList(Criteria criteria);
    int getTotalCount_challengeEndList(Criteria cri);
    */
}
