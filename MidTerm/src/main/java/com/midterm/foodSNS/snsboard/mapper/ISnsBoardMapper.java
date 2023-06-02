package com.midterm.foodSNS.snsboard.mapper;

import java.util.List;

import com.midterm.foodSNS.command.MSnsBoardVO;
import com.midterm.foodSNS.util.PageVO;

public interface ISnsBoardMapper {

	//글 등록
	void insert(MSnsBoardVO vo);
	
	//글 목록
	List<MSnsBoardVO> getList(PageVO vo);
	
	//상세 보기
	MSnsBoardVO getDetail(int bno);
	
	//글 삭제
	void delete(int bno);
	
}
