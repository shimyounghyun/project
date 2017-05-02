package a.b.sport.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import a.b.sport.HomeController;
import a.b.sport.dao.MatchDAO;
import a.b.sport.vo.MatchVO;
import a.b.sport.vo.PageList;

@Service
public class MatchService {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private MatchDAO matchDAO;

	public void insert(MatchVO vo) {
		matchDAO.insert(vo);
	}
	
	//전체개수
	public int getCount(HashMap<String,String> map){
		
		return matchDAO.getCount(map);
	}
	//1개 얻기
	public MatchVO selectByIdx(int idx){
		return matchDAO.selectByIdx(idx);
	}
	//리스트얻기
	public PageList<MatchVO> selectList(int currentPage,int pageSize,int blockSize,HashMap<String,String> map){
		PageList<MatchVO> pageList = null;
		try{
		int totalCount = matchDAO.getCount(map);
		logger.debug("총 개수 : {}",totalCount);
		pageList = new PageList<>(totalCount, currentPage, pageSize, blockSize);
		pageList.setList(matchDAO.selectList(pageList.getStartNo(), pageList.getPageSize(),map));
		logger.debug("서비스 페이지 currentPage : {}",currentPage);
		logger.debug("서비스 페이지 pageSize : {}",pageSize);
		logger.debug("서비스 페이지 blockSize: {}",blockSize);
		logger.debug("서비스 페이지 map : {}",map);
		return pageList;
		}catch(Exception e){;}
		logger.debug("서비스 실패");
		return pageList;
	}
}
