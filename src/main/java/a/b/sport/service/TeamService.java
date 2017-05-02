package a.b.sport.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import a.b.sport.HomeController;
import a.b.sport.dao.TeamDAO;
import a.b.sport.dao.TeamUserDAO;
import a.b.sport.dao.TeamWaitDAO;
import a.b.sport.vo.MemberVO;
import a.b.sport.vo.NoticeVO;
import a.b.sport.vo.PageList;
import a.b.sport.vo.TeamUserVO;
import a.b.sport.vo.TeamVO;

@Service
public class TeamService {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired private TeamDAO teamDAO;
	@Autowired private TeamUserDAO teamUserDAO;
	@Autowired private TeamWaitDAO teamWaitDAO;
	
	//팀등록후 해당 팀idx로 유저teamNum 업데이트
	public void insert(TeamVO vo,MemberVO member){
		logger.debug("insert 진입 ,팀idx=? {}",vo.getTeamidx());
		try{
			teamDAO.insert(vo);
		TeamUserVO teamUserVO = new TeamUserVO();
		teamUserVO.setTeamidx(vo.getTeamidx());
		teamUserVO.setUsername(member.getUsername());
		teamUserVO.setLv(1);
		teamUserVO.setUserid(member.getUserid());
		teamUserDAO.insert(teamUserVO);
		teamDAO.chageTeam(member.getIdx(), vo.getTeamidx());
		
		}catch(Exception e){;}
	}
	//팀 가입(팀유저 등록,팀대기 삭제,유저 팀번호 변경)
	public void addMember(int teamNum,MemberVO member){
		TeamUserVO teamUserVO = new TeamUserVO();
		teamUserVO.setTeamidx(teamNum);
		teamUserVO.setUsername(member.getUsername());
		teamUserVO.setLv(0);
		teamUserVO.setUserid(member.getUserid());
		teamUserDAO.insert(teamUserVO);
		
		teamWaitDAO.delete(member.getIdx(),teamNum);
		
		teamDAO.chageTeam(member.getIdx(),teamNum);
	}
	//유저 teamNum으로 해당teamidx 조회후 정보가져오기
	public TeamVO getTeam(int teamNum){
		return teamDAO.getTeam(teamNum);
	}
	
	//팀 리스트 얻기
	public PageList<TeamVO> selectList(int currentPage,int pageSize,int blockSize){
		logger.debug("서비스 p 값 {}",currentPage);
		PageList<TeamVO> pageList=null;
		try{
			int totalCount = teamDAO.getCount();
			pageList = new PageList<TeamVO>(totalCount, currentPage, pageSize, blockSize);
			logger.debug("팀  시작번호 : {}",pageList.getStartNo());
			pageList.setList(teamDAO.selectList(pageList.getStartNo(), pageList.getPageSize()));
			return pageList;
		}catch(Exception e){;}
		return pageList;
	}
	
	//검색
	public PageList<TeamVO> searchList(int currentPage, int pageSize,int blockSize,HashMap<String,String> map){
		PageList<TeamVO> pageList = null;
		logger.debug("Service에서 Map 상황 {}",map);
		try{
			int totalCount = teamDAO.searchCount(map);
			pageList = new PageList<TeamVO>(totalCount, currentPage, pageSize, blockSize);
			pageList.setList(teamDAO.searchList(pageList.getStartNo(), pageList.getPageSize(), map));
			return pageList;
		}catch(Exception e){;}
		return pageList;
	}
	//팀번호만
	public List<Integer> allteam(){
		return teamDAO.allteam();
	}
}
