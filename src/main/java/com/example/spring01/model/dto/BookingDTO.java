package com.example.spring01.model.dto;

public class BookingDTO {
	private String b_movie;
	private String b_branch;
	private String b_time;
	private String b_seat;
	private String b_user;

	public String getB_user() {
		return b_user;
	}

	public void setB_user(String b_user) {
		this.b_user = b_user;
	}

	public String getB_movie() {
		return b_movie;
	}

	public void setB_movie(String b_movie) {
		this.b_movie = b_movie;
	}

	public String getB_branch() {
		return b_branch;
	}

	public void setB_branch(String b_branch) {
		this.b_branch = b_branch;
	}

	public String getB_time() {
		return b_time;
	}

	public void setB_time(String b_time) {
		this.b_time = b_time;
	}

	public String getB_seat() {
		return b_seat;
	}

	public void setB_seat(String b_seat) {
		this.b_seat = b_seat;
	}

	public BookingDTO() {

		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "BookingDTO [b_movie=" + b_movie + ", b_branch=" + b_branch + ", b_time=" + b_time + ", b_seat=" + b_seat
				+ ", b_user=" + b_user + "]";
	}

}
