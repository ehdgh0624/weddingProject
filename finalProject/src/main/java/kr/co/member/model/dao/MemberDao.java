package kr.co.member.model.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.hall.vo.MemberHall;
import kr.co.member.model.vo.CompanyInfo;
import kr.co.member.model.vo.Member;
import kr.co.member.model.vo.MemberDress;
import kr.co.member.model.vo.MemberMakeup;
import kr.co.member.model.vo.MemberStudio;
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

	public MemberStudio selectOneStudioMember(Member vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.selectOneStudioMember",vo);
	}

	public MemberDress selectOneDressMember(Member vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.selectOneDressMember",vo);
	}

	public MemberHall selectOneHallMember(Member vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.selectOnehallMember",vo);
	}

	public MemberMakeup selectOneMakeupMember(Member vo) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectOne("member.selectOneMakeupMember",vo);
	}

	public int insertStudio(MemberStudio ms) {
		// TODO Auto-generated method stub
		if(ms.getFileName()== null) {
			ms.setFileName("");
		}
		if(ms.getFilePath() == null) {
			ms.setFilePath("");		
		}
		
		return sqlSession.insert("member.insertStudio",ms);
	}

	public int insertDress(MemberDress md) {
		// TODO Auto-generated method stub
		if(md.getDressFileName()== null) {
			md.setDressFileName("");
		}
		if(md.getDressFilePath() == null) {
			md.setDressFilePath("");		
		}
		
		return sqlSession.insert("member.insertDress",md);
	}

	public int insertMakeup(MemberMakeup mm) {
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

	public int insertHall(MemberHall mh) {
		// TODO Auto-generated method stub
		if(mh.getHallImg() == null) {
			mh.setHallImg("");
		}
		if(mh.getHallPath() == null) {
			mh.setHallPath("");		
		}
		return sqlSession.insert("member.insertHall",mh);
	}

}
