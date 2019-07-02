package kr.co.collection.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("collectionDao")
public class CollectionDao {
	@Autowired
	SqlSessionTemplate sqlSession;

}
