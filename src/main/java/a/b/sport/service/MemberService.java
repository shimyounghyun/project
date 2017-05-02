package a.b.sport.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import a.b.sport.dao.MemberDAO;
import a.b.sport.vo.MemberVO;

@Service
public class MemberService {

	@Autowired
	private MemberDAO memberDAO;

	// 유저등록
	public void insert(MemberVO vo) {
		memberDAO.insert(vo);
	}

	// 아이디중복체크
	public int idchk(String userid) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userid", userid);
		return memberDAO.idchk(map);
	}

	// 로그인
	public MemberVO selectOneByEmailAndPassword(HashMap<String, Object> map) {
		return memberDAO.selectOneByEmailAndPassword(map);
	}
}
