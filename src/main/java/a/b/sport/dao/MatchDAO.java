package a.b.sport.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.b.sport.HomeController;
import a.b.sport.vo.MatchVO;

@Repository
public class MatchDAO {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private SqlSession sqlSession;

	public void insert(MatchVO vo) {
		sqlSession.insert("match.insert", vo);
	}
	
	//전체개수
	public int getCount(HashMap<String,String> map){
		logger.debug("전채개수 DAO map :{}",map);
		return sqlSession.selectOne("match.getCount",map);
	}
	//1페이지
	public List<MatchVO> selectList(int startNo,int pageSize,HashMap<String,String> map){
		Integer start = startNo;
		Integer page = pageSize;
		map.put("startNo",start.toString());
		map.put("pageSize",page.toString());
		List<MatchVO> list = sqlSession.selectList("match.selectList",map);
		return list;
	}
	
	//1개 얻기
	public MatchVO selectByIdx(int idx){
		return sqlSession.selectOne("match.selectByIdx",idx);
	}
}
