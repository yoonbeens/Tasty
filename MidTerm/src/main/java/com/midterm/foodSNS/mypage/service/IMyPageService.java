package com.midterm.foodSNS.mypage.service;

import java.util.List;

import com.midterm.foodSNS.command.MfreeboardArticleVO;
import com.midterm.foodSNS.command.MfreeboardImgVO;

public interface IMyPageService {
	
	List<MfreeboardArticleVO> getArticleList(String userId);

	List<MfreeboardImgVO> getImgList(String userId);

}
