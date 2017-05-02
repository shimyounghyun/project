package a.b.sport.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import a.b.sport.dao.NoticeCommentDAO;
import a.b.sport.vo.NoticeCommentVO;

@Service
public class NoticeCommentService {

	@Autowired
	private NoticeCommentDAO noticeCommentDAO;
	//댓글 등록
	public void insertComment(NoticeCommentVO vo) {
		noticeCommentDAO.insertComment(vo);
	}
	//댓글 리스트
	public List<NoticeCommentVO> list(int idx){
		List<NoticeCommentVO> list = noticeCommentDAO.list(idx);
		return list;
	}
	//댓글 수
	public int count(int idx){
		int count = noticeCommentDAO.count(idx);
		return count;
	}
}
