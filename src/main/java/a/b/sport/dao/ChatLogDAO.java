package a.b.sport.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.b.sport.vo.ChatLogVO;

@Repository
public class ChatLogDAO {
	@Autowired
	private SqlSession sqlSession;

	public void insert(ChatLogVO vo) {
		sqlSession.insert("chat.insert", vo);
	}

	public List<ChatLogVO> list(int teamnum) {
		List<ChatLogVO> list = sqlSession.selectList("chat.log",teamnum);
		return list;
	}
	
	
}
