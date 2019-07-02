package kr.co.member.model.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.member.model.vo.Member;
import kr.co.member.model.vo.MemberDress;
import kr.co.member.model.vo.MemberHall;
import kr.co.member.model.vo.MemberMakup;
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

	public MemberMakup selectOneMakeupMember(Member vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.selectOneMakeupMember",vo);
	}

}
