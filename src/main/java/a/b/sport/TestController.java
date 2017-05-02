package a.b.sport;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
import org.springframework.web.bind.annotation.ResponseBody;

import a.b.sport.dao.ChatLogDAO;
import a.b.sport.service.MatchCommentService;
import a.b.sport.service.MatchService;
import a.b.sport.vo.CalendarVO;
import a.b.sport.vo.ChatLogVO;
import a.b.sport.vo.MatchCommentVO;
import a.b.sport.vo.MatchVO;
import a.b.sport.vo.MemberVO;
import a.b.sport.vo.TeamWaitVO;

@Controller
public class TestController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired ServletContext sc;
	@Autowired ChatLogDAO chatLogDAO;
	@Autowired MatchCommentService matchCommentService;
	@RequestMapping(value="/chat",method=RequestMethod.POST)
	public @ResponseBody ChatLogVO chat(@RequestParam String msg,HttpSession session,HttpServletRequest request){
	MemberVO vo = (MemberVO)request.getSession().getAttribute("member");
	Date current = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("hh:mm");
	String time = sdf.format(current);
	
	ChatLogVO chatLogVO = new ChatLogVO();
	chatLogVO.setTeamnum(vo.getTeamNum());
	chatLogVO.setUserid(vo.getUsername());
	chatLogVO.setContent(msg);
	chatLogVO.setImg(vo.getThumnail());
	chatLogVO.setRegdate(time);
	chatLogDAO.insert(chatLogVO);
		return chatLogVO;
	}
	@RequestMapping(value="/chat",method=RequestMethod.GET)
	public String chat(){
		return "chat";
	}
	@RequestMapping(value="/test")
	public String test(){
		return "test";
	}
	@RequestMapping(value="/test/cal2")
	public @ResponseBody List<CalendarVO> cal(HttpServletRequest request){
		CalendarVO vo = new CalendarVO();
		CalendarVO vo1 = new CalendarVO();
		List<CalendarVO> list = new ArrayList<>(); 
		vo.setStart("2017-05-02");
		vo.setTitle("호랑이팀 14시30분");
		vo.setId(1);
		vo.setEnd("2017-05-02");
		list.add(vo);
		vo1.setStart("2017-05-03");
		vo1.setTitle("경기");
		vo1.setId(1);
		vo1.setEnd("2017-05-03");
		list.add(vo1);
		return list;
		
	}
}
