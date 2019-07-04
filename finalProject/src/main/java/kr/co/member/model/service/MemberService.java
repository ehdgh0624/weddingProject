package kr.co.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.collection.model.vo.Dress;
import kr.co.collection.model.vo.Makeup;
import kr.co.collection.model.vo.Studio;
import kr.co.hall.vo.Hall;
import kr.co.member.model.dao.MemberDao;
import kr.co.member.model.vo.CompanyInfo;
import kr.co.member.model.vo.Member;

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

	public Studio selectOneStudioMember(Member vo) {
		// TODO Auto-generated method stub
		
		
		return memberDao.selectOneStudioMember(vo);
	}

	public Dress selectOneDressMember(Member vo) {
		// TODO Auto-generated method stub
		return memberDao.selectOneDressMember(vo);
	}

	public Hall selectOneHallMember(Member vo) {
		// TODO Auto-generated method stub
		return memberDao.selectOneHallMember(vo);
	}

	public Makeup selctOneMakeupMember(Member vo) {
		// TODO Auto-generated method stub
		return memberDao.selectOneMakeupMember(vo);
	}

	public int insertStudio(CompanyInfo ci, Member vo) {
		// TODO Auto-generated method stub
		String hashTag = ci.getHashTag();
		
		Studio ms = new Studio();
		
		return memberDao.insertStudio(ms);
	}

	public int insertDress(CompanyInfo ci, Member vo) {
		// TODO Auto-generated method stub
		
		Dress md = new Dress();
	
		
		return memberDao.insertDress(md);
	}

	public int insertMakeup(CompanyInfo ci, Member vo) {
		// TODO Auto-generated method stub
		System.out.println("메이크업등록시작");
		Makeup mm = new Makeup();
		
		return memberDao.insertMakeup(mm);
	}

	public int insertHall(CompanyInfo ci, Member vo) {
		// TODO Auto-generated method stub
		
		
		Hall mh = new Hall();
		
		return memberDao.insertHall(mh);
	}

}
