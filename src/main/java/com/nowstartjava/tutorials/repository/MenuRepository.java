package com.nowstartjava.tutorials.repository;

import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.JpaRepository;

import com.nowstartjava.tutorials.model.Menu;

@Repository
public interface MenuRepository extends JpaRepository<Menu, Integer> {

}
