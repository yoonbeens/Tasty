package com.midterm.foodSNS.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String uploadRecipe(MfreeboardVO vo) {
		log.info("vo: " + vo.toString());
		service.uploadRecipe(vo);
		log.info("sdf: ");
		return "redirect:/userrecipe/recipeList";
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

		model.addAttribute("article",articleList);
		return "/userrecipe/recipeList";	
	}
	
	//레세피 글 상세보기
	@GetMapping("/recipeDetail/{bno}")
	@ResponseBody
	public MfreeboardVO getRecipe(@PathVariable("bno") int bno) {
		return service.getRecipe(bno);
	}
}
