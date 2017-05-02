package a.b.sport.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import a.b.sport.dao.CalendarDAO;
import a.b.sport.vo.CalendarVO;

@Service
public class CalendarService {
	@Autowired
	private CalendarDAO calendarDAO;

	public void insert(CalendarVO vo) {
		calendarDAO.insert(vo);
	}
	
	public List<CalendarVO> selectById(int id){
		return calendarDAO.selectById(id);
	}
}
