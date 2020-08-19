package com.example.spring01.model.dto;

public class MovieDTO {
	private String s_time;
	private String s_movie;
	private String s_branch;
	public String getS_time() {
		return s_time;
	}
	public void setS_time(String s_time) {
		this.s_time = s_time;
	}
	public String getS_movie() {
		return s_movie;
	}
	public void setS_movie(String s_movie) {
		this.s_movie = s_movie;
	}
	public String getS_branch() {
		return s_branch;
	}
	public void setS_branch(String s_branch) {
		this.s_branch = s_branch;
	}
	public MovieDTO() {
		
	}
	@Override
	public String toString() {
		return "MovieDTO [s_time=" + s_time + ", s_movie=" + s_movie + ", s_branch=" + s_branch + "]";
	}
	
	
	
}
