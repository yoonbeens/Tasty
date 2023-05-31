package com.midterm.foodSNS.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MSearchConditionVO {
	
	private String weather; 
	private String condition2; 
	private String feeling;
	private String listCodition = "total";

}
