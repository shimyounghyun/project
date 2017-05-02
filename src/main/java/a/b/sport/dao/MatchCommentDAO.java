package a.b.sport.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.b.sport.vo.MatchCommentVO;

@Repository
public class MatchCommentDAO {
	@Autowired
	private SqlSession sqlSession;

	public void insert(MatchCommentVO vo) {
		sqlSession.selectOne("matchComment.insert", vo);
	}

	public List<MatchCommentVO> list(int idx) {
		List<MatchCommentVO> list = sqlSession.selectList("matchComment.list", idx);
		return list;
	}
	
	public int count(int idx){
		int count = sqlSession.selectOne("matchComment.count",idx);
		return count;
	}
}
