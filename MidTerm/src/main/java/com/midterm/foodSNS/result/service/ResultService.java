package com.midterm.foodSNS.result.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.midterm.foodSNS.command.LikeVO;
import com.midterm.foodSNS.command.MRecipeVO;
import com.midterm.foodSNS.command.MSearchConditionVO;
import com.midterm.foodSNS.result.mapper.IResultMapper;

@Service
public class ResultService implements IResultService {
	
	@Autowired
	private IResultMapper mapper;
	


	@Override
	public List<MRecipeVO> recommand(MSearchConditionVO vo) {
				
		return mapper.recommand(vo);
	}
	
	@Override
	public MRecipeVO recipeDetail(int cooknum) {
		return mapper.recipeDetail(cooknum);
		 
	}
	
	@Override
	public LikeVO getLike(int cooknum) {
		return mapper.getLike(cooknum);
	}
	
	@Override
	public LikeVO updateLike(int cooknum, LikeVO vo) {
		if(mapper.chkLike(vo) == 1) {
			vo.setLikenum(vo.getLikenum() -1); //좋아요를 누른 상태라면 취소
			mapper.updateLike(vo); 
		} else {
			vo.setLikenum(vo.getLikenum() +1); //좋아요를 누르지 않은 상태면 좋아요+1
			mapper.updateLike(vo); 
		}
		return null;
	}

}
