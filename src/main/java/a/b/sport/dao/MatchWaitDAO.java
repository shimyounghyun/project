package a.b.sport.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.b.sport.vo.MatchWaitVO;

@Repository
public class MatchWaitDAO {

	@Autowired SqlSession sqlSession;
	
	public void insert(MatchWaitVO vo){
		sqlSession.insert("matchwait.insert",vo);
	}
	
	public List<MatchWaitVO> selectList(int teamidx){
		HashMap<String,Integer> map = new HashMap<>();
		map.put("board_teamidx", teamidx);
		List<MatchWaitVO> list = sqlSession.selectList("matchwait.selectList",map);
		return list;
	}
	//체크값 가져오기
	public MatchWaitVO selectByIdx(int idx){
		return sqlSession.selectOne("matchwait.selectByIdx",idx);
	}
	
	public void delete(int board_id){
		sqlSession.delete("matchwait.delete",board_id);
	}
}
