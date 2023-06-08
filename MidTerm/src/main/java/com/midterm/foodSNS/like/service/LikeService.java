package com.midterm.foodSNS.like.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.midterm.foodSNS.command.LikeVO;
import com.midterm.foodSNS.like.mapper.ILikeMapper;

@Service
public class LikeService implements ILikeService {
	
	@Autowired
	private ILikeMapper mapper;

	@Override
	public int getLike(int cooknum) {
		return mapper.getLike(cooknum);
	}
	
	@Override
	public LikeVO updateLike(int cooknum, LikeVO vo) {
		vo.setCooknum(cooknum);
		if(mapper.chkLike(vo) == 1) {
			mapper.deleteLike(vo);
			vo.setUserId("1");
			return vo;
		} else {
			mapper.insertLike(vo); 
			vo.setUserId("0");
			return vo;
		}
	}

	@Override
	public int faLike(int faNum) {
		return mapper.faLike(faNum);
	}

	@Override
	public LikeVO updateFaLike(int faNum, LikeVO vo) {
		vo.setFaNum(faNum);
		if(mapper.chkLike(vo) == 1) {
			mapper.deleteLike(vo);
			vo.setUserId("1");
			return vo;
		} else {
			mapper.insertFaLike(vo);
			vo.setUserId("0");
			return vo;
		}
	}

	@Override
	public int urLike(int bno) {
		return mapper.urLike(bno);
	}

	@Override
	public LikeVO updateUrLike(int bno, LikeVO vo) {
		vo.setBno(bno);
		if(mapper.chkLike(vo) == 1) {
			mapper.deleteLike(vo); 
			vo.setUserId("1");
			return vo;
		} else {
			mapper.insertUrLike(vo);
			vo.setUserId("0");
			return vo;
		}
	}


}
