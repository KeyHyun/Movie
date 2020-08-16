package com.example.spring01.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.example.spring01.model.dto.MemberDTO;

@Repository // 서버가 실행되면 Repository 아래의 class를 자동으로 메모리 할당
            // 이미 할당이 되어서 @Inject 를 붙이면 new로 생성하지 않아도 됨
public class MemberDAOImpl implements MemberDAO {

	@Inject // SqlSession 객체를 개발자가 생성하지 않고 스프링에서 연결시켜 줌 
	SqlSession sqlSession;
	
	@Override
	public List<MemberDTO> memberList() {
		// TODO Auto-generated method stub
		// sql mapper에 작성된 sql 코드가 실행됨
		return sqlSession.selectList("member.memberList"); //name space.Id
	}

	@Override
	public void insertMember(MemberDTO vo) {
		// TODO Auto-generated method stub
		sqlSession.insert("member.insertMember",vo);
	}

	@Override
	public MemberDTO viewMember(String userid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.viewMember", userid);
	}

	@Override
	public void deleteMember(String userid) {
		// TODO Auto-generated method stub
		sqlSession.delete("member.deleteMember", userid);
	}

	@Override
	public void updateMember(MemberDTO vo) {
		// TODO Auto-generated method stub
		sqlSession.update("member.updateMember", vo);
	}

	@Override
	public boolean checkPw(String userid, String passwd) {
		// TODO Auto-generated method stub
		boolean result=false;
		Map<String,String> map=new HashMap<String, String>();
		map.put("userid", userid);
		map.put("passwd", passwd);
		int count=sqlSession.selectOne("member.checkPw", map);
		if(count==1) result=true;
		return result;
	}
	
	@Override
	public String loginCheck(MemberDTO vo) {
		return sqlSession.selectOne("member.login_check", vo);
	}
}
