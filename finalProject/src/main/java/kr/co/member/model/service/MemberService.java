package kr.co.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.member.model.dao.MemberDao;
import kr.co.member.model.vo.CompanyInfo;
import kr.co.member.model.vo.Member;
import kr.co.member.model.vo.MemberDress;
import kr.co.member.model.vo.MemberHall;
import kr.co.member.model.vo.MemberMakeup;
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

	public MemberMakeup selctOneMakeupMember(Member vo) {
		// TODO Auto-generated method stub
		return memberDao.selectOneMakeupMember(vo);
	}

	public int insertStudio(CompanyInfo ci, Member vo) {
		// TODO Auto-generated method stub
		String hashTag = ci.getHashTag();
		
		MemberStudio ms = new MemberStudio(0, vo.getMemberId(), "S", 
				ci.getCompanyName(), ci.getCompanyPhone(), "", 
				ci.getCompanyAddr(), ci.getStudioPrice(), ci.getFileName(),
				ci.getFilePath(), 0, 0, hashTag, "", "");
		
		return memberDao.insertStudio(ms);
	}

	public int insertDress(CompanyInfo ci, Member vo) {
		// TODO Auto-generated method stub
		
		MemberDress md = new MemberDress(0, vo.getMemberId(), "D", 
				ci.getCompanyName(), ci.getCompanyPhone(), "", 
				ci.getCompanyAddr(), ci.getDressFittingPrice(), 
				ci.getDressRentNum(), ci.getDressRentPrice(), 
				ci.getJewelryPrice(), ci.getDressContent(), 
				ci.getDressFiitngTime(), ci.getDressMending(), 
				ci.getDressParking(), ci.getFileName(), ci.getFilePath(), 
				0, 0,ci.getHashTag(), "", "");
	
		
		return memberDao.insertDress(md);
	}

	public int insertMakeup(CompanyInfo ci, Member vo) {
		// TODO Auto-generated method stub
		System.out.println("메이크업등록시작");
		MemberMakeup mm = new MemberMakeup(0, vo.getMemberId(), "M", 
				ci.getCompanyName(), ci.getCompanyPhone(), "", 
				ci.getCompanyAddr(), ci.getMakeupBasicPrice(),ci.getMakeupParent(),ci.getMakeupVisitor(),
				ci.getMakeupParentPrice(), ci.getMakeupVisitorPrice(),
				ci.getFileName(), ci.getFilePath(), 0, 0, 
				ci.getHashTag(), "", "");
		
		return memberDao.insertMakeup(mm);
	}

	public int insertHall(CompanyInfo ci, Member vo) {
		// TODO Auto-generated method stub
		
		
		MemberHall mh = new MemberHall(0,vo.getMemberId(), "H", 
				ci.getCompanyName(), "", ci.getCompanyAddr(), 
				ci.getHallContent(), ci.getFileName(), ci.getFilePath(), 
				ci.getHallPrice(), ci.getHallMinPerson(), 
				ci.getHallMaxPerson(), ci.getHallFoodtype(), 
				ci.getHallFoodmenu(), ci.getHallFoodprice(),
				ci.getCompanyPhone(), ci.getHallStartTime()+"/"+ci.getHallEndTime(), 
				ci.getHallServiceFood(), ci.getHallServiceDrink(),
				ci.getHallServiceParking(), 0, 0,
				ci.getHashTag(),"","");
		
		return memberDao.insertHall(mh);
	}

}
