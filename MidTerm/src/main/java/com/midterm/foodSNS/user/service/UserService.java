package com.midterm.foodSNS.user.service;

import org.springframework.stereotype.Service;

import com.midterm.foodSNS.command.MusersVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class UserService implements IUserService {
	
	@Override
	public void join(MusersVO vo) {
	}

	@Override
	public int idCheck(String id) {
		return 0;
	}

	@Override
	public String login(String id, String pw) {
		return null;
	}

	@Override
	public MusersVO getInfo(MusersVO vo) {
		return null;
	}

	@Override
	public void updateMusers(MusersVO vo) {
	}

	
	
	
	
	
	
	
	
}
