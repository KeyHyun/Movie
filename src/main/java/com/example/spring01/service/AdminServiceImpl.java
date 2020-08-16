package com.example.spring01.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.spring01.model.dao.AdminDAO;
import com.example.spring01.model.dto.MemberDTO;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	
	AdminDAO adminDao;
	
	@Override
	public String loginCheck(MemberDTO dto) {
		// TODO Auto-generated method stub
		return adminDao.loginCheck(dto);
	}

}
