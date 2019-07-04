package kr.co.member.model.dao;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import kr.co.collection.model.vo.Dress;
import kr.co.collection.model.vo.Makeup;
import kr.co.collection.model.vo.Studio;
import kr.co.hall.vo.Hall;
import kr.co.member.model.vo.Member;
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

}
