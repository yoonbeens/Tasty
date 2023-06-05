package com.midterm.foodSNS.like.mapper;

import com.midterm.foodSNS.command.LikeVO;

public interface ILikeMapper {

	//좋아요 수 가져오기
	int getLike(int cooknum);

	//좋아요 이미 했는지 확인
	int chkLike(LikeVO vo);

	//좋아요 추가
	void insertLike(LikeVO vo);

	//좋아요 삭제
	void deleteLike(LikeVO vo);

	//게시글 좋아요수
	int faLike(int faNum);
	
	//게시글 좋아요 추가
	void insertFaLike(LikeVO vo);

	//유저레시피 좋아요수
	int urLike(int bno);
	
	//유저레시피 좋아요수
	void insertUrLike(LikeVO vo);
	
}
