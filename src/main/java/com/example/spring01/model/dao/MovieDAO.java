package com.example.spring01.model.dao;

import java.util.List;

import com.example.spring01.model.dto.MovieDTO;

public interface MovieDAO {
	
	public List<MovieDTO> movieList();
	public void insertMovie (MovieDTO vo);
	public void insertMovie(String string);

}
