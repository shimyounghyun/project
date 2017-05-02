package a.b.sport.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.b.sport.vo.NoticeVO;

@Repository
public class NoticeDAO {
	@Autowired
	private SqlSession sqlSession;

	//전체 개수
	public int getCount(){
		return sqlSession.selectOne("notice.getCount");
	}
	//1개 얻기
	public NoticeVO selectByIdx(int idx) {
		return sqlSession.selectOne("notice.selectByIdx", idx);
	}
	//1페이지 얻기
	public List<NoticeVO> selectList(int startNo,int pageSize){
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNo", startNo);
		map.put("pageSize", pageSize);
		List<NoticeVO> list = sqlSession.selectList("notice.selectList", map);
		return list;
	}
	//글작성
	public void insertNotice(NoticeVO vo){
		sqlSession.selectOne("notice.insertNotice",vo);
	}
	//검색
	public List<NoticeVO> searchList(int startNo,int pageSize,String searchSub){
		Integer start = startNo;
		Integer page = pageSize;
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("startNo", start.toString());
		map.put("pageSize", page.toString());
		map.put("searchSub", searchSub);
		List<NoticeVO> list = sqlSession.selectList("notice.search",map);
		return list;
	}
	//검색 게시물 총 개수
	public int searchCount(String searchSub){
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("searchSub", searchSub);
		return sqlSession.selectOne("notice.searchCount",map);
	}
}
