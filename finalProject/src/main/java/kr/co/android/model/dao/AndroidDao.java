package kr.co.android.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.member.model.vo.Member;
import kr.co.reservation.model.vo.Reservation;

@Repository("androidDao")
public class AndroidDao {
	@Autowired
	SqlSessionTemplate sqlSession;

	public Member login(Member vo) {
		// TODO Auto-generated method stub
		System.out.println("안드로이드가 접근해서 로그인중 여긴  DAO");
		return sqlSession.selectOne("member.selectOneMember",vo);
	}

	public List<Reservation> getRservation(String memberId) {
		// TODO Auto-generated method stub
		System.out.println("안드로이드가 접근해서 회원 예약결과를 가져가는중");
		Member m = new Member();
		m.setMemberId(memberId);
		
		return sqlSession.selectList("member.selectAllreserv",m);
	}


	public int saveOneTimeLogin(String number, String memberId) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);
		map.put("number", number);
		
		return sqlSession.insert("member.insertOneTime",map);
	}

	public int deleteOneTimeLogin(String memberId) {
		// TODO Auto-generated method stub
		return sqlSession.delete("member.deleteOneTimeLogin",memberId);
	}

}
