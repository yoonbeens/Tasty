package com.midterm.foodSNS.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.midterm.foodSNS.command.MSearchConditionVO;
import com.midterm.foodSNS.command.MfreeboardVO;
import com.midterm.foodSNS.command.MusersVO;
import com.midterm.foodSNS.freerecipe.service.IFreeRecipeService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/userrecipe")
@Slf4j
public class FreeRecipeController {

	@Autowired
	private IFreeRecipeService service;

	//레시피 등록 페이지로
	@GetMapping("/uploadRecipe")
	public void uploadRecipe() {}

	//레시피 글 등록
	@PostMapping("/uploadRecipe")
	public String uploadRecipe(String weather, String condition2, String feeling, MfreeboardVO vo) {
		System.out.println("eeeeeeeeee"+weather);
		vo.setWeather(weather);
		vo.setCondition2(condition2);
		vo.setFeeling(feeling);
		service.uploadRecipe(vo);
	
		return "redirect:/mypage/mypageResult";
	}

	//레시피 수정 페이지로
	@GetMapping("/modifyRecipe/{bno}")
	public String modifyRecipeRecipe(@PathVariable("bno") int bno, Model model) {
		model.addAttribute("modify",service.getRecipe(bno));
		log.info("제대로 오나: " + service.getRecipe(bno));
		return "/userrecipe/modifyRecipe";

	}

	//레시피 수정 처리
	@PostMapping("/modiUploadRecipe")
	public String modiUploadRecipe(MfreeboardVO vo) {

		service.modiUploadRecipe(vo);

		return "redirect:/mypage/mypageResult";
	}

	@DeleteMapping("/deleteR/{bno}")
	@ResponseBody
	public void deleteR(@PathVariable("bno") int bno) {
		 service.deleteR(bno);
	}



	//레시피 글 목록
	@GetMapping("/recipeList")
	public String recipeList(HttpServletRequest request, Model model) {	
		HttpSession session = request.getSession();
		MusersVO vo = (MusersVO) session.getAttribute("login");
		log.info("vo: " + vo);
		log.info("session: " + session);

		List<MfreeboardVO> articleList = new ArrayList<>();		
		articleList = service.getRecipeList(vo.getUserId());

		log.info("articleList: " + articleList);			

		model.addAttribute("recipe",articleList);
		return "/mypage/mypageResult";	
	}

	//레세피 글 상세보기
	@GetMapping("/recipeDetail/{bno}")
	@ResponseBody
	public MfreeboardVO getRecipe(@PathVariable("bno") int bno) {
		return service.getRecipe(bno);
	}
	
	@GetMapping("/search")
	public void search() {}
	
	// 레시피 검색
	@PostMapping("/search")
	public String searchRecipe(@RequestParam("query") String query, Model model) {
	    List<MfreeboardVO> recipe = service.searchRecipe(query);
	    
		List<MfreeboardVO> userRecipe =new ArrayList<>();
		userRecipe = service.searchUserRecipe(query);

	    
	    MSearchConditionVO vo = new MSearchConditionVO();
	    vo.setWeather("날씨");
	    vo.setCondition2("상태");
	    vo.setFeeling("기분");
	    
	    model.addAttribute("searchCondition", vo);
	    model.addAttribute("query", query);
	    model.addAttribute("recipe", recipe);
	    model.addAttribute("userRecipe", userRecipe);
	    return "/result/mainResult"; // 검색 결과를 보여주는 뷰 페이지로 이동
	}
	
	
	
	
	
	
	
	
	
	
}
