package com.example.spring01.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.spring01.model.dto.BookingDTO;
import com.example.spring01.model.dto.MemberDTO;
import com.example.spring01.service.MemberService;
import com.example.spring01.service.MovieService;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Inject
	MemberService memberService;
	@Inject
	MovieService movieService;

	// 회원 가입을 위한 write page 이동
	@RequestMapping("member/write.do")
	public String write() {
		return "member/write";
	}

	@RequestMapping("member/insert.do")
	public String insert(@ModelAttribute MemberDTO dto) {
		memberService.insertMember(dto);
		return "redirect:home";
	}

	// 로그인을 위한 login page로 이동
	@RequestMapping("member/login.do")
	public String login() {
		return "member/login";
	}

	@RequestMapping("member/login_check.do")
	public ModelAndView login_check(@ModelAttribute MemberDTO dto, HttpSession session) {
		String name = memberService.loginCheck(dto, session);
		logger.info("name:" + name);
		ModelAndView mav = new ModelAndView();
		if (name != null) {
			mav.setViewName("member/home");
		} else {
			mav.setViewName("member/login");
			mav.addObject("message", "error");
		}
		return mav;
	}

	@RequestMapping("member/logout.do")
	public ModelAndView logout(HttpSession session, ModelAndView mav) {

		memberService.logout(session);
		mav.setViewName("member/home");
		mav.addObject("message", "logout");
		return mav;
	}

}
