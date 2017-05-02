package a.b.sport;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import a.b.sport.service.CalendarService;
import a.b.sport.service.MatchWaitService;
import a.b.sport.service.TeamService;
import a.b.sport.service.TeamUserService;
import a.b.sport.service.TeamWaitService;
import a.b.sport.vo.CalendarVO;
import a.b.sport.vo.Json2VO;
import a.b.sport.vo.LocationUtil;
import a.b.sport.vo.MatchWaitVO;
import a.b.sport.vo.MemberVO;
import a.b.sport.vo.NoticeVO;
import a.b.sport.vo.PageList;
import a.b.sport.vo.TeamUserVO;
import a.b.sport.vo.TeamVO;
import a.b.sport.vo.TeamWaitVO;

@Controller
@SessionAttributes({"member"})
public class TeamController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired private TeamService teamService;
	@Autowired private TeamUserService teamUserService;
	@Autowired private TeamWaitService teamWaitService;
	@Autowired private MatchWaitService matchWaitService;
	@Autowired private CalendarService calendarService;
	@Autowired ServletContext sc;
	
	@RequestMapping(value="/team")
	public String fileEmailSend1(Model model,HttpServletRequest request,HttpSession session){
		MemberVO member = (MemberVO) request.getSession().getAttribute("member");
		logger.debug("member 상태는 ? {}",member);
	if(member.getTeamNum() != 0){
		int currentPage = 1;
		try{
			currentPage = Integer.parseInt(request.getParameter("p"));
		}catch(Exception e){;}
		
		// 페이지당 글수
		int pageSize = 5;
		
		// 페이지 목록 개수
		int blockSize=5;
		
		PageList<TeamUserVO> list = teamUserService.selectList(currentPage, pageSize, blockSize, member.getTeamNum());
		List<TeamWaitVO> waitlist = teamWaitService.selectList(member.getTeamNum());
		List<MatchWaitVO> matchlist = matchWaitService.selectList(member.getTeamNum());
			TeamVO teaminfo = teamService.getTeam(member.getTeamNum());
			model.addAttribute("currentPage",currentPage);
			model.addAttribute("pageSize",pageSize);
			model.addAttribute("blockSize",blockSize);
			model.addAttribute("list",list);
			model.addAttribute("teaminfo",teaminfo);
			model.addAttribute("waitlist",waitlist);
			model.addAttribute("matchlist",matchlist);
			logger.debug("list :{}",list);
			System.out.println("모델에 팀정보 넣기 성공"+teaminfo);
			return "teaminfo";
	}
	return "team";
	}
	
	@RequestMapping(value="/teaminfo")
	public String fileEmailSend(Model model,HttpServletRequest request,HttpSession session){
		
	
	return "test2";
	}
	@RequestMapping(value="/team/teamwait",method=RequestMethod.POST)
	public String teamwait(HttpServletRequest request,TeamWaitVO vo){
		vo.setUsername(request.getParameter("username"));
		vo.setUserid(request.getParameter("userid"));
		vo.setUseridx(Integer.parseInt(request.getParameter("useridx")));
		vo.setTeamidx(Integer.parseInt(request.getParameter("teamidx")));
		logger.debug("성공 {}",vo);
		teamWaitService.add(vo);
		logger.debug("성공 {}",vo);
		
		return "redirect: /sport";
	}
	@RequestMapping(value="/team/teamsearch", method=RequestMethod.GET)
	public String teamSearch(Model model,HttpServletRequest request){
		int currentPage = 1;
		try{
			currentPage = Integer.parseInt(request.getParameter("p"));
		}catch(Exception e){;}
		
		// 페이지당 글수
		int pageSize = 16;
		
		// 페이지 목록 개수
		int blockSize=5;
		
		String path = sc.getRealPath("./json/location.json");
		LocationUtil location = new LocationUtil();
		model.addAttribute("lo",location.getArea2(path));
		model.addAttribute("location",location.getArea1(path));
		
		
			PageList<TeamVO> list =teamService.selectList(currentPage, pageSize, blockSize);
		
			model.addAttribute("currentPage",currentPage);
			model.addAttribute("pageSize",pageSize);
			model.addAttribute("blockSize",blockSize);
			model.addAttribute("list",list);
			System.out.println(list.getStartPage());
		
		return "teamSearch";
	}
	@RequestMapping(value="/team/teamsearch", method=RequestMethod.POST)
	public String teamSearch1(Model model,HttpServletRequest request){
		int currentPage = 10;
		try{
			currentPage = Integer.parseInt(request.getParameter("p"));
		}catch(Exception e){;}
		
		// 페이지당 글수
		int pageSize = 16;
		
		// 페이지 목록 개수
		int blockSize=5;
		String path = sc.getRealPath("./json/location.json");
		LocationUtil location = new LocationUtil();
		model.addAttribute("lo",location.getArea2(path));
		model.addAttribute("location",location.getArea1(path));
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("selOne", request.getParameter("selOne"));
		map.put("selTwo", request.getParameter("selTwo"));
		map.put("name", request.getParameter("name"));
		logger.debug("들어온 값 확인 원 투 네임,{}", request.getParameter("selOne"));
		logger.debug("들어온 값 확인 원 투 네임,{}", request.getParameter("selTwo"));
		logger.debug("들어온 값 확인 원 투 네임,{}",request.getParameter("name"));
		PageList<TeamVO> list =teamService.searchList(currentPage, pageSize, blockSize, map);
		
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("blockSize",blockSize);
		model.addAttribute("list",list);
		System.out.println(list.getStartPage());
		
		return "teamSearch";
	}
	
	@RequestMapping(value="/team/teamsearch/json",method=RequestMethod.POST)
	public @ResponseBody PageList<TeamUserVO> teamList(@RequestParam("t") String t,@RequestParam("p") int p){
		int teamidx = Integer.parseInt(t);
		logger.debug("받은 값 {}",teamidx);
		logger.debug("p 받은 값 {}",p);
		int currentPage = 1;
		try{
			currentPage = p;
		}catch(Exception e){;}
		logger.debug("currentPage 받은 값 {}",currentPage);
		// 페이지당 글수
		int pageSize = 6;
		// 페이지 목록 개수
		int blockSize=2;
		PageList<TeamUserVO> list = teamUserService.selectList(currentPage, pageSize, blockSize, teamidx);
		return list;
	}
	@RequestMapping(value="/team/teamAgree")
	public @ResponseBody String teamSign(@RequestParam int team,
			@RequestParam int useridx,@RequestParam String username,@RequestParam String userid,MemberVO member){
		member.setIdx(useridx);
		member.setUsername(username);
		member.setUserid(userid);
		teamService.addMember(team, member);
		return "";
	}
	@RequestMapping(value="/team/teamRefuse")
	public @ResponseBody String teamRefuse(@RequestParam int team,@RequestParam int useridx){
		teamWaitService.delete(useridx, team);
		return "";
	}
	@RequestMapping(value="/team/matchAgree")
	public @ResponseBody void matchAgree(@RequestParam int idx){
		MatchWaitVO vo= matchWaitService.selectByIdx(idx);
		CalendarVO v = new CalendarVO();
		v.setId(vo.getBoard_teamidx());
		v.setStart(vo.getBoard_date());
		v.setEnd(vo.getBoard_date());
		v.setTitle("vs "+vo.getTeamname()+"팀");
		calendarService.insert(v);
		matchWaitService.delete(vo.getBoard_id());
	}
	@RequestMapping(value="/team/cal")
	public @ResponseBody List<CalendarVO> cal(HttpServletRequest request,HttpSession session){
		MemberVO member = (MemberVO)request.getSession().getAttribute("member");
		List<CalendarVO> callist = calendarService.selectById(member.getTeamNum());
		return callist;
		
	}
	
	
	
	
	
	
	@RequestMapping(value="/team/make" ,method=RequestMethod.GET)
	public String fileEmailSend(Model model,HttpServletRequest request){
		String path = sc.getRealPath("./json/location.json");
		LocationUtil location = new LocationUtil();
		model.addAttribute("lo",location.getArea2(path));
		model.addAttribute("location",location.getArea1(path));
		return "teamMake";
	}
	@RequestMapping(value="/team/make" ,method=RequestMethod.POST)
	public String fileEmailSend2(MultipartHttpServletRequest request,@ModelAttribute TeamVO vo,
			@ModelAttribute MemberVO member,HttpSession session){
		
		String path = sc.getRealPath("./upload2/");
		member = (MemberVO)request.getSession().getAttribute("member");
		
		//모든 파일 받기
		Map<String,MultipartFile> files = request.getFileMap();
		
		//1개 얻기
		CommonsMultipartFile cmf = (CommonsMultipartFile)files.get("file");
	
		String originName = cmf.getOriginalFilename();
		
		try {
			//서버 저장
			cmf.transferTo(new File(path+originName));
			vo.setImg(originName);
			teamService.insert(vo,member);
			int teamidx = vo.getTeamidx();
			logger.debug("teamidx{} 는?",teamidx);
			logger.debug("멤버 상태는?{} 는?",member);
			member.setTeamNum(teamidx);
			logger.debug("teamidx{} 는?",vo.getTeamidx());
			logger.debug("멤버 상태는?{} 는?",member);
			logger.debug("저장완료,위치{}",path);
			return "redirect: /sport/team";
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		logger.debug("넘어옴? {}",vo);
		
	return "redirect: /sport/team";
	}
	
}
