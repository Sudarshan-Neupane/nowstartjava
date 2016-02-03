package com.nowstartjava.tutorials.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.nowstartjava.tutorials.model.Message;

@Repository
public interface MessageRepository extends JpaRepository<Message, Integer> {

}
