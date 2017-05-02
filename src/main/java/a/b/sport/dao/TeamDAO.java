package a.b.sport.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.b.sport.HomeController;
import a.b.sport.vo.TeamVO;

@Repository
public class TeamDAO {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private SqlSession sqlSession;
	
	public void insert(TeamVO vo){
		sqlSession.insert("team.insert",vo);
	}
	
	public void chageTeam(int idx,int teamNum){
		HashMap<String,Integer> map = new HashMap<String, Integer>();
		map.put("idx", idx);
		map.put("teamNum", teamNum);
		sqlSession.update("team.userTeam",map);
	}
	
	public TeamVO getTeam(int teamNum){
		return sqlSession.selectOne("team.getTeam",teamNum);
	}
	
	//팀 1페이지 얻기
	public List<TeamVO> selectList(int startNo,int pageSize){
		HashMap<String,Integer> map = new HashMap<String, Integer>();
		map.put("startNo", startNo);
		map.put("pageSize", pageSize);
		List<TeamVO> list = sqlSession.selectList("team.selectList",map);
		return list;
	}
	//팀 총개수 얻기
	public int getCount(){
		return sqlSession.selectOne("team.getCount");
	}
	
	//검색
	public List<TeamVO> searchList(int startNo,int pageSize,HashMap<String,String> map){
		logger.debug("DAO에서 Map 상황 {}",map);
		Integer start = startNo;
		Integer page = pageSize;
	
		map.put("startNo", start.toString());
		map.put("pageSize", page.toString());
		List<TeamVO> list = sqlSession.selectList("team.search",map);
		return list;
	}
	//검색 게시물 총개수
	public int searchCount(HashMap<String,String> map){
		return sqlSession.selectOne("team.searchCount",map);
	}
	
	public List<Integer> allteam(){
		return sqlSession.selectList("team.allteam");
	}
}
