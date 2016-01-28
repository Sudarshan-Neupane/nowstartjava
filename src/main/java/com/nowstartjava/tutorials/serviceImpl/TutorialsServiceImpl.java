package com.nowstartjava.tutorials.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.nowstartjava.tutorials.model.Tutorials;
import com.nowstartjava.tutorials.repository.TutorialRepository;
import com.nowstartjava.tutorials.service.TutorialService;

@Service
public class TutorialsServiceImpl implements TutorialService {

	@Autowired
	public TutorialRepository tutorialsRepository;

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

	private Sort sortBydesc() {
		return new Sort(Sort.Direction.DESC, "id");
	}

	@Override
	public List<Tutorials> findAllByCategoryId(Integer id) {
		// TODO Auto-generated method stub
		return tutorialsRepository.findTutorialsByCategoryId(id);
	}

	@Override
	public Tutorials findOneBySlug(String slug) {
		// TODO Auto-generated method stub
		return tutorialsRepository.findTutorialBySlug(slug);
	}

	@Override
	public List<Tutorials> findAllByWriterId(Integer id) {
		return tutorialsRepository.findTutorialByWriterId(id);
	}

}
