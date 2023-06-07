package com.midterm.foodSNS.command;

import java.time.LocalDateTime;



import org.springframework.stereotype.Service;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MshortsVO {
	
	private String userId;
	private String uploadPath;
	private String fileLoca;
	private String fileName;
	private String fileRealName;


}
