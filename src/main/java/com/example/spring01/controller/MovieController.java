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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.spring01.model.dao.MovieDAO;
import com.example.spring01.model.dto.MovieDTO;
import com.example.spring01.service.MemberService;
import com.example.spring01.service.MovieService;

@Controller
public class MovieController {
	private static final Logger logger = LoggerFactory.getLogger(MovieController.class);
	@Inject
	MemberService memberService;

	@Autowired
	MovieService movieService;
	
	@Autowired
	MovieDAO movieDao;


	@ResponseBody
	@RequestMapping("movie/test.do")
	public Map<String, Object> movie(HttpServletRequest request, HttpServletResponse response, Model model) {
		logger.info("¼º°ø");
		List<String> imgurl = movieService.search();
//		model.addAttribute("imgurl", movieService.search(request));
		Map<String, Object> result = new HashMap<>();
//		int i = 1;
//		for(String str : imgurl) {
//			result.put("top"+i, str);
//		}
		result.put("imgurl", imgurl);

		// {"imgurl":"[aaa,bbb,ccc]"}

		return result;
	}

	@RequestMapping("movie/booking.do")
	public String booking_page(Model model) {
		List<String> m_name = movieService.movie_list();
		System.out.println(m_name);
		model.addAttribute("movie", m_name);
		System.out.println(model);
		//model2.addAttribute("s_list",s_list);
		//System.out.print(model2);
		return "movie/booking";
	}
	
	@RequestMapping("movie/s_movie.do")
	public String s_movie(HttpServletRequest request, @RequestParam ("movie") String movie) {
//		List<MovieDTO> s_list = movieService.movieList();
//		System.out.println(s_list);
//		model.addAttribute("s_list", s_list);
		request.getParameter(movie);
		System.out.println(movie);
		return "movie/booking";
	}
	
	@RequestMapping("movie/selectSeat.do")
	public String select_seat() {
		return "movie/selectSeat";
	}

	@RequestMapping("movie/detail.do")
	public String detail_view() {
		return "movie/detail";
	}
	
	@RequestMapping("movie/last.do")
	public String last_view() {
		return "movie/last";
	}
	// @RequestMapping("movie/insert.do")
	// public String insert (@ModelAttribute MovieDTO dto) {

//	}

}
