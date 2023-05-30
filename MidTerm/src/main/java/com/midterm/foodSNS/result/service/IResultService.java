package com.midterm.foodSNS.result.service;

import java.util.List;

import com.midterm.foodSNS.command.MRecipeVO;
import com.midterm.foodSNS.command.MSearchConditionVO;

public interface IResultService {
	
	//추천결과보여주기
	List<MRecipeVO> recommand(MSearchConditionVO vo);

	

}
