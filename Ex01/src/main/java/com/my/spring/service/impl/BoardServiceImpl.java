package com.my.spring.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.spring.domain.BoardVO;
import com.my.spring.mapper.BoardMapper;
import com.my.spring.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired 
	private BoardMapper mapper;
	
	@Override
	public List<BoardVO> viewAll() {
		// TODO Auto-generated method stub
		return mapper.viewAll();
	}
	

}
