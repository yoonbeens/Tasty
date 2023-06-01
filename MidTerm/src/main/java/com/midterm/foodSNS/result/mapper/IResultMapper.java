package com.midterm.foodSNS.result.mapper;

import java.util.List;

import com.midterm.foodSNS.command.MRecipeVO;
import com.midterm.foodSNS.command.MSearchConditionVO;

public interface IResultMapper {

	List<MRecipeVO> recommand(MSearchConditionVO vo);

}
