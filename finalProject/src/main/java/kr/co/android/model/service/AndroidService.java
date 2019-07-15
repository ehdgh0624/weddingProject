package kr.co.android.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.android.model.dao.AndroidDao;
import kr.co.member.model.vo.Member;
import kr.co.reservation.model.vo.Reservation;

@Service("androidService")
public class AndroidService {

	
	@Autowired
	@Qualifier(value="androidDao")
	private AndroidDao androidDao;

	public Member login(String memberId, String memberPw) {
		// TODO Auto-generated method stub
		Member vo = new Member();
		vo.setMemberId(memberId);
		vo.setMemberPw(memberPw);
			
		return androidDao.login(vo);
	}

	public List<Reservation> getReservation(String memberId) {
		// TODO Auto-generated method stub
		
		return androidDao.getRservation(memberId);
	}
	
	
}
