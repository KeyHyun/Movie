package com.example.spring01.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.spring01.model.dto.MovieDTO;


@Repository
public class MovieDAOImpl implements MovieDAO {

	@Inject // SqlSession 객체를 개발자가 생성하지 않고 스프링에서 연결시켜 줌 
	SqlSession sqlSession;
	
	@Override
	public List<MovieDTO> movieList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("movie.movieList"); //name space.Id
	}

}
