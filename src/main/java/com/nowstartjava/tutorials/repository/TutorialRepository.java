package com.nowstartjava.tutorials.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.nowstartjava.tutorials.model.Tutorials;

@Repository
public interface TutorialRepository extends JpaRepository<Tutorials,Integer>
{

}
