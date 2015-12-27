package com.nowstartjava.tutorials.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.nowstartjava.tutorials.model.Tutorials;

@Repository
public interface TutorialRepository extends JpaRepository<Tutorials, Integer> {
	/**
	 * @param id
	 * @return
	 */
	@Query("select t from Tutorials t where t.category.id=?1")
	public List<Tutorials> findTutorialsByCategoryId(Integer id);

	@Query("SELECT t FROM Tutorials t WHERE t.slug=?1")
	public Tutorials findTutorialBySlug(String slug);

}
