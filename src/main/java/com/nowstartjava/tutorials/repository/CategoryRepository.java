package com.nowstartjava.tutorials.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.nowstartjava.tutorials.model.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Integer>
{

}
