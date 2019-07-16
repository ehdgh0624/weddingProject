package kr.co.member.model.dao;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import kr.co.collection.model.vo.Dress;
import kr.co.collection.model.vo.Makeup;
import kr.co.collection.model.vo.Studio;
import kr.co.collection.model.vo.StudioSelect;
import kr.co.collection.model.vo.StudioSelectList;
import kr.co.gallery.model.vo.Gallery;
import kr.co.hall.vo.Hall;
import kr.co.hall.vo.HallSelectList;
import kr.co.member.model.vo.Member;
import kr.co.reservation.model.vo.Reservation;
import kr.co.scrapbook.model.vo.Scrapbook;
import kr.co.simulator.model.vo.Simulator;
import kr.co.simulator.model.vo.SimulatorSelect;
@Repository("memberDao")
public class MemberDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	
	public Member selectOneMember(Member memberSet) {
		// TODO Auto-generated method stub
		System.out.println("여긴 selectOneMember");
		return sqlSession.selectOne("member.selectOneMember",memberSet);
	}

	public int insertMember(Member vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("member.insertMember",vo);
	}

	public List<Studio> selectAllStudioMember(Member vo) {
		// TODO Auto-generated method stub
		System.out.println("스튜디오");
		
		return sqlSession.selectList("member.selectAllStudioMember",vo);
		
	}

	public List<Dress> selectAllDressMember(Member vo) {
		// TODO Auto-generated method stub
		System.out.println("드레스");
		return sqlSession.selectList("member.selectAllDressMember",vo);
	}

	public List<Hall> selectAllHallMember(Member vo) {
		// TODO Auto-generated method stub
		System.out.println("홀");
		return sqlSession.selectList("member.selectAllHallMember",vo);
	}

	public List<Makeup> selectAllMakeupMember(Member vo) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList("member.selectAllMakeupMember",vo);
	}

	public int insertStudio(Studio ms) {
		// TODO Auto-generated method stub
		if(ms.getStudioFilename()== null) {
			ms.setStudioFilename("");
		}
		if(ms.getStudioFilepath() == null) {
			ms.setStudioFilepath("");	
		}
		
		return sqlSession.insert("member.insertStudio",ms);
	}

	public int insertDress(Dress md) {
		// TODO Auto-generated method stub
		
		System.out.println("드레스"+md);
		if(md.getDressFilename()== null) {
			md.setDressFilename("");
		}
		if(md.getDressFilepath() == null) {
			md.setDressFilepath("");		
		}
		
		return sqlSession.insert("member.insertDress",md);
	}

	public int insertMakeup(Makeup mm) {
		// TODO Auto-generated method stub
		System.out.println(mm);
		
		if(mm.getMakeupFilename() == null) {
			mm.setMakeupFilename(" ");
		}
		if(mm.getMakeupFilepath() == null) {
			mm.setMakeupFilepath(" ");		
		}
		return sqlSession.insert("member.insertMakeup",mm);
	}

	public int insertHall(Hall mh) {
		// TODO Auto-generated method stub
		if(mh.getHallImg() == null) {
			mh.setHallImg("");
		}
		if(mh.getHallPath() == null) {
			mh.setHallPath("");		
		}
		return sqlSession.insert("member.insertHall",mh);
	}

	public int insertHallOption(HallSelectList hsl) {
		// TODO Auto-generated method stub
		int result=0;
		for(int i=0;i<hsl.getList().size();i++) {
			result=sqlSession.insert("member.insertHallOption",hsl.getList().get(i));
		}
		return result;
	}

	public int insertStudioOption(StudioSelectList ssl) {
		// TODO Auto-generated method stub
		int result=0;
		for(int i=0; i<ssl.getList().size();i++) {
			result=sqlSession.insert("member.insertStudioOption", ssl.getList().get(i));
		}
		return result;
	}
	
	public List<Reservation> getAllReservList(Member vo) {
		// TODO Auto-generated method stub
		
		
		List<Reservation> list = sqlSession.selectList("member.selectAllreserv",vo);
	
		
		return list;
	}

	public int deleteMember(String id) {
		// TODO Auto-generated method stub
		System.out.println("여긴 delete멤버");
		Member vo = new Member();
		System.out.println(vo.getMemberId());
		vo.setMemberId(id);
		
		return sqlSession.delete("member.deleteMember", vo);

	}

	public int updateMember(Member vo) {
		// TODO Auto-generated method stub
		
		System.out.println(vo);
		System.out.println("여긴 정보수정");
		
		
		return sqlSession.update("member.updateMember",vo);
	}

	public int getStudioNo(Studio s) {
		// TODO Auto-generated method stub
		Studio vo =sqlSession.selectOne("member.getStudioNo",s);
		
		return vo.getStudioNo();
	}

	public int getHallNo(Hall h) {
		// TODO Auto-generated method stub
		Hall vo = sqlSession.selectOne("member.getHallNo", h);
		
		return vo.getHallNo();
	}

	public List<Scrapbook> getCollectionlist(Member m) {
		// TODO Auto-generated method stub
		
		
		return sqlSession.selectList("member.getCollectionlist",m);
	}

	public Studio getStudio(int prdNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("studio.viewSelectOne",prdNo);
	}

	public Dress getDress(int prdNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("dress.viewSelectOne",prdNo);
	}

	public Makeup getMakeupList(int prdNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("makeup.viewSelectOne",prdNo);
	}

	public Hall getHallList(int prdNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("hall.viewSelectOne",prdNo);
	}

	public List<Reservation> getComanyRservation(Member vo) {
		// TODO Auto-generated method stub
		System.out.println("여긴왔냐 ?");
		System.out.println(vo);
		return sqlSession.selectList("member.companyReservation",vo);
	}

	public Hall selectOneHallNumber(int no) {
		// TODO Auto-generated method stub
		
		//홀은 현재 미구현
		return sqlSession.selectOne("hall.viewSelectOne",no);
	}

	public Makeup selectOneMakeupNumber(int no) {
		// TODO Auto-generated method stub
		return (Makeup)sqlSession.selectOne("makeup.viewSelectOne",no);
	}

	public Dress selectOneDressNumber(int no) {
		// TODO Auto-generated method stub
		return (Dress)sqlSession.selectOne("dress.viewSelectOne",no);
	}

	public Studio selectoneStudioNumber(int no) {
		// TODO Auto-generated method stub
		System.out.println(no);
		return (Studio)sqlSession.selectOne("studio.viewSelectOne",no);
	}

	public List<StudioSelect> selectListStudioOption(int studioNo, int studioOptionType) {
		// TODO Auto-generated method stub
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("studioNo", studioNo);
		map.put("studioOptionType", studioOptionType);
		return sqlSession.selectList("studioSelect.selectListOption",map);
	}

	public List<Gallery> selectListGallery(int galleryNo, String galleryCode) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("galleryNo", galleryNo);
		map.put("galleryCode", galleryCode);
		return sqlSession.selectList("gallery.selectListGallery",map);
	}

	public int deleteStudioOption(int no, int type) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("studioNo", no);
		map.put("studioType", type);
		return sqlSession.delete("studioSelect.deleteStudioOption",map );
	}

	public int deleteOneStudioOption(int optionNo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("studioSelectNo", optionNo);
		return sqlSession.delete("studioSelect.deleteOneStudioOption",map);
	}

	public int updateOneStudioOption(int no, String option, String price) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		int priceNumber=Integer.parseInt(price);
		map.put("studioSelectNo", no);
		map.put("studioOption",option);
		map.put("studioOptionPrice", priceNumber);
		
		System.out.println(option+price+no);
		
		return sqlSession.update("studioSelect.updateOneStduioOption",map);
	}

	public int addStudionOption(StudioSelect s) {
		// TODO Auto-generated method stub
		return sqlSession.insert("studioSelect.insertStudioOption",s);
	}
	
	public List<Simulator> getSimulator(Member vo) {
		
		return sqlSession.selectList("simulator.getSimulator",vo);
	}

	public List<SimulatorSelect> getMyWeddingCost(int s) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("simulator.mySelectList",s);
	}

}
