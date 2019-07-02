package kr.co.collection.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.collection.model.dao.CollectionDao;

@Service("collectionService")
public class CollectionService {
	@Autowired
	@Qualifier(value="collectionDao")
	private CollectionDao collectionDao;
}
