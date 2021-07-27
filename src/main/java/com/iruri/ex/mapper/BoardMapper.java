
package com.iruri.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.iruri.ex.vo.BoardVO;
import com.iruri.ex.vo.IClassVO;
import com.iruri.ex.vo.IUserVO;

@Mapper
public interface BoardMapper {

	// 내가 작성했던 보드의 총 갯수 
    int boardcount(int userId);
    
    // 내가 작성했던 인증글의 총 갯수
    int boardconfirmcount(int userId);
    
    // 내가 작성했던 게시글의 총 갯수
    int myboardcount(int userId);
    
    // 내가 작성했던 댓글의 총 갯수
    int commentcount(int userId);
    
    // 내가 작성한 인증글 list
    List<BoardVO> boardconfirmList(int userId);

    // 내가 작성한 게시글 list
    List<BoardVO> myboardList(int userId);
    
    // 내가 작성한 댓글 list
    List<BoardVO> commentList(int userId);

}
