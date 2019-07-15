package kr.co.qna.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.qna.vo.QnA;

@Repository("qnaDao")
public class QnADao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int insertQna(QnA qna) {
		
		return sqlSession.insert("qna.insertQna", qna);
	}

	public int totalList() {
		
		return sqlSession.selectOne("qna.qnaCountAll");
	}

	public ArrayList<QnA> qnaAllList(int start, int end) {
		Map<String, Integer> map = new HashMap<String,Integer>();
		map.put("start", start);
		map.put("end", end);
		List list = sqlSession.selectList("qna.qnaAllList",map);
		return (ArrayList<QnA>)list;
	}

	public QnA selectOneQna(int qnaNo) {
		QnA q = sqlSession.selectOne("qna.selectOneQna", qnaNo);
		return q;
	}

	public int pwChk(int num, String pass) {
		Map<String, String> map = new HashMap<String,String>();
		map.put("num", String.valueOf(num));
		map.put("pass", pass);
		return sqlSession.selectOne("qna.pwChk",map);
		}

	public int commentUpdate(QnA qna) {
		
		return sqlSession.update("qna.commentUpdate",qna);
	}

	public int updateQna(QnA qna) {
		return sqlSession.update("qna.updateQna",qna);
	}

	public int deleteQna(String qnaNo) {
		return sqlSession.delete("qna.deleteQna",Integer.parseInt(qnaNo));
	}

	public int totalSearchList(String keyword) {
		return sqlSession.selectOne("qna.qnaSearch",keyword);
	}

	public ArrayList<QnA> qnaSearchList(int start, int end, String keyword) {
		Map<String, String> map = new HashMap<String,String>();
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		map.put("keyword", String.valueOf(keyword));
		List list = sqlSession.selectList("qna.qnaSearchList",map);
		return (ArrayList<QnA>)list;
	}
	
}
