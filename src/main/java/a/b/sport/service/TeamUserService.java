package a.b.sport.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import a.b.sport.HomeController;
import a.b.sport.dao.TeamUserDAO;
import a.b.sport.vo.MemberVO;
import a.b.sport.vo.PageList;
import a.b.sport.vo.TeamUserVO;

@Service
public class TeamUserService {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private TeamUserDAO teamUserDAO;
	
	public PageList<TeamUserVO> selectList(int currentPage,int pageSize,int blockSize,int teamidx){
		logger.debug("팀유저 현재페이지 {}",currentPage);
		PageList<TeamUserVO> pageList = null;
		try{
			int totalCount = teamUserDAO.getCount(teamidx);
			pageList = new PageList<TeamUserVO>(totalCount, currentPage, pageSize, blockSize);
			pageList.setList(teamUserDAO.selectList(teamidx, pageList.getStartNo(), pageList.getPageSize()));
			logger.debug("팀유저 시작번호 : {} ",pageList.getStartNo());
			return pageList;
		}catch(Exception e){;}
		return pageList;
	}
	
	public int teamUserCount(int teamidx){
		return teamUserDAO.getCount(teamidx);
	}
}
