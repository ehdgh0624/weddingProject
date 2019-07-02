package kr.co.goods.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import kr.co.goods.model.service.GoodsService;

@Controller
public class GoodsController {
	@Autowired
	@Qualifier(value="goodsService")
	private GoodsService goodsService;
}
