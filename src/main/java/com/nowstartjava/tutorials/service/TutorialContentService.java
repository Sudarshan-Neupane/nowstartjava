package com.nowstartjava.tutorials.service;

import java.util.List;

import com.nowstartjava.tutorials.model.TutorialsContent;

public interface TutorialContentService {
	public TutorialsContent findOne(int id);

	public List<TutorialsContent> findAll();

	public void save(TutorialsContent tuts);

	public void delete(TutorialsContent tuts);
	
	public List<TutorialsContent> tutorialContentByTutorial(int id);

}
