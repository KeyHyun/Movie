package com.example.spring01.controller;


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

import com.example.spring01.model.dto.MemberDTO;
import com.example.spring01.service.MemberService;

@Controller
public class MemberController {
	private static final Logger logger=
			LoggerFactory.getLogger(MemberController.class);
	@Inject
	MemberService memberService;
	
//	@RequestMapping("member/list.do")
//	public String memberList(Model model) {
//		List<MemberDTO> list=memberService.memberList();
//		model.addAttribute("list",list);
//		return "member/member_list";
//	}
	
	//회원 가입을 위한 write page 이동 
	@RequestMapping("member/write.do")
	public String write() {
		return "member/write";
	}
	//DB에 회원가입 정보 저장 후, 메인 페이지로 이동 (시간 남으면 회원가입 완료 창 + 메인화면 이동 창)
	@RequestMapping("member/insert.do")
	public String insert(@ModelAttribute MemberDTO dto) {
		memberService.insertMember(dto);
		return "redirect:member/home";
	}
	
	//로그인을 위한 login page로 이동
	@RequestMapping("member/login.do")
	public String login() {
		return "member/login";
	}
	
	@RequestMapping("member/login_check.do")
	public ModelAndView login_check(@ModelAttribute MemberDTO dto, HttpSession session) {
		String name=memberService.loginCheck(dto, session);
		logger.info("name:"+name);
		ModelAndView mav=new ModelAndView();
		if(name != null) {
			mav.setViewName("member/home");
		}
		else {
			mav.setViewName("member/login");
			mav.addObject("message","error");
		}
		return mav;
	}
	
	
//	public String logout(HttpSession session) {
//	
//		memberService.logout(session);
//		return "member/home";
//	}
	@RequestMapping("member/logout.do")
	public ModelAndView logout(HttpSession session, ModelAndView mav) {
		
		memberService.logout(session);
		mav.setViewName("member/home");
		mav.addObject("message", "logout");
		return mav;
	}
	
	@RequestMapping("member/view.do")
	public String view(@RequestParam String userid, Model model) {
		model.addAttribute("dto",memberService.viewMember(userid));
		return "member/view";
	}
	
//	@RequestMapping("member/update.do")
//	public String update(@ModelAttribute MemberDTO dto, Model model) {
//		boolean result=memberService.checkPw(
//				dto.getUserid(), dto.getPasswd());
//		logger.info("비밀번호 확인:" + result);
//		
//		if(result) {
//			memberService.updateMember(dto);
//			return "redirect:/member/list.do";
//		}
//		else {
//			MemberDTO dto2=memberService.viewMember(dto.getUserid());
//			model.addAttribute("dto",dto);
//			model.addAttribute("message", "비밀번호가 일치하지 않습니다.");
//			return "member/view";
//		}	
//	}
	

//	
//	@RequestMapping("member/delete.do")
//	public String delete(@RequestParam String userid, @RequestParam String passwd, Model model) {
//		boolean result=memberService.checkPw(userid, passwd);
//		logger.info("비밀번호 확인:" + result);
//		
//		if(result) {
//			memberService.deleteMember(userid);
//			return "redirect:/member/list.do";
//		}
//		else {
//			model.addAttribute("message", "비밀번호가 일치하지 않습니다.");
//			return "member/view";
//		}	
//	}
}
