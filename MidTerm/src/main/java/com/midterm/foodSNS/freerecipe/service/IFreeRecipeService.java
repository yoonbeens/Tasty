package com.midterm.foodSNS.freerecipe.service;

import java.util.List;
import java.util.Map;

import com.midterm.foodSNS.command.MfreeboardVO;

public interface IFreeRecipeService {

	//개인레시피등록
	void uploadRecipe(MfreeboardVO vo);

	//레시피 상세보기
	MfreeboardVO getRecipe(int bno);

	//레시피 목록보기
	List<MfreeboardVO> getRecipeList(String userId);

	//레시피 삭제
	void deleteR(int rebno);



	
	//레시피 검색
	List<MfreeboardVO> searchRecipe(String query);

	void modiUploadRecipe(MfreeboardVO vo);

	List<MfreeboardVO> searchUserRecipe(String query);

}
