package com.my.spring.mapper;

import java.util.List;

import com.my.spring.domain.BoardVO;

public interface BoardMapper {
	
	// viewAll : 매퍼파일의 id값과 매칭하기 위함
	public List<BoardVO> viewAll();
	
}
