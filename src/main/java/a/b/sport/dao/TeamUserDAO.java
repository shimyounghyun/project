package a.b.sport.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.b.sport.HomeController;
import a.b.sport.vo.TeamUserVO;

@Repository
public class TeamUserDAO {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private SqlSession sqlSession;
	//팀원 등록
	public void insert(TeamUserVO vo){
		sqlSession.insert("teamuser.insert",vo);
	}
	
	//팀원 리스트
	public List<TeamUserVO> selectList(int teamidx,int startNo,int pageSize){
		HashMap<String,Integer> map = new HashMap<String, Integer>();
		map.put("teamidx", teamidx);
		map.put("startNo", startNo);
		map.put("pageSize", pageSize);
		List<TeamUserVO> list = sqlSession.selectList("teamuser.selectList",map);
		return list;
	}
	
	//팀 총원수
	public int getCount(int teamidx){
		logger.debug("------------dao teamidx : {}",teamidx);
		return sqlSession.selectOne("teamuser.getCount",teamidx);
	}
}
