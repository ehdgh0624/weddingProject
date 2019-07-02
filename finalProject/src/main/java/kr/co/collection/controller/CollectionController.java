package kr.co.collection.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import kr.co.collection.model.service.CollectionService;

@Controller
public class CollectionController {
	@Autowired
	@Qualifier(value="collectionService")
	private CollectionService collectionService;

	
}
