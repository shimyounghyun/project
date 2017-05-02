package a.b.sport.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.b.sport.vo.CalendarVO;

@Repository
public class CalendarDAO {

	@Autowired SqlSession sqlSession;
	
	public void insert(CalendarVO vo){
		sqlSession.insert("calendar.insert",vo);
	}
	
	public List<CalendarVO> selectById(int id){
		return sqlSession.selectList("calendar.selectById",id);
	}
}
