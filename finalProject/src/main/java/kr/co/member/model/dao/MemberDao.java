package kr.co.member.model.dao;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import kr.co.collection.model.vo.Dress;
import kr.co.collection.model.vo.Makeup;
import kr.co.collection.model.vo.Studio;
import kr.co.collection.model.vo.StudioSelectList;
import kr.co.hall.vo.Hall;
import kr.co.hall.vo.HallSelectList;
import kr.co.member.model.vo.Member;
import kr.co.reservation.model.vo.Reservation;
import kr.co.scrapbook.model.vo.Scrapbook;
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

	public Studio selectOneStudioMember(Member vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.selectOneStudioMember",vo);
	}

	public Dress selectOneDressMember(Member vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.selectOneDressMember",vo);
	}

	public Hall selectOneHallMember(Member vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.selectOneHallMember",vo);
	}

	public Makeup selectOneMakeupMember(Member vo) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectOne("member.selectOneMakeupMember",vo);
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
		return sqlSession.selectOne("member.companyReservation");
	}

}
