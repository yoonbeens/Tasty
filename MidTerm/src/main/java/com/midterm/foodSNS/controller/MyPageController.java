package com.midterm.foodSNS.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.midterm.foodSNS.command.MRecipeVO;
import com.midterm.foodSNS.command.MfreeboardArticleVO;
import com.midterm.foodSNS.command.MfreeboardImgVO;
import com.midterm.foodSNS.command.MfreeboardVO;
import com.midterm.foodSNS.command.MusersVO;
import com.midterm.foodSNS.freerecipe.service.IFreeRecipeService;
import com.midterm.foodSNS.mypage.service.IMyPageService;
import com.midterm.foodSNS.user.service.IUserService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/mypage")
@Slf4j
public class MyPageController {

	@Autowired
	private IMyPageService service;
	
	@Autowired
	private IUserService userService;
	
	@Autowired
	private IFreeRecipeService recipeService;
	

	@GetMapping("/mypageResult")
	public String mypageResult(HttpServletRequest request, Model model) {
				
		HttpSession session = request.getSession();
		MusersVO vo = new MusersVO();
		vo = (MusersVO) session.getAttribute("login");
		
		MusersVO user = new MusersVO();
		user=userService.userInfo(vo.getUserId());	
		
		List<MfreeboardArticleVO> articleList = new ArrayList<>();		
		articleList = service.getArticleList(vo.getUserId());
		
		List<MfreeboardImgVO> imgList = new ArrayList<>();		
		imgList = service.getImgList(vo.getUserId());
		
		List<MusersVO> countFollower =new ArrayList<>();
		countFollower =service.countFollower(vo.getUserId());
		
		List<MusersVO> countFollowing =new ArrayList<>();
		countFollowing =service.countFollowing(vo.getUserId());
		
		List<MfreeboardVO> recipeList = new ArrayList<>();		
		recipeList = recipeService.getRecipeList(vo.getUserId());
		
		int k = (int)((Math.random()*498)+1);
		
		MRecipeVO randomRecipe = service.randomRecipe(k);
		
		
		
		for(int i=0; i<countFollower.size();i++) {
			countFollower.get(i).setFileLoca(userService.userInfo(countFollower.get(i).getUserId()).getFileLoca());
			countFollower.get(i).setFileName(userService.userInfo(countFollower.get(i).getUserId()).getFileName());
			countFollower.get(i).setMessage(userService.userInfo(countFollower.get(i).getUserId()).getMessage());	
		}
		
		for(int i=0; i<countFollowing.size();i++) {
			countFollowing.get(i).setFileLoca(userService.userInfo(countFollowing.get(i).getUserId()).getFileLoca());
			countFollowing.get(i).setFileName(userService.userInfo(countFollowing.get(i).getUserId()).getFileName());
			countFollowing.get(i).setMessage(userService.userInfo(countFollowing.get(i).getUserId()).getMessage());	
		}
		
		model.addAttribute("recipe",recipeList);
		model.addAttribute("article",articleList);
		model.addAttribute("img",imgList);
		model.addAttribute("countFollower", countFollower);
		model.addAttribute("countFollowing", countFollowing);
		model.addAttribute("random", randomRecipe);
		model.addAttribute("user",user);
				
	
		
		
		return "mypage/mypageResult";	
	}
	
	@GetMapping("/userResult/{userId}")
	public String userResult(@PathVariable String userId, Model model,Map<String, String> map,HttpServletRequest request) {
		log.info("타겟유저아이디 : "+userId);
		
		HttpSession session = request.getSession();
		MusersVO vo = new MusersVO();
		vo = (MusersVO) session.getAttribute("login");
		
		if(userId.equals(vo.getUserId())) {
			MusersVO user = new MusersVO();
			user=userService.userInfo(userId);		
			List<MfreeboardArticleVO> articleList = new ArrayList<>();	
			articleList = service.getArticleList(userId);		
			List<MfreeboardImgVO> imgList = new ArrayList<>();		
			imgList = service.getImgList(userId);	
			
			map.put("userId", vo.getUserId()); 
			map.put("targetId", userId);		
			
			
			List<MusersVO> countFollower =new ArrayList<>();
			countFollower =service.countFollower(userId);
			
			List<MusersVO> countFollowing =new ArrayList<>();
			countFollowing =service.countFollowing(userId);
			
			List<MfreeboardVO> recipeList = new ArrayList<>();		
			recipeList = recipeService.getRecipeList(userId);
			
			int k = (int)((Math.random()*498)+1);
			
			MRecipeVO randomRecipe = service.randomRecipe(k);
			
			
			for(int i=0; i<countFollower.size();i++) {
				countFollower.get(i).setFileLoca(userService.userInfo(countFollower.get(i).getUserId()).getFileLoca());
				countFollower.get(i).setFileName(userService.userInfo(countFollower.get(i).getUserId()).getFileName());
				countFollower.get(i).setMessage(userService.userInfo(countFollower.get(i).getUserId()).getMessage());	
			}
			
			for(int i=0; i<countFollowing.size();i++) {
				countFollowing.get(i).setFileLoca(userService.userInfo(countFollowing.get(i).getUserId()).getFileLoca());
				countFollowing.get(i).setFileName(userService.userInfo(countFollowing.get(i).getUserId()).getFileName());
				countFollowing.get(i).setMessage(userService.userInfo(countFollowing.get(i).getUserId()).getMessage());	
			}
			
			model.addAttribute("recipe",recipeList);
			model.addAttribute("user",user);		
			model.addAttribute("article",articleList);
			model.addAttribute("img",imgList);
			model.addAttribute("countFollower", countFollower);
			model.addAttribute("countFollowing", countFollowing);
			model.addAttribute("followCheck",service.checkFollowing(map));
			model.addAttribute("random", randomRecipe);
			
			return "mypage/mypageResult";
			
		}else {
		
		MusersVO user = new MusersVO();
		user=userService.userInfo(userId);		
		List<MfreeboardArticleVO> articleList = new ArrayList<>();	
		articleList = service.getArticleList(userId);		
		List<MfreeboardImgVO> imgList = new ArrayList<>();		
		imgList = service.getImgList(userId);	
		
		map.put("userId", vo.getUserId()); 
		map.put("targetId", userId);		
		
		
		List<MusersVO> countFollower =new ArrayList<>();
		countFollower =service.countFollower(userId);
		
		List<MusersVO> countFollowing =new ArrayList<>();
		countFollowing =service.countFollowing(userId);
		
		List<MfreeboardVO> recipeList = new ArrayList<>();		
		recipeList = recipeService.getRecipeList(userId);
		
		
		for(int i=0; i<countFollower.size();i++) {
			countFollower.get(i).setFileLoca(userService.userInfo(countFollower.get(i).getUserId()).getFileLoca());
			countFollower.get(i).setFileName(userService.userInfo(countFollower.get(i).getUserId()).getFileName());
			countFollower.get(i).setMessage(userService.userInfo(countFollower.get(i).getUserId()).getMessage());	
		}
		
		for(int i=0; i<countFollowing.size();i++) {
			countFollowing.get(i).setFileLoca(userService.userInfo(countFollowing.get(i).getUserId()).getFileLoca());
			countFollowing.get(i).setFileName(userService.userInfo(countFollowing.get(i).getUserId()).getFileName());
			countFollowing.get(i).setMessage(userService.userInfo(countFollowing.get(i).getUserId()).getMessage());	
		}
		
		model.addAttribute("recipe",recipeList);
		model.addAttribute("user",user);		
		model.addAttribute("article",articleList);
		model.addAttribute("img",imgList);
		model.addAttribute("countFollower", countFollower);
		model.addAttribute("countFollowing", countFollowing);
		model.addAttribute("followCheck",service.checkFollowing(map));
		
		
		return "mypage/userResult";
		}
		
	}
	
	@ResponseBody
	@PostMapping("/addFollow/{targetId}")
	public void addFollowing(@PathVariable String targetId,HttpServletRequest request, Map<String, String> map) {
		
		HttpSession session = request.getSession();
		MusersVO vo = new MusersVO();
		vo = (MusersVO) session.getAttribute("login");		
		vo.getUserId();		
		map.put("userId", vo.getUserId()); 
		map.put("targetId", targetId);	
	
		if(service.checkFollowing(map)==0) {
		service.addFollowing(map);
		}else {
			log.info("이미 팔로잉중");
		}
		if(service.checkFollower(map)==0) {
			service.addFollower(map);
		}else {
				log.info("이미 팔로잉중");
		}
		
		
	}
	
	@ResponseBody
	@DeleteMapping("/deleteFollow/{targetId}")
	public void deleteFollowing(@PathVariable String targetId,HttpServletRequest request, Map<String, String> map) {
		
		HttpSession session = request.getSession();
		MusersVO vo = new MusersVO();
		vo = (MusersVO) session.getAttribute("login");		
		vo.getUserId();		
		map.put("userId", vo.getUserId()); 
		map.put("targetId", targetId);		

		if(service.checkFollowing(map)==1) {
		service.deleteFollowing(map);
		}
		
		if(service.checkFollower(map)==1) {
			service.deleteFollower(map);
		}
		
	}
	
	
	

	


}
