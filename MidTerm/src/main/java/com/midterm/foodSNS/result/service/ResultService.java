package com.midterm.foodSNS.result.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
