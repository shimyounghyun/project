package a.b.sport;


import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import a.b.sport.service.NoticeCommentService;
import a.b.sport.service.NoticeService;
import a.b.sport.vo.MemberVO;
import a.b.sport.vo.NoticeCommentVO;
import a.b.sport.vo.NoticeVO;
import a.b.sport.vo.PageList;

@Controller
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired private NoticeService noticeService;
	@Autowired private NoticeCommentService noticeCommentService; 
	@Autowired ServletContext sc;
	//공지사항 리스트 뷰
	@RequestMapping(value="notice",method=RequestMethod.GET)
	public String noticehome(Model model,HttpServletRequest request){
		int currentPage = 1;
		try{
			currentPage = Integer.parseInt(request.getParameter("p"));
		}catch(Exception e){;}
		
		// 페이지당 글수
		int pageSize = 10;
		
		// 페이지 목록 개수
		int blockSize=5;
		
			PageList<NoticeVO> list =noticeService.selectList(currentPage, pageSize, blockSize);
		
			model.addAttribute("currentPage",currentPage);
			model.addAttribute("pageSize",pageSize);
			model.addAttribute("blockSize",blockSize);
			model.addAttribute("list",list);
			System.out.println(list.getStartPage());
		return "notice";
	}
	
	//공지사항 1개 뷰
	@RequestMapping(value="/notice/view",method=RequestMethod.GET)
	public String selectByIdx(@RequestParam(value="idx")int idx,@RequestParam(value="p")int p, Model model){
		logger.debug("컨트롤러 테스트"+idx + "번");
		String path = sc.getRealPath("./upload/");
		int count = noticeCommentService.count(idx);
		NoticeVO vo = noticeService.selectByIdx(idx);
		List<NoticeCommentVO> list = noticeCommentService.list(idx);
		model.addAttribute("path",path);
		model.addAttribute("count",count);
		model.addAttribute("list",list);
		model.addAttribute("p", p);
		model.addAttribute("idx", idx);
		model.addAttribute("vo", vo);
		return "noticeRead";
	}
	
	
	
	
	//공지사항에서 댓글 입력시 다시 view로 보내기위해 공지사항 model에 idx,p를 넣고 댓글 작성 form의 action할때 ?idx= & p= 방식으로 다시 넘김
	@RequestMapping(value="notice/view",method=RequestMethod.POST)
	public String commentInsert(@ModelAttribute NoticeCommentVO vo,HttpServletRequest request,
			@RequestParam(value="idx")int idx,@RequestParam(value="p")int p){
		noticeCommentService.insertComment(vo);
		return "redirect: /sport/notice/view?idx="+idx+"&p="+p;
	}
	

	
	
	
	
	
	
	
	

		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//관리자가 아닐경우 접근 제한.
	@RequestMapping(value="/notice/write", method=RequestMethod.GET)
	public String WriteView(HttpServletRequest request, HttpSession session){
		MemberVO vo = (MemberVO) request.getSession().getAttribute("member");
		if(vo ==null || vo.getTeamNum() !=1) return "fail";
		return "noticeWrite";
	}
	
	
	@RequestMapping(value="/notice/write", method=RequestMethod.POST)
	public String insertNotice(HttpServletRequest request,@ModelAttribute NoticeVO vo){
		logger.debug("넘어옴? {}",vo);
		noticeService.insertNotice(vo);
		logger.debug("등록완료 {}",vo);
		return "redirect: /sport/notice?p=1";
	}

	
}
