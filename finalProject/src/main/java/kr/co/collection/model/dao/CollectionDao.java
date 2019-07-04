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
import kr.co.collection.model.vo.StudioSelect;
import kr.co.gallery.model.vo.Gallery;

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

	public Studio selectOneStudio(int studioNo) {
		return (Studio)sqlSession.selectOne("studio.viewSelectOne",studioNo);
	}
	
	public ArrayList<StudioSelect> selectListStudioOption(int studioNo){
		List<StudioSelect> list = sqlSession.selectList("studioSelect.selectListOption",studioNo);
		return (ArrayList<StudioSelect>) list;
	}
	
	public ArrayList<Gallery> selectListStudioGallery(int objectNo, String galleryCode){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("objectNo", objectNo);
		map.put("galleryCode", galleryCode);
		List<Gallery> list = sqlSession.selectList("gallery.selectListGallery",map);
		return (ArrayList<Gallery>) list;
	}
}
