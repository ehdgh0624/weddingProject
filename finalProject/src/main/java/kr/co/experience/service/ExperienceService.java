package kr.co.experience.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.experience.dao.ExperienceDao;
import kr.co.experience.vo.Experience;

@Service("experienceService")
public class ExperienceService {

	@Autowired
	private ExperienceDao experienceDao;
	
	
	
	public ArrayList<Experience> ExperienceAll() {
		
		
		
		return experienceDao.ExperienceAll();
	}



	public Experience experienceDetail(Experience ex) {
		
		
		return experienceDao.experienceDetail(ex);
	}

}
