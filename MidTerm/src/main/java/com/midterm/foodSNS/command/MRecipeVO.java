package com.midterm.foodSNS.command;
/*
 * 
 * CREATE TABLE MRecipe(
	rno INT primary key auto_increment,
    update_date datetime default Null ,
    title varchar(300) NOT null,
    writer varchar(50) not null,
    ingredient varchar(3000) not null,
    recipe varchar(5000) not null,
    reg_date datetime default current_timestamp, 
    like_num int default 0
);
 * */

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MRecipeVO {
	
	private int cooknum;
	
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
	
	//조건
	private String weather;
	private String condition2;
	private String feeling;
	
	//요리 시간
	private int cookTime;
	

}
