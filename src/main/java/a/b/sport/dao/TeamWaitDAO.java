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
import a.b.sport.vo.TeamWaitVO;

@Repository
public class TeamWaitDAO {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private SqlSession sqlSession;

	public void addWait(TeamWaitVO vo) {
		sqlSession.insert("teamwait.insert",vo);
	}
	
	//대기자 총원수
		public int getCount(int teamidx){
			logger.debug("------------dao teamidx : {}",teamidx);
			return sqlSession.selectOne("teamwait.getCount",teamidx);
		}
		
		//대기자 리스트
	public List<TeamWaitVO> selectList(int teamidx){
			HashMap<String,Integer> map = new HashMap<String, Integer>();
			map.put("teamidx", teamidx);
			List<TeamWaitVO> list = sqlSession.selectList("teamwait.selectList",map);
			return list;
		}
	//대기 목록에서 삭제
	public void delete(int useridx,int teamidx){
		HashMap<String,Integer> map = new HashMap<String,Integer>();
		map.put("useridx", useridx);
		map.put("teamidx", teamidx);
		sqlSession.delete("teamwait.delete",map);
	}
}
