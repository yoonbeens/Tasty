package com.midterm.foodSNS.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;
import com.midterm.foodSNS.user.mapper.IUserMapper;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class DBservice {
	
	@Autowired
	private IUserMapper mapper;	
	
	private String requestUri = "http://openapi.foodsafetykorea.go.kr/api/ff44efcb27354095b86b/COOKRCP01/json/1/1";
	
	public MDBVO getDB() {
		RestTemplate template = new RestTemplate();
		ResponseEntity<MDBVO> responseEntity = template.exchange(
				requestUri,
				HttpMethod.GET,
				null,			
				MDBVO.class
				);
		
		MDBVO responseData = responseEntity.getBody();
		log.info(responseData.getCookrcp01().getRow().get(0).getFoodname());	
		
		
	
		return null;	
	}	
}
