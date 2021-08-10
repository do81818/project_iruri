
package com.iruri.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.iruri.ex.page.Criteria;
import com.iruri.ex.vo.BoardVO;
import com.iruri.ex.vo.IClassVO;
import com.iruri.ex.vo.IUserVO;
import com.iruri.ex.vo.PointVO;

@Mapper
public interface PointMapper {

	// 현재 포인트 
    int savepoint(int userId);
    
    // 적립 예정 포인트
    int appointedpoint(int userId);
    
    // 사용된 포인트
    int usepoint(int userId);
    
    int totalpoint(int userId);
    
    List<PointVO> pointList(@Param("userId") int userId, @Param("criteria") Criteria criteria);
	int total(int userId);
   
}
