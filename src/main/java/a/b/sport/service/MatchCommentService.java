package a.b.sport.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import a.b.sport.dao.MatchCommentDAO;
import a.b.sport.vo.MatchCommentVO;

@Service
public class MatchCommentService {
	@Autowired
	private MatchCommentDAO matchCommentDAO;

	public void insert(MatchCommentVO vo) {
		matchCommentDAO.insert(vo);
	}
	
	public List<MatchCommentVO> list(int idx){
		List<MatchCommentVO> list = matchCommentDAO.list(idx);
		return list;
	}
	
	public int count(int idx){
		int count = matchCommentDAO.count(idx);
		return count;
	}
}
