package com.nowstartjava.tutorials.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nowstartjava.tutorials.model.TutorialsContent;
import com.nowstartjava.tutorials.repository.TutorialContentServiceRepo;
import com.nowstartjava.tutorials.service.TutorialContentService;

@Service
public class TutorialContentServiceImpl implements TutorialContentService {
	@Autowired
	public TutorialContentServiceRepo tutsContentRepo;

	@Override
	public TutorialsContent findOne(int id) {
		// TODO Auto-generated method stub
		return tutsContentRepo.findOne(id);
	}

	@Override
	public List<TutorialsContent> findAll() {
		return tutsContentRepo.findAll();
	}

	@Override
	public void save(TutorialsContent tuts) {
		tutsContentRepo.save(tuts);

	}

	@Override
	public void delete(TutorialsContent tuts) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<TutorialsContent> tutorialContentByTutorial(int id) {
		return tutsContentRepo.findTutorialContentByTutorial(id);
	}

	@Override
	public void delete(Integer id) {
		tutsContentRepo.delete(id);
	}

}
