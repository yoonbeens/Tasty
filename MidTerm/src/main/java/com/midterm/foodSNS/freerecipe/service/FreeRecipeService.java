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
	public void deleteR(int rebno) {
		mapper.deleteR(rebno);		
	}


	
	//레시피 검색
	@Override
	public List<MfreeboardVO> searchRecipe(String query) {
	    return mapper.searchRecipe(query);
	}

	@Override
	public void modiUploadRecipe(MfreeboardVO vo) {
		log.info("writer: " + vo);
		mapper.modiUploadRecipe(vo);
		
	}

	@Override
	public List<MfreeboardVO> searchUserRecipe(String query) {
		 return mapper.searchUserRecipe(query);
	}

}
