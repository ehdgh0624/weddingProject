package kr.co.android.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.android.model.dao.AndroidDao;
import kr.co.member.model.vo.Member;

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
	
	
}
