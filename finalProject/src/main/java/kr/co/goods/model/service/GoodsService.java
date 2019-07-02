package kr.co.goods.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.goods.model.dao.GoodsDao;

@Service("goodsService")
public class GoodsService {
	@Autowired
	@Qualifier(value="goodsDao")
	private GoodsDao goodsDao;
}
