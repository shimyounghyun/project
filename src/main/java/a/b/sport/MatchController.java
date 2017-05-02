package a.b.sport;

import java.util.HashMap;
import java.util.List;

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

import a.b.sport.service.MatchCommentService;
import a.b.sport.service.MatchService;
import a.b.sport.service.MatchWaitService;
import a.b.sport.service.TeamService;
import a.b.sport.vo.MatchCommentVO;
import a.b.sport.vo.MatchVO;
import a.b.sport.vo.MatchWaitVO;
import a.b.sport.vo.MemberVO;
import a.b.sport.vo.PageList;
import a.b.sport.vo.TeamVO;

@Controller
public class MatchController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired ServletContext sc;
	@Autowired MatchService matchService;
	@Autowired TeamService teamService;
	@Autowired MatchCommentService matchCommentService;
	@Autowired MatchWaitService matchWaitService;

	// 공지사항 리스트 뷰
	@RequestMapping(value = "/team/match")
	public String match(Model model,HttpServletRequest request) {
		int currentPage =1;
		try{
			currentPage = Integer.parseInt(request.getParameter("p"));
		}catch(Exception e){;}
		
		// 페이지당 글수
		int pageSize = 5;
		
		// 페이지 목록 개수
		int blockSize=5;
		HashMap<String,String> map = new HashMap<>();
		map.put("area", request.getParameter("area"));
		logger.debug("area : {}",request.getParameter("area"));
		PageList<MatchVO> list = matchService.selectList(currentPage, pageSize, blockSize, map);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("blockSize",blockSize);
		model.addAttribute("list",list);
		model.addAttribute("area",request.getParameter("area"));
		
		logger.debug("map : {}",map);
		System.out.println(list);
		return "match";
	}

	@RequestMapping(value = "/team/matchWrite", method = RequestMethod.GET)
	public String matchMake(HttpSession session,Model model,HttpServletRequest request) {
		MemberVO vo = (MemberVO)request.getSession().getAttribute("member");
		TeamVO team = teamService.getTeam(vo.getTeamNum());
		int teamidx = team.getTeamidx();
		String teamarea1 = team.getSelOne();
		String teamarea2 = team.getSelTwo();
		String teamimg = team.getImg();
		String teamname = team.getName();
		model.addAttribute("teamidx",teamidx);
		model.addAttribute("teamname",teamname);
		model.addAttribute("teamarea1",teamarea1);
		model.addAttribute("teamarea2",teamarea2);
		model.addAttribute("teamimg",teamimg);
		return "matchMake";
	}
	@RequestMapping(value = "/team/matchWrite", method = RequestMethod.POST)
	public String matchMaked(@ModelAttribute MatchVO vo,HttpServletRequest request,Model model) {
		matchService.insert(vo);
		logger.debug("----------------------매치등록 완료---------------");
		return "redirect:/team/match";
	}
	@RequestMapping(value = "/team/matchRead",method=RequestMethod.GET)
	public String matchRead(@RequestParam(value="idx")int idx,@RequestParam(value="p")int p,Model model) {
		MatchVO vo = matchService.selectByIdx(idx);
		List<MatchCommentVO> list = matchCommentService.list(idx);
		model.addAttribute("list",list);
		model.addAttribute("vo",vo);
		model.addAttribute("p",p);
		return "matchRead";
	}
	@RequestMapping(value="/team/matchRead",method=RequestMethod.POST)
	public String chat2(@RequestParam(value="idx")int idx,@RequestParam(value="p")int p,@ModelAttribute MatchCommentVO vo){
		matchCommentService.insert(vo);
		return "redirect:/team/matchRead?idx="+idx+"&p="+p;
	}
	@RequestMapping(value="/team/matchwait",method=RequestMethod.POST)
	public String matchwait(@ModelAttribute MatchWaitVO vo,HttpServletRequest request){
		TeamVO team = teamService.getTeam(vo.getTeamidx());
		vo.setTeamname(team.getName());
		matchWaitService.insert(vo);
		return "redirect:/team/match";
	}
}
