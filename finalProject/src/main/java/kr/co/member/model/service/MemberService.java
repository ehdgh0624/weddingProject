package kr.co.member.model.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.collection.model.vo.Dress;
import kr.co.collection.model.vo.Makeup;
import kr.co.collection.model.vo.Studio;
import kr.co.collection.model.vo.StudioSelect;
import kr.co.collection.model.vo.StudioSelectList;
import kr.co.common.method.Location;
import kr.co.gallery.model.vo.Gallery;
import kr.co.hall.vo.Hall;
import kr.co.hall.vo.HallSelect;
import kr.co.hall.vo.HallSelectList;
import kr.co.member.model.dao.MemberDao;
import kr.co.member.model.vo.CompanyInfo;
import kr.co.member.model.vo.Member;
import kr.co.reservation.model.vo.Reservation;
import kr.co.scrapbook.model.vo.Scrapbook;
import kr.co.simulator.model.vo.Simulator;
import kr.co.simulator.model.vo.SimulatorSelect;

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

	public List<Studio> selectAllStudioMember(Member vo) {
		// TODO Auto-generated method stub
		
		
		return memberDao.selectAllStudioMember(vo);
	}

	public List<Dress> selectAllDressMember(Member vo) {
		// TODO Auto-generated method stub
		return memberDao.selectAllDressMember(vo);
	}

	public List<Hall> selectAllHallMember(Member vo) {
		// TODO Auto-generated method stub
		return memberDao.selectAllHallMember(vo);
	}

	public List<Makeup> selectAllMakeupMember(Member vo) {
		// TODO Auto-generated method stub
		return memberDao.selectAllMakeupMember(vo);
	}

	public int insertStudio(CompanyInfo ci, Member vo) {
		// TODO Auto-generated method stub
		String hashTag = ci.getHashTag();
		System.out.println(ci);
		
		String locCode=new Location().getLoccode(ci.getCompanyAddr());
			
		Studio ms = new Studio(0,vo.getMemberId(),"S",ci.getCompanyName(),ci.getCompanyPhone(),locCode,ci.getCompanyAddr()
				,ci.getStudioPrice(),ci.getCompanyContent(),ci.getStudioTime(),ci.getStudioCamera(),ci.getFileNames(),ci.getFilePath()
				,0,0,0,hashTag,ci.getCompanyLatitude(),ci.getCompanyLongtitude());
		
		System.out.println(ms);
		
		return memberDao.insertStudio(ms);
	}

	public int insertDress(CompanyInfo ci, Member vo) {
		// TODO Auto-generated method stub
		String hashTag = ci.getHashTag();
		String locCode=new Location().getLoccode(ci.getCompanyAddr());
		
		System.out.println("컴패니인포"+ci);
		System.out.println("멤붜"+vo);
		Dress md = new Dress(0,vo.getMemberId(),"D",ci.getCompanyName(),ci.getCompanyPhone(),locCode,ci.getCompanyAddr()
				,ci.getDressFittingPrice(),ci.getDressRentNum(),ci.getDressRentPrice(),ci.getJewelryPrice(),ci.getDressContent()
				,ci.getDressFittingTime(),ci.getDressMending(),ci.getDressParking(),ci.getFileNames(),ci.getFilePath()
				,0,0,0,hashTag,ci.getCompanyLatitude(),ci.getCompanyLongtitude());
	
		
		return memberDao.insertDress(md);
	}

	public int insertMakeup(CompanyInfo ci, Member vo) {
		// TODO Auto-generated method stub
		System.out.println("메이크업등록시작");
		String locCode=new Location().getLoccode(ci.getCompanyAddr());
		String hashTag = ci.getHashTag();
		Makeup mm = new Makeup(0,vo.getMemberId(),"M",
				ci.getCompanyName(),ci.getCompanyPhone(),
				locCode,ci.getCompanyAddr(),ci.getMakeupBasicPrice(),
				ci.getMakeupParentPrice(),ci.getMakeupVisitorPrice(),ci.getCompanyContent(),
				ci.getFileNames(),ci.getFilePath(),0,0,0,hashTag,
				ci.getCompanyLatitude(),ci.getCompanyLongtitude());
		
		return memberDao.insertMakeup(mm);
	}

	public int insertHall(CompanyInfo ci, Member vo) {
		// TODO Auto-generated method stub
		
		String hashTag = ci.getHashTag();
		String locCode=new Location().getLoccode(ci.getCompanyAddr());
		
		Hall mh = new Hall(0, vo.getMemberId(), "H", ci.getHallType(), 
				ci.getCompanyName(), locCode, ci.getCompanyAddr(), 
				ci.getCompanyContent(), ci.getFileNames(),
				ci.getFilePath(), ci.getHallPrice(), 
				ci.getHallMinPerson(), ci.getHallMaxPerson(), 
				0/*홀별점*/, ci.getHallFoodtype(), ci.getHallFoodmenu(), 
				ci.getHallFoodprice(), ci.getCompanyPhone(), 
				ci.getHallSelectTime(), 
				ci.getHallServiceFood(), ci.getHallServiceAudio(),
				ci.getHallServiceDrink(), ci.getHallServiceParking()
				, 0, 0, hashTag,ci.getCompanyLatitude(),ci.getCompanyLongtitude(),null);
		
		System.out.println(mh);
		return memberDao.insertHall(mh);
	}

	public int insertStudioOption(StudioSelectList ssl) {
		// TODO Auto-generated method stub
		int result= memberDao.insertStudioOption(ssl);
		
		return result;
	}

	public int insertHallOption(HallSelectList hsl) {
		// TODO Auto-generated method stub
		int result = memberDao.insertHallOption(hsl);
		
		return result;
	}
	
	public int getStudioNo(String companyName, String memberId) {
		// TODO Auto-generated method stub
		Studio s = new Studio();
		s.setStudioName(companyName);
		s.setMemberId(memberId);
		
		return memberDao.getStudioNo(s);
	}

	public int getHallNo(String companyName, String memberId) {
		// TODO Auto-generated method stub
		Hall h =new Hall();
		h.setMemberId(memberId);
		h.setHallName(companyName);
		
		return memberDao.getHallNo(h);
	}
	
	public List<Reservation> getAllReservList(Member vo) {
		// TODO Auto-generated method stub
		
		List<Reservation> list=memberDao.getAllReservList(vo);
		return list;
	}

	public int deleteMember(String id) {
		// TODO Auto-generated method stub
		
		int result = memberDao.deleteMember(id);
		
		return result;
	}

	public int updateMember(Member vo) {
		// TODO Auto-generated method stub
		int result = memberDao.updateMember(vo);
		
		return result;
	}

	public List<Scrapbook> getCollectionlist(Member m) {
		// TODO Auto-generated method stub
		
		return memberDao.getCollectionlist(m);
	}

	public Studio getStudioScrapList(int prdNo) {
		// TODO Auto-generated method stub
		return memberDao.getStudio(prdNo);
	}

	public Dress getDressScrapList(int prdNo) {
		// TODO Auto-generated method stub
		return memberDao.getDress(prdNo);
	}

	public Makeup getMakeupList(int prdNo) {
		// TODO Auto-generated method stub
		return memberDao.getMakeupList(prdNo);
	}

	public Hall getHallScrapList(int prdNo) {
		// TODO Auto-generated method stub
		return  memberDao.getHallList(prdNo);
	}

	public List<Reservation> getReservationList(Member vo) {
		// TODO Auto-generated method stub
		return memberDao.getComanyRservation(vo);
	}

	public Hall selectOneHallNumber(int no) {
		// TODO Auto-generated method stub
		return memberDao.selectOneHallNumber(no);
	}

	public Makeup selectOneMakeupNumber(int no) {
		// TODO Auto-generated method stub
		System.out.println(no);
		return memberDao.selectOneMakeupNumber(no);
	}

	public Dress selectOneDressNumber(int no) {
		// TODO Auto-generated method stub
		return memberDao.selectOneDressNumber(no);
	}

	public Studio selectOneStudioNumber(int no) {
		// TODO Auto-generated method stub
		return memberDao.selectoneStudioNumber(no);
	}

	public ArrayList<StudioSelect> selectListStudioOptionNumber(int studioNo, int studioOptionType) {
		// TODO Auto-generated method stub
		return (ArrayList<StudioSelect>)memberDao.selectListStudioOption(studioNo, studioOptionType);
	}

	public ArrayList<Gallery> selectListGalleryNumber(int galleryNo, String galleryCode) {
		// TODO Auto-generated method stub
		return (ArrayList<Gallery>)memberDao.selectListGallery(galleryNo, galleryCode);
	}

	public int deleteStudioOption(int no, int type) {
		// TODO Auto-generated method stub
		
		return memberDao.deleteStudioOption(no,type);
	}

	public int deleteOneStudioOption(int optionNo) {
		// TODO Auto-generated method stub
		return memberDao.deleteOneStudioOption(optionNo);
	}

	public int updateOneStudioOption(int no, String option, String price) {
		// TODO Auto-generated method stub
		return memberDao.updateOneStudioOption(no,option,price);
	}

	public int addStudioOption(StudioSelect s) {
		// TODO Auto-generated method stub
		return memberDao.addStudionOption(s);
	}

	public List<SimulatorSelect> getMyWeddingCost(int s) {
		// TODO Auto-generated method stub
		return memberDao.getMyWeddingCost(s);
	}

	public List<Simulator> getSimulator(Member vo) {
		// TODO Auto-generated method stub
		return memberDao.getSimulator(vo);
	}

	public List<Gallery> getGalleryList(String no, String code) {
		// TODO Auto-generated method stub
		return memberDao.getGalleryList(no,code);
	}

	public int deleteGallery(String filepath) {
		// TODO Auto-generated method stub
		return memberDao.deleteGallery(filepath);
	}

	public int addGall(ArrayList<Gallery> gList) {
		// TODO Auto-generated method stub
		int result=0;
		for(int i=0;i<gList.size();i++) {
			result+=memberDao.addGall(gList.get(i));
		}
		
		return result;
	}

	public Member checkId(String id) {
		// TODO Auto-generated method stub
		return memberDao.checkId(id);
	}

	public int changePw(String pwinput, String id) {
		// TODO Auto-generated method stub
		return memberDao.changePw(pwinput,id);
	}

	

	public String getMemberId(String number) {
		// TODO Auto-generated method stub
		return memberDao.getMemberId(number);
	}

	public Member selectOneMemberEasy(String memberId) {
		// TODO Auto-generated method stub
		return memberDao.selectOneMemberOnlyId(memberId);
	}

	public void deleteEasyNumber(String memberId) {
		// TODO Auto-generated method stub
		memberDao.deleteEasyNumber(memberId);
	}

	public Member searchPw(String memberId, String email) {
		// TODO Auto-generated method stub
		System.out.println(memberId+email+"memberService");
		return memberDao.searchPw(memberId,email);
		
	}

	public List<Member> getIdList(String email) {
		// TODO Auto-generated method stub
		
		
		return memberDao.getIdLIst(email);
	}

	public int updateStudioInfo(Studio s) {
		// TODO Auto-generated method stub
		
		return memberDao.updateStudioInfo(s);
	}

	public int updateDressInfo(Dress d) {
		// TODO Auto-generated method stub
		return memberDao.updateDressInfo(d);
	}

	public int updateMakeupInfo(Makeup m) {
		// TODO Auto-generated method stub
		
		return memberDao.updateMakeup(m);
		
	}

	public int updateOneHallOption(int hallNo, String hallType, String price, String etc) {
		// TODO Auto-generated method stub
		return memberDao.updateOneHallOption(hallNo,hallType,price,etc);
	}

	public int hallOptionAdd(HallSelect hsl2) {
		// TODO Auto-generated method stub
		
				
		
		return memberDao.HallOptionAdd(hsl2);
	}

	public ArrayList<StudioSelect> selectListHallOptionNumber(int no) {
		// TODO Auto-generated method stub
		return (ArrayList<StudioSelect>) memberDao.selectListHallOptionNumber(no);
	}

	public int updateHallInfo(Hall h) {
		// TODO Auto-generated method stub
		
		return memberDao.updateHallInfo(h);
		
	}



}
