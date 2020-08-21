package com.example.spring01.service;

import java.util.List;

import com.example.spring01.model.dto.BookingDTO;
import com.example.spring01.model.dto.MovieDTO;

public interface MovieService {

	public void insertMovie(BookingDTO vo);

	public List<String> search();

	public List<String> movie_list();

	public List<MovieDTO> movieList(String movie);

	public List<BookingDTO> bookingList(BookingDTO vo);
}
