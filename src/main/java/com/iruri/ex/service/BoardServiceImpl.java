package com.iruri.ex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iruri.ex.mapper.BoardMapper;
import com.iruri.ex.mapper.IClassMapper;
import com.iruri.ex.vo.BoardVO;
import com.iruri.ex.vo.IClassVO;
import com.iruri.ex.vo.IUserVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class BoardServiceImpl implements BoardService {
    
    @Autowired
    private BoardMapper boardMapper;
    
    
    // 내가 쓴 총 보드의 갯수 
    @Override
    public int boardcount(int userId) {

        int vo = boardMapper.boardcount(userId);

        return vo;
    }
    
    
    // 내가 쓴 인증글의 갯수 
    @Override
    public int boardconfirmcount(int userId) {

        int vo = boardMapper.boardconfirmcount(userId);

        return vo;
    }
    
    // 내가 쓴 게시글의 갯수 
    @Override
    public int myboardcount(int userId) {

        int vo = boardMapper.myboardcount(userId);

        return vo;
    }
    
    // 내가 쓴 댓글의 갯수 
    @Override
    public int commentcount(int userId) {

        int vo = boardMapper.commentcount(userId);

        return vo;
    }

	/*
	 * // 내가 쓴 인증글 list public List<BoardVO> boardconfirmList(int userId){
	 * List<BoardVO> vo = boardMapper.boardconfirmList(userId); if(vo == null) {
	 * return null; } return vo; }
	 * 
	 * // 내가 쓴 게시글 list public List<BoardVO> myboardList(int userId){ List<BoardVO>
	 * vo = boardMapper.myboardList(userId); if(vo == null) { return null; } return
	 * vo; }
	 */
    
    // 내가 쓴 댓글 list
    public List<BoardVO> commentList(int userId){
    	List<BoardVO> vo = boardMapper.commentList(userId);
    	if(vo == null) {
    		return null;
    	}
    	return vo;
    }
    



}
