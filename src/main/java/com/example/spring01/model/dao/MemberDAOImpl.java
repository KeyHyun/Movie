package com.example.spring01.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.spring01.model.dto.MemberDTO;

@Repository // ������ ����Ǹ� Repository �Ʒ��� class�� �ڵ����� �޸� �Ҵ�
			// �̹� �Ҵ��� �Ǿ @Inject �� ���̸� new�� �������� �ʾƵ� ��
public class MemberDAOImpl implements MemberDAO {

	@Inject // SqlSession ��ü�� �����ڰ� �������� �ʰ� ���������� ������� ��
	SqlSession sqlSession;

	@Override
	public List<MemberDTO> memberList() {
		// sql mapper�� �ۼ��� sql �ڵ尡 �����
		return sqlSession.selectList("member.memberList"); // name space.Id
	}

	@Override
	public void insertMember(MemberDTO vo) {
		// TODO Auto-generated method stub
		sqlSession.insert("member.insertMember", vo);
	}

	@Override
	public MemberDTO viewMember(String userid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.viewMember", userid);
	}

	@Override
	public boolean checkPw(String userid, String passwd) {
		// TODO Auto-generated method stub
		boolean result = false;
		Map<String, String> map = new HashMap<String, String>();
		map.put("userid", userid);
		map.put("passwd", passwd);
		int count = sqlSession.selectOne("member.checkPw", map);
		if (count == 1)
			result = true;
		return result;
	}

	@Override
	public String loginCheck(MemberDTO vo) {
		return sqlSession.selectOne("member.login_check", vo);
	}
}
