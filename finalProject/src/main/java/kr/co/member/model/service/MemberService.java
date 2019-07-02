package kr.co.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.member.model.dao.MemberDao;
import kr.co.member.model.vo.Member;
import kr.co.member.model.vo.MemberDress;
import kr.co.member.model.vo.MemberHall;
import kr.co.member.model.vo.MemberMakup;
import kr.co.member.model.vo.MemberStudio;
@Service("memberService")
public class MemberService {
	
	@Autowired
	@Qualifier(value="memberDao")
	private MemberDao memberDao;
	
	public Member selectOneMember(Member memberSet) {
		// TODO Auto-generated method stub
		
		return memberDao.selectOneMember(memberSet);
	}

	public int insertMember(Member vo) {
		// TODO Auto-generated method stub
		
		
		return memberDao.insertMember(vo);
	}

	public MemberStudio selectOneStudioMember(Member vo) {
		// TODO Auto-generated method stub
		
		
		return memberDao.selectOneStudioMember(vo);
	}

	public MemberDress selectOneDressMember(Member vo) {
		// TODO Auto-generated method stub
		return memberDao.selectOneDressMember(vo);
	}

	public MemberHall selectOneHallMember(Member vo) {
		// TODO Auto-generated method stub
		return memberDao.selectOneHallMember(vo);
	}

	public MemberMakup selctOneMakeupMember(Member vo) {
		// TODO Auto-generated method stub
		return memberDao.selectOneMakeupMember(vo);
	}

}
