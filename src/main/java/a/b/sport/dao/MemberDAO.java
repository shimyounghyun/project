package a.b.sport.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.b.sport.vo.MemberVO;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSession sqlSession;

	// 유저등록
	public void insert(MemberVO vo) {
		sqlSession.insert("member.insert", vo);
	}

	// 아이디중복체크
	public int idchk(HashMap<String, String> map) {
		return sqlSession.selectOne("member.idchk", map);
	}

	// 로그인
	public MemberVO selectOneByEmailAndPassword(HashMap<String, Object> map) {
		return sqlSession.selectOne("member.selectOneByEmailAndPassword", map);
	}
}
