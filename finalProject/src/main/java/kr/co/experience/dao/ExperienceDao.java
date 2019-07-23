package kr.co.experience.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.experience.vo.Experience;
import kr.co.experience.vo.ExperienceComment;
import kr.co.member.model.vo.Member;
import kr.co.reservation.model.vo.Reservation;
@Repository("experienceDao")
public class ExperienceDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	public ArrayList<Experience> ExperienceAll() {
		
		List<Experience> list = sqlSession.selectList("experienceAll");
		
		return (ArrayList<Experience>) list;
	}
	public Experience experienceDetail(int experienceNo) {
		
		return sqlSession.selectOne("experience.experienceDetail",experienceNo);
	}
	
	public int insertexperience(Experience ex) {
		
		return sqlSession.insert("experience.insertexperience",ex);
	}
	public List<Experience> selectList(int start, int end) {

		Map<String, Integer> map = new HashMap<String,Integer>();
		map.put("start", start);
		map.put("end", end);
	
		return sqlSession.selectList("experience.experienceselectList",map);
	}
	public int totalCount() {
		List list =null;
		list = sqlSession.selectList("experience.experienceAll");
		int count = list.size();
		return count;
	}
	public int experienceCommentInsert(ExperienceComment ec) {
		System.out.println("댓글 dao 거침 ");
		
		
		return sqlSession.insert("experience.experienceCommentInsert",ec);
	}
	public ArrayList<ExperienceComment> selectCommentList(int experienceNo) {
			
		
		List list  = sqlSession.selectList("experience.selectCommentList",experienceNo);
		
		return (ArrayList<ExperienceComment>)list;
	}
	public int updateComment(ExperienceComment e) {
		System.out.println(e.getExperienceCommentNo()+"컨트롤러오냐");
		
		return sqlSession.update("experience.updateComment",e);
	}
	public int exCommentRegs(ExperienceComment e) {
		
		return sqlSession.insert("experience.exCommentRegs",e);
	}
	public int CommentDelete(int experienceCommentNo) {
		
		return sqlSession.delete("experience.CommentDelete",experienceCommentNo);
	}
	public List<Experience> selectListex(int start, int end, String type, String keyword) {
		Map<String, String> map = new HashMap<String,String>();
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		map.put("type", type);
		map.put("keyword", keyword);
		return sqlSession.selectList("experience.selectListex",map);
		
	}
	public int totalSearExperience(String type, String keyword) {
		Map<String, String> map = new HashMap<String,String>();
		map.put("type", type);
		map.put("keyword", keyword);
		int result = sqlSession.selectOne("experience.totalSearExperience",map);
		System.out.println("DAO토탈 서취"+type+keyword);
		return result;
	}
	public ArrayList<Experience> selectId(String memberId) {
		// TODO Auto-generated method stub
		List list  = sqlSession.selectList("experience.selectId",memberId);
		return (ArrayList<Experience>)list;
	}
	public int exDelete(int experienceNo) {
		
		
		return sqlSession.delete("experience.exDelete",experienceNo);
	}
	public int upDateexperience(Experience ex) {
		
		return sqlSession.update("experience.upDateexperience",ex);
	}
	public Experience eFind(int experienceNo) {
		
		return sqlSession.selectOne("experience.eFind",experienceNo);
	}
	public ArrayList<Reservation> selectSearch(String memberId) {
		
		List list = sqlSession.selectList("reservation.selectSearch",memberId);
		return (ArrayList<Reservation>)list ;
	}
	public int totalCountId(String memberId) {
		
		List list =null;
		list = sqlSession.selectList("experience.experienceAll2",memberId);
		int count = list.size();
		return count;
	}
	public List<Experience> selectListId(int start, int end, String memberId) {
		Map<String, String> map = new HashMap<String,String>();
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		map.put("memberId",memberId);
		return sqlSession.selectList("experience.experienceselectList",map);
	}
	
	
}
