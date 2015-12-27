package com.nowstartjava.tutorials.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.nowstartjava.tutorials.model.TutorialsContent;

@Repository
public interface TutorialContentServiceRepo extends
		JpaRepository<TutorialsContent, Integer> {
	@Query("select tc from TutorialsContent tc where tc.tutorials.id=?1")
	public List<TutorialsContent> findTutorialContentByTutorial(Integer id);

}
