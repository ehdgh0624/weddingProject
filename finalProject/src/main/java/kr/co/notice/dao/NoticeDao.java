package kr.co.notice.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.notice.vo.Notice;

@Repository("noticeDao")
public class NoticeDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	public int totalCount() {
		return sqlSession.selectOne("notice.mainCount");
	}

	public ArrayList<Notice> noticeMain(int start, int end) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		List list = sqlSession.selectList("notice.mainSelect",map);
		return (ArrayList<Notice>)list;
	}

	public Notice noticeView(int noticeNo) {
		return sqlSession.selectOne("notice.noticeView",noticeNo);
	}

	public void noticeViewUpdate(int noticeNo) {
		sqlSession.update("notice.noticeViewUpdate", noticeNo);
	}

	public int insertNotice(Notice n) {
		
		
		
		return sqlSession.insert("notice.insertNotice",n);
	}

	public int updateNotice(Notice n) {
		
		return sqlSession.update("notice.updateNotice",n);
	}

	public int noticeDelete(int noticeNo) {
		
		return sqlSession.delete("notice.noticeDelete",noticeNo);
	}
}
