package com.midterm.foodSNS.freerecipe.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.midterm.foodSNS.command.MfreeboardVO;
import com.midterm.foodSNS.freerecipe.mapper.IFreeRecipeMapper;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class FreeRecipeService implements IFreeRecipeService {

	@Autowired
	private IFreeRecipeMapper mapper;
	
	@Override
	public void uploadRecipe(MfreeboardVO vo) {
		log.info("writer: " + vo.getWriter());
		mapper.uploadRecipe(vo);

	}

	@Override
	public MfreeboardVO getRecipe(int bno) {
		return mapper.getRecipe(bno);
	}

	@Override
	public List<MfreeboardVO> getRecipeList(String userId) {
		return mapper.getRecipeList(userId);
	}

	@Override
	public void delete(int bno) {
		// TODO Auto-generated method stub

	}

	@Override
	public void update(Map<String, Object> map) {
		// TODO Auto-generated method stub

	}
	
	//레시피 검색
	@Override
	public List<MfreeboardVO> searchRecipe(String query) {
	    return mapper.searchRecipe(query);
	}

}
