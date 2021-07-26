
package com.iruri.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.iruri.ex.page.Criteria;
import com.iruri.ex.vo.IClassVO;
import com.iruri.ex.vo.IUserVO;

@Mapper
public interface IClassMapper {
    
   
    
    // 6. 메퍼에서 메소드를 만든다 servicelImpl에서받는 메소드이다.
    List<IClassVO> selectAll(int userId);
    
    int classcount(int userId);
    
    //챌린지 개설 폼
    void insertChallenge(IClassVO iClassVO);
    
    //챌린지 메인 리스트
    List<IClassVO> ChallengeSelectAll();

    
    //챌린지 메인 페이징처리
    public List<IClassVO> getListWithPaging(Criteria criteria);
    public int getTotalCount(Criteria cri);
}
