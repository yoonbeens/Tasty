package com.midterm.foodSNS.mypage.mapper;

import java.util.List;

import com.midterm.foodSNS.command.MfreeboardArticleVO;
import com.midterm.foodSNS.command.MfreeboardImgVO;

public interface IMyPageMapper {
	
	List<MfreeboardArticleVO> getArticleList(String userId);
	
	List<MfreeboardImgVO> getImgList(String userId);
}
