package a.b.sport;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import a.b.sport.service.MemberService;
import a.b.sport.vo.Json2VO;
import a.b.sport.vo.LocationUtil;
import a.b.sport.vo.MemberVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired ServletContext sc;
	@Autowired MemberService memberService;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = {"/","/home"})
	public String home(Model model) {
		String path = sc.getRealPath("./json/location.json");
		LocationUtil location = new LocationUtil();
			model.addAttribute("lo",location.getArea2(path));
			model.addAttribute("location",location.getArea1(path));
	
		
		return "home";
	}
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String home1(MultipartHttpServletRequest request,@ModelAttribute MemberVO vo,Model model) {
		String path = sc.getRealPath("./upload/");
		
		//모든 파일 받기
		Map<String,MultipartFile> files = request.getFileMap();
		
		//1개 얻기
		CommonsMultipartFile cmf = (CommonsMultipartFile)files.get("file");
		
		String originName = cmf.getOriginalFilename();
		try {
			//서버 저장
			cmf.transferTo(new File(path+originName));
			vo.setThumnail(originName);
			logger.debug("저장완료,위치{}",path);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		String path1 = sc.getRealPath("./json/location.json");
		LocationUtil location = new LocationUtil();
		model.addAttribute("lo",location.getArea2(path));
		model.addAttribute("location",location.getArea1(path));
		logger.debug("넘어옴? {}",vo);
		memberService.insert(vo);
		System.out.println("등록완료");
		System.out.println(request.getParameter("selOne"));
		System.out.println(request.getParameter("selTwo"));
		return "home";
	}
	
}
