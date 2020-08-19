package com.example.spring01.service;

import java.util.List;


import com.example.spring01.model.dto.MovieDTO;

public interface MovieService {
	
	public void insertMovie (MovieDTO vo);
	public List<String> search () ;
	public List<String> movie_list();
}
