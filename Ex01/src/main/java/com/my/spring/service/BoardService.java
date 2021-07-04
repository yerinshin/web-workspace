package com.my.spring.service;

import java.util.List;

import com.my.spring.domain.BoardVO;

public interface BoardService {
	
	//해당 SQL문을 이용햬 어떠한 기능을 하는가
	public List<BoardVO> viewAll();
	
}
