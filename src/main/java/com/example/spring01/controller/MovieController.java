package com.example.spring01.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.spring01.service.MemberService;
import com.example.spring01.service.MovieService;

@Controller
public class MovieController {
	private static final Logger logger=
			LoggerFactory.getLogger(MemberController.class);
	@Inject
	MemberService memberService;
	
	@Autowired
	MovieService movieService;
	@RequestMapping("movie/copy.do")
	public String moviecopy () {
		logger.info("����");
		return "movie/copy";
	}
	
	
	@ResponseBody
	@RequestMapping("movie/test.do")
	public Map<String,Object> movie (HttpServletRequest request, HttpServletResponse response, Model model) {
		logger.info("����");
		List<String> imgurl = movieService.search();
//		model.addAttribute("imgurl", movieService.search(request));
		Map<String,Object> result = new HashMap<>();
//		int i = 1;
//		for(String str : imgurl) {
//			result.put("top"+i, str);
//		}
		result.put("imgurl", imgurl);
		
		//{"imgurl":"[aaa,bbb,ccc]"}
	
		return result;
	}
	//@RequestMapping("movie/insert.do")
	//public String insert (@ModelAttribute MovieDTO dto) {
		
//	}
	
}