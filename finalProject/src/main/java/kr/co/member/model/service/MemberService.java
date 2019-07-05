package kr.co.member.model.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.collection.model.vo.Dress;
import kr.co.collection.model.vo.Makeup;
import kr.co.collection.model.vo.Studio;
import kr.co.collection.model.vo.StudioSelect;
import kr.co.collection.model.vo.StudioSelectList;
import kr.co.hall.vo.Hall;
import kr.co.hall.vo.HallSelect;
import kr.co.hall.vo.HallSelectList;
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
		
		Studio ms = new Studio(0,vo.getMemberId(),"S",ci.getCompanyName(),ci.getCompanyPhone(),"",ci.getCompanyAddr()
				,ci.getStudioPrice(),""/*확인필요스튜디오 컨텐츠*/,ci.getFileName(),ci.getFilePath()
				,0,0,0,hashTag,"","");
		
		return memberDao.insertStudio(ms);
	}

	public int insertDress(CompanyInfo ci, Member vo) {
		// TODO Auto-generated method stub
		String hashTag = ci.getHashTag();
		Dress md = new Dress(0,vo.getMemberId(),"D",ci.getCompanyName(),ci.getCompanyPhone(),"",ci.getCompanyAddr()
				,ci.getDressFittingPrice(),ci.getDressRentNum(),ci.getDressRentPrice(),ci.getJewelryPrice(),ci.getDressContent()
				,""/*ci.getDressFiitngTime()*/,ci.getDressMending(),ci.getDressParking(),ci.getFileName(),ci.getFilePath()
				,0,0,0,hashTag,"","");
	
		
		return memberDao.insertDress(md);
	}

	public int insertMakeup(CompanyInfo ci, Member vo) {
		// TODO Auto-generated method stub
		System.out.println("메이크업등록시작");
		String hashTag = ci.getHashTag();
		Makeup mm = new Makeup(0,vo.getMemberId(),"M",ci.getCompanyName(),ci.getCompanyPhone(),"",ci.getCompanyAddr(),ci.getMakeupBasicPrice(),ci.getMakeupParentPrice(),ci.getMakeupVisitorPrice(),ci.getFileName(),ci.getFilePath(),0,0,0,hashTag,"","");
		
		return memberDao.insertMakeup(mm);
	}

	public int insertHall(CompanyInfo ci, Member vo) {
		// TODO Auto-generated method stub
		
		String hashTag = ci.getHashTag();
		Hall mh = new Hall(0, vo.getMemberId(), "H", "", 
				ci.getCompanyName(), "", ci.getCompanyAddr(), 
				ci.getHallContent(), ci.getFileName(),
				ci.getFilePath(), ci.getHallPrice(), 
				ci.getHallMinPerson(), ci.getHallMaxPerson(), 
				0, ci.getHallFoodtype(), ci.getHallFoodmenu(), 
				ci.getHallFoodprice(), ci.getCompanyPhone(), 
				ci.getHallStartTime()+"/"+ci.getHallEndTime(), 
				ci.getHallServiceFood(), ci.getHallServiceFood(),
				ci.getHallServiceDrink(), ci.getHallServiceParking()
				, 0, 0, hashTag, "", "",null);
		
		return memberDao.insertHall(mh);
	}

	public int insertStudioOption(StudioSelectList ssl) {
		// TODO Auto-generated method stub
		int result= memberDao.insertStudioOption(ssl);
		
		return 0;
	}

	public int insertHallOption(HallSelectList hsl) {
		// TODO Auto-generated method stub
		int result = memberDao.insertHallOption(hsl);
		
		return result;
	}

	public int getStudioNo(String companyName, String memberId) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int getHallNo(String companyName, String memberId) {
		// TODO Auto-generated method stub
		return 0;
	}

}
