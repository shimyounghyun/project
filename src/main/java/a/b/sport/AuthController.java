package a.b.sport;

import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import a.b.sport.service.MemberService;
import a.b.sport.vo.MemberVO;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes({"member"})
public class AuthController {
	@Autowired private MemberService memberService;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@RequestMapping(value="/login",method = RequestMethod.POST)
	public String login(
			HttpServletResponse response,	
			String userid,	
			String password,
			Model model,
			SessionStatus sessionStatus)	throws Exception {

		System.out.println(userid);
		System.out.println(password);

		// DB에서 해당 이메일과 암호가 일치하는 사용자가 있는지 조사한다.
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userid", userid);
		map.put("password", password);
		MemberVO member = memberService.selectOneByEmailAndPassword(map);

		if (member == null) {
			sessionStatus.setComplete();
			System.out.println("로그인실패");
			return "fail";

		} else {					
			model.addAttribute("member", member); // Model 객체에 로그인 회원정보를 담는다.
			System.out.println("로그인 성공");
			System.out.println(member);
			return "redirect: /sport";	
		}	
	}
	
	@RequestMapping("logout")
	public String logout(SessionStatus sessionStatus) throws Exception {
		sessionStatus.setComplete();
		return "redirect: /sport";
	}
	@RequestMapping(value = "/idchk", method = RequestMethod.GET, produces="text/plain;charset=utf-8")
	public @ResponseBody String idcheck(@RequestParam String userid,Model model) {
		
		logger.debug("넘어옴값 : {}",userid);
		return memberService.idchk(userid)+"";
	}
}
