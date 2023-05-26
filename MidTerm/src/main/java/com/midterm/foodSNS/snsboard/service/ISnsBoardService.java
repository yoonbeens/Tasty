package com.midterm.foodSNS.snsboard.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.midterm.foodSNS.command.MSnsBoardVO;
import com.midterm.foodSNS.util.PageVO;

public interface ISnsBoardService {

	//글 등록
	void insert(MSnsBoardVO vo, MultipartFile file);
	
	//글 목록
	List<MSnsBoardVO> getList(PageVO vo);
	
	//상세 보기
	MSnsBoardVO getDetail(int bno);
	
	//글 삭제
	void delete(int bno);
	
}
