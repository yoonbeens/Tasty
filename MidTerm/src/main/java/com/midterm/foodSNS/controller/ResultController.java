package com.midterm.foodSNS.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.midterm.foodSNS.command.LikeVO;
import com.midterm.foodSNS.command.MRecipeVO;
import com.midterm.foodSNS.command.MSearchConditionVO;
import com.midterm.foodSNS.command.MfreeboardVO;
import com.midterm.foodSNS.command.MusersVO;
import com.midterm.foodSNS.mypage.service.IMyPageService;
import com.midterm.foodSNS.result.service.IResultService;
import com.midterm.foodSNS.user.service.IUserService;
import com.midterm.foodSNS.util.DBservice;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/result")
@Slf4j
public class ResultController {

	@Autowired
	private IResultService service;

	@Autowired
	private DBservice DBservice;

	@Autowired
	private IMyPageService myservice;

	@Autowired
	private IUserService userService;


	@GetMapping("/mainResult")
	public String resultMainGet (String weather, String condition, String feeling, Model model,
			HttpServletRequest request) {

		HttpSession session = request.getSession();
		MusersVO uvo = new MusersVO();
		uvo = (MusersVO) session.getAttribute("login");
		List<MusersVO> countFollower =new ArrayList<>();
		countFollower =myservice.countFollower(uvo.getUserId());

		List<MusersVO> countFollowing =new ArrayList<>();
		countFollowing =myservice.countFollowing(uvo.getUserId());




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

		MSearchConditionVO vo = new MSearchConditionVO();

		if(weather.equals("Clear")) { weather = "맑음"; } 
		else if(weather.equals("Rain")) { weather = "비"; } 
		else if(weather.equals("Clouds")) { weather = "흐림"; }

		vo.setWeather(weather);
		vo.setCondition2(condition);
		vo.setFeeling(feeling);	
		List<MfreeboardVO> userRecipe =new ArrayList<>();
		userRecipe = service.getuserRecipe(vo);


		model.addAttribute("countFollower", countFollower);
		model.addAttribute("countFollowing", countFollowing);
		model.addAttribute("userRecipe", userRecipe);

		model.addAttribute("searchCondition",vo);		
		model.addAttribute("recipe",service.recommand(vo));		
		return "result/mainResult";	
	}



	//메인 추천 결과 이동
	@PostMapping("/mainResult")
	public String resultMain (String weather, String condition, String feeling, Model model,
			HttpServletRequest request) {

		HttpSession session = request.getSession();
		MusersVO uvo = new MusersVO();
		uvo = (MusersVO) session.getAttribute("login");

		List<MusersVO> countFollower =new ArrayList<>();
		countFollower =myservice.countFollower(uvo.getUserId());

		List<MusersVO> countFollowing =new ArrayList<>();
		countFollowing =myservice.countFollowing(uvo.getUserId());




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

		MSearchConditionVO vo = new MSearchConditionVO();
		if(weather.equals("Clear")) { weather = "맑음"; } 
		else if(weather.equals("Rain")) { weather = "비"; } 
		else if(weather.equals("Clouds")) { weather = "흐림"; } 


		vo.setWeather(weather);
		vo.setCondition2(condition);
		vo.setFeeling(feeling);	
		List<MfreeboardVO> userRecipe =new ArrayList<>();
		userRecipe = service.getuserRecipe(vo);


		model.addAttribute("countFollower", countFollower);
		model.addAttribute("countFollowing", countFollowing);
		model.addAttribute("userRecipe", userRecipe);

		model.addAttribute("searchCondition",vo);		
		model.addAttribute("recipe",service.recommand(vo));		
		return "result/mainResult";	

	}



	@GetMapping("/resultDetail")
	public String resultDetail() {

		return "result/resultDetail";		
	}

	@GetMapping("/getDB")
	public String getDB() {		
		DBservice.getDB();
		return"/home";

	}
	@ResponseBody
	@GetMapping("/getWeather")
	public Map<String, Object> getWeather(Model model) {

		model.addAttribute("weather",DBservice.getWeather()); 



		return DBservice.getWeather();

	}

	@GetMapping("/recipe/{cooknum}")
	@ResponseBody
	public MRecipeVO detail(@PathVariable int cooknum) {
		return service.recipeDetail(cooknum);
	}

}
