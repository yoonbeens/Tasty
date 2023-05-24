package com.midterm.foodSNS.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;


import com.midterm.foodSNS.command.MusersVO;
import com.midterm.foodSNS.user.mapper.IUserMapper;

import lombok.extern.slf4j.Slf4j;


@Service
public class UserService implements IUserService {
	
	@Autowired
	private IUserMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@Override
	public void join(MusersVO vo) {
				BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
				log.info("암호화 하기 전 비밀번호: " + vo.getUserPw());
				
				String securePw = encoder.encode(vo.getUserPw()); 
				log.info("암호화 후 비밀번호: " + securePw);
				vo.setUserPw(securePw); 
				mapper.join(vo); 
	}

	@Override
	public int idCheck(String id) {
		return mapper.idCheck(id); //없으면 0 있으면 1을 리턴
	}

	@Override
	public String login(String id, String pw) {
		String dbPw = mapper.login(id);
		
		if(dbPw != null) {
			if(encoder.matches(pw, dbPw)) return id;
		}		
		return null;
	}

	@Override
	public MusersVO getInfo(MusersVO vo) {
		return mapper.getInfo(vo);
	}

	@Override
	public void updateMusers(MusersVO vo) {
	}

	
	
	
	
	
	
	
	
}
