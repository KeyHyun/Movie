package com.example.spring01.service;

import javax.servlet.http.HttpServletRequest;

import com.example.spring01.model.dto.MovieDTO;

public interface MovieAPIService {
	
	public String search (String movieNm,String startDt) ;
}
