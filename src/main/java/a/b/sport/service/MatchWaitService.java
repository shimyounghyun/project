package a.b.sport.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import a.b.sport.dao.MatchWaitDAO;
import a.b.sport.vo.MatchWaitVO;

@Service
public class MatchWaitService {

	@Autowired private MatchWaitDAO matchWaitDAO;
	
	public void insert(MatchWaitVO vo){
		matchWaitDAO.insert(vo);
	}
	public List<MatchWaitVO> selectList(int teamidx){
		List<MatchWaitVO> list = matchWaitDAO.selectList(teamidx);
		return list;
	}
	public MatchWaitVO selectByIdx(int idx){
		return matchWaitDAO.selectByIdx(idx);
	}
	public void delete(int board_id){
		matchWaitDAO.delete(board_id);
	}
}
