package com.example.spring01.model.dao;

import java.util.List;

import com.example.spring01.model.dto.BookingDTO;
import com.example.spring01.model.dto.MovieDTO;

public interface MovieDAO {
	
	public List<MovieDTO> movieList(String movie);
	public void insertMovie (BookingDTO vo);
	public List<BookingDTO> bookingList(BookingDTO vo);

}
