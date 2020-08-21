package com.example.spring01.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.example.spring01.model.dto.BookingDTO;
import com.example.spring01.model.dto.MemberDTO;

public interface MemberService {
	public List<MemberDTO> memberList();
	public void insertMember(MemberDTO vo);
	public MemberDTO viewMember(String userid);
	public void deleteMember(String userid);
	public void updateMember(MemberDTO vo);
	public boolean checkPw(String userid, String passwd);
	public String loginCheck(MemberDTO dto, HttpSession session);
	public void logout(HttpSession session);
}
