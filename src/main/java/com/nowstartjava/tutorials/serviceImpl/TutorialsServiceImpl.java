package com.nowstartjava.tutorials.serviceImpl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nowstartjava.tutorials.model.Tutorials;
import com.nowstartjava.tutorials.repository.TutorialRepository;
import com.nowstartjava.tutorials.service.TutorialService;
import org.springframework.data.domain.Sort;

@Service
public class TutorialsServiceImpl implements TutorialService {

	@Autowired
	private TutorialRepository tutorialsRepository;
	
	@Override
	public Tutorials findOne(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Tutorials> findAll() {
		return tutorialsRepository.findAll(sortBydesc());
	}

	@Override
	public void save(Tutorials tutorials) {
		tutorialsRepository.save(tutorials);
	}

	@Override
	public void delete(Tutorials tutorials) {
		// TODO Auto-generated method stub
		
	}
	private Sort sortBydesc(){
		return new Sort(Sort.Direction.DESC,"id");
	}

}
