package com.example.spring01.model.dto;

public class MovieDTO {
	
	private int m_id;
	private String m_name;
	private String m_open;
	private String m_rank;
	private String m_time;
	private String m_nation;
	private String m_genre;
	private String m_director;
	private String m_actors;
	private String m_grade;
	private String m_content;
	
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_open() {
		return m_open;
	}
	public void setM_open(String m_open) {
		this.m_open = m_open;
	}
	public String getM_rank() {
		return m_rank;
	}
	public void setM_rank(String m_rank) {
		this.m_rank = m_rank;
	}
	public String getM_time() {
		return m_time;
	}
	public void setM_time(String m_time) {
		this.m_time = m_time;
	}
	public String getM_nation() {
		return m_nation;
	}
	public void setM_nation(String m_nation) {
		this.m_nation = m_nation;
	}
	public String getM_genre() {
		return m_genre;
	}
	public void setM_genre(String m_genre) {
		this.m_genre = m_genre;
	}
	public String getM_director() {
		return m_director;
	}
	public void setM_director(String m_director) {
		this.m_director = m_director;
	}
	public String getM_actors() {
		return m_actors;
	}
	public void setM_actors(String m_actors) {
		this.m_actors = m_actors;
	}
	public String getM_grade() {
		return m_grade;
	}
	public void setM_grade(String m_grade) {
		this.m_grade = m_grade;
	}
	public String getM_content() {
		return m_content;
	}
	public void setM_content(String m_content) {
		this.m_content = m_content;
	}
	public MovieDTO() {
		
	}
	@Override
	public String toString() {
		return "MovieDTO [m_id=" + m_id + ", m_name=" + m_name + ", m_open=" + m_open + ", m_rank=" + m_rank
				+ ", m_time=" + m_time + ", m_nation=" + m_nation + ", m_genre=" + m_genre + ", m_director="
				+ m_director + ", m_actors=" + m_actors + ", m_grade=" + m_grade + ", m_content=" + m_content + "]";
	}
	
}
