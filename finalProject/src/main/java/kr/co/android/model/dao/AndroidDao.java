package kr.co.android.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.member.model.vo.Member;

@Repository("androidDao")
public class AndroidDao {
	@Autowired
	SqlSessionTemplate sqlSession;

	public Member login(Member vo) {
		// TODO Auto-generated method stub
		System.out.println("안드로이드가 접근해서 로그인중 여긴  DAO");
		return sqlSession.selectOne("member.selectOneMember",vo);
	}

}
