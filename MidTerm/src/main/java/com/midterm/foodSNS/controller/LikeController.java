package com.midterm.foodSNS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.midterm.foodSNS.command.LikeVO;
import com.midterm.foodSNS.command.MRecipeVO;
import com.midterm.foodSNS.like.service.ILikeService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/like")
@RestController
public class LikeController {

	@Autowired
	private ILikeService service;
	
	@GetMapping("/recipe/{cooknum}")
	@ResponseBody
	public int getLike(@PathVariable int cooknum) {
		log.info("레시피 번호: "+cooknum);
		log.info("좋아요 수" + service.getLike(cooknum));
		return service.getLike(cooknum);
	}
	
	@PutMapping("/recipe/{cooknum}")
	@ResponseBody
	public LikeVO updateLike(@PathVariable int cooknum, @RequestBody LikeVO vo) {
		service.updateLike(cooknum, vo);
		log.info("유저 좋아요?:" + vo.getUserId());
		return vo;
	}
	
	@GetMapping("/faNum/{faNum}")
	@ResponseBody
	public int faLike(@PathVariable int faNum) {
		log.info("게시글 번호: "+faNum);
		log.info("좋아요 수" + service.faLike(faNum));
		return service.faLike(faNum);
	}
	
	@PutMapping("/faNum/{faNum}")
	@ResponseBody
	public LikeVO updateFaLike(@PathVariable int faNum, @RequestBody LikeVO vo) {
		service.updateFaLike(faNum, vo);
		log.info("유저 좋아요?:" + vo.getUserId());
		return vo;
	}
	
	@GetMapping("/bno/{bno}")
	@ResponseBody
	public int urLike(@PathVariable int bno) {
		log.info("유저레시피 번호: "+bno);
		log.info("좋아요 수" + service.urLike(bno));
		return service.urLike(bno);
	}
	
	@PutMapping("/bno/{bno}")
	@ResponseBody
	public LikeVO updateUrLike(@PathVariable int bno, @RequestBody LikeVO vo) {
		service.updateUrLike(bno, vo);
		log.info("유저 좋아요?:" + vo.getUserId());
		return vo;
	}
	
}
