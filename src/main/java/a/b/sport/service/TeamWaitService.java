package a.b.sport.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import a.b.sport.HomeController;
import a.b.sport.dao.TeamWaitDAO;
import a.b.sport.vo.PageList;
import a.b.sport.vo.TeamUserVO;
import a.b.sport.vo.TeamWaitVO;

@Service
public class TeamWaitService {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private TeamWaitDAO teamWaitDAO;

	public void add(TeamWaitVO vo) {
		teamWaitDAO.addWait(vo);
	}
	//대기유저 총수
	public int teamWaitCount(int teamidx){
		return teamWaitDAO.getCount(teamidx);
	}
	//대기유저 
	public List<TeamWaitVO> selectList(int teamidx){
		List<TeamWaitVO> list =teamWaitDAO.selectList(teamidx);
			return list;
	}
	//대기목록에서 삭제
	public void delete(int useridx,int teamidx){
		teamWaitDAO.delete(useridx, teamidx);
	}
}
