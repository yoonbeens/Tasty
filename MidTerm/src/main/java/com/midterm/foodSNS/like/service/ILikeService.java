package com.midterm.foodSNS.like.service;

import com.midterm.foodSNS.command.LikeVO;

public interface ILikeService {
	
	//좋아요 수 가져오기
	int getLike(int cooknum);

	//좋아요 수 업데이트
	LikeVO updateLike(int cooknum, LikeVO vo);

	//게시판 좋아요수
	int faLike(int faNum);

	//게시판 업데이트
	LikeVO updateFaLike(int faNum, LikeVO vo);
	
	//유저레시피 좋아요수
	int urLike(int bno);

	//유저레시피 업데이트
	LikeVO updateUrLike(int bno, LikeVO vo);

}
