package kr.co.goods.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("goodsDao")
public class GoodsDao {
	@Autowired
	SqlSessionTemplate sqlSession;
}
