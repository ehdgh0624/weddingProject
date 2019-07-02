package kr.co.collection.model.dao;

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

@Repository("collectionDao")
public class CollectionDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int totalCount(String str) {
		List list = null;
		if(str.equals("S")) {
			list = sqlSession.selectList("studio.selectAllList");
		}else if(str.equals("D")) {
			list = sqlSession.selectList("dress.selectAllList");			
		}else if(str.equals("M")) {
			list = sqlSession.selectList("makeup.selectAllList");
		}
		int count = list.size();
		return count;
	}
	
	public List<Studio> pageStudioList(int start, int end){
		Map<String, Integer> map = new HashMap<String,Integer>();
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("studio.pageSelectAllList",map);
	}
	
	public List<Dress> pageDressList(int start, int end){
		Map<String, Integer> map = new HashMap<String,Integer>();
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("dress.pageSelectAllList",map);
	}

	public List<Makeup> pageMakeupList(int start, int end){
		Map<String, Integer> map = new HashMap<String,Integer>();
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("makeup.pageSelectAllList",map);
	}

	
	public ArrayList<Studio> allListStudio(){
		List<Studio> list = sqlSession.selectList("studio.selectAllList");
		return (ArrayList<Studio>) list;
	}
	
	public ArrayList<Dress> allListDress(){
		List<Dress> list = sqlSession.selectList("dress.selectAllList");
		return (ArrayList<Dress>) list;
	}
	
	public ArrayList<Makeup> allListMakeup(){
		List<Makeup> list = sqlSession.selectList("makeup.selectAllList");
		return (ArrayList<Makeup>) list;
	}

}
