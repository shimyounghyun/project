package a.b.sport.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.b.sport.vo.NoticeCommentVO;

@Repository
public class NoticeCommentDAO {
	@Autowired
	private SqlSession sqlSession;

	// 댓글 등록
	public void insertComment(NoticeCommentVO vo) {
		sqlSession.selectOne("noticeComment.insert", vo);
	}
	
	//게시판 번호에 해당하는 댓글 목록
	public List<NoticeCommentVO> list(int idx){
		List<NoticeCommentVO> list = sqlSession.selectList("noticeComment.list",idx);
		return list;
	}
	//댓글 수
	public int count(int idx){
		int count= sqlSession.selectOne("noticeComment.count",idx);
		return count;
	}
}
