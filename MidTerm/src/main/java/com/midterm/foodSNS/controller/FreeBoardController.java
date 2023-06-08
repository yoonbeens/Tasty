package com.midterm.foodSNS.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.midterm.foodSNS.command.MfreeboardArticleVO;
import com.midterm.foodSNS.command.MfreeboardImgVO;
import com.midterm.foodSNS.command.MshortsVO;
import com.midterm.foodSNS.freeboard.service.IFreeBoardService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/freeboard")
@Slf4j
public class FreeBoardController {
	
	@Autowired
	private IFreeBoardService service;
	
	@GetMapping("/shortRegist/{userId}")
	public String shortRegist(@PathVariable String userId,Model model) {
		log.info(userId);
		model.addAttribute("user",userId);
		return "freeboard/shortRegist";	
	}
	
	//쇼츠처리
	@PostMapping("/shortRegist2")
	public String shortRegist2(@RequestParam("file")List<MultipartFile> file,String userId,MshortsVO ivo) {
		ivo.setUserId(userId);
		service.registVideo(ivo,file);
		return "redirect:/mypage/mypageResult";	
	}
	
	@ResponseBody
	@GetMapping("/shortGet/{userId}")
	public List<MshortsVO>  shortGet(@PathVariable String userId, MshortsVO svo,Model model) {
		List<MshortsVO> listSvo = new ArrayList<>();
		listSvo= service.getVideo(userId);			
		return listSvo;	
	}
	
	//등록페이지이동
	@GetMapping("/regist")
	public String regist() {
		return "freeboard/regist";	
	}
	
	//유저 게시물(+이미지들) 등록저장처리
	@PostMapping("/regist")
	public String profile(@RequestParam("file")List<MultipartFile> file,MfreeboardArticleVO avo,MfreeboardImgVO ivo) {	
		service.registArticle(avo);
		service.registImg(ivo,file);		
		return "redirect:/mypage/mypageResult";
	}
	
	//비동기클릭시글찾아오기
	@ResponseBody
	@GetMapping("/getArticle/{faNum}")
	public MfreeboardArticleVO getArticle(@PathVariable int faNum){
		return service.getArticle(faNum);		
	}
	
	@ResponseBody
	@GetMapping("/getCarousel/{faNum}")
	public List<MfreeboardImgVO> getCarousel(@PathVariable int faNum){
		return 	service.getCarousel(faNum);
	}
	
	@ResponseBody
	@DeleteMapping("/delete/{faNum}")
	public void delete(@PathVariable int faNum){
		 service.delete(faNum);		 
	}
	
	

	@GetMapping("/modify/{faNum}")
	public String modify(@PathVariable int faNum, Model model){
		MfreeboardArticleVO avo = service.getArticle(faNum);
		List<MfreeboardImgVO> ivo = service.getCarousel(faNum);
		model.addAttribute("avo",avo);
		model.addAttribute("ivo",ivo);		
		 return "freeboard/modify";
	}
	
	@ResponseBody
	@PutMapping("/modify/{faNum}")
	public String modify(@PathVariable int faNum, @RequestBody Map<String,String> map2){

		
		Map<String, Object> map = new HashMap<>();
		map.put("faNum", faNum); 
		map.put("content", map2.get("moditext")); 
		
		service.update(map);
		
		 return "redirect:/mypage/mypageResult";
	}
	
	
	
	

}