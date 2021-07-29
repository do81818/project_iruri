package com.iruri.ex.service;

import java.util.List;

import com.iruri.ex.vo.BoardVO;
import com.iruri.ex.vo.IClassVO;

public interface BoardService {
    
	// 내가 작성했던 보드의 총 갯수 
    int boardcount(int userId);
    
    // 내가 작성한 인증글의 총 갯수
    int boardconfirmcount(int userId);
    
    // 내가 작성한 게시글글의 총 갯수
    int myboardcount(int userId);
    
    // 내가 작성한 댓글의 총 갯수
    int commentcount(int userId);
    
	/*
	 * // 내가 작성한 인증글 list List<BoardVO> boardconfirmList(int userId);
	 * 
	 * // 내가 작성한 게시글 list List<BoardVO> myboardList(int userId);
	 */
    // 내가 작성한 댓글 list
    List<BoardVO> commentList(int userId);
}
