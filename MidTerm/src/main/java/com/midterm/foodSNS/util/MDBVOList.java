package com.midterm.foodSNS.util;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class MDBVOList {

	private String foodname; //요리제목
	private String titleimg; //대표이미지
	private String ingredient; //필요재료
	private String tip; //음식팁

	//조리 설명

	private String text1;
	private String text2;
	private String text3;
	private String text4;


	//조리이미지
	private String img1;
	private String img2;
	private String img3;
	private String img4;
	


}





















