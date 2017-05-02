package a.b.sport.service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import a.b.sport.HomeController;
import a.b.sport.dao.NoticeDAO;
import a.b.sport.vo.NoticeVO;
import a.b.sport.vo.PageList;

@Service
public class NoticeService {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired private NoticeDAO noticeDAO;
	//전체 개수
	public int getCount(){
		return noticeDAO.getCount();
	}
	//1개 얻기
	public NoticeVO selectByIdx(int idx){
		return noticeDAO.selectByIdx(idx);
	}
	
	//리스트 얻기
	public PageList<NoticeVO> selectList(int currentPage,int pageSize,int blockSize){
		logger.debug("공지사항 서비스 p 값 {}",currentPage);
		PageList<NoticeVO> pageList = null;
		 try{
		 int totalCount = noticeDAO.getCount();
		 pageList = new PageList<NoticeVO>(totalCount, currentPage, pageSize, blockSize);
		 logger.debug("공지사항  시작번호 : {}",pageList.getStartNo());
		 pageList.setList(noticeDAO.selectList(pageList.getStartNo(), pageList.getPageSize()));
		 return pageList;
		 }catch(Exception e){;}
		 return pageList;
	}
	//글작성
	public void insertNotice(NoticeVO vo){
		noticeDAO.insertNotice(vo);
	}
	
	//검색
	public PageList<NoticeVO> searchList(int currentPage,int pageSize,int blockSize,String searchSub){
		PageList<NoticeVO> pageList = null;
		try{
			int totalCount = noticeDAO.searchCount(searchSub);
			pageList = new PageList<NoticeVO>(totalCount,currentPage,pageSize,blockSize);
			pageList.setList(noticeDAO.searchList(pageList.getStartNo(), pageList.getPageSize(), searchSub));
			return pageList;
		}catch(Exception e){;}
		return pageList;
	}
	
	
	
	
	public int searchCount(String searchSub){
		return noticeDAO.searchCount(searchSub);
	}
}
