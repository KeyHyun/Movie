package com.example.spring01.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.spring01.model.dto.MovieDTO;


@Repository
public class MovieDAOImpl implements MovieDAO {

	@Inject // SqlSession ��ü�� �����ڰ� �������� �ʰ� ���������� ������� �� 
	SqlSession sqlSession;
	
	@Override
	public List<MovieDTO> movieList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("movie.selectSchedule"); //name space.Id
	}
	
	@Override
	public void insertMovie (MovieDTO vo) {
		sqlSession.insert("movie.insertMovie",vo);
	}
	
	@Override
	public void insertMovie (String string) {
		sqlSession.insert("movie.insertMovie",string);
	}
}
