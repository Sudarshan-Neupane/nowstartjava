package com.nowstartjava.tutorials.service;

import java.util.List;

import com.nowstartjava.tutorials.model.Message;

public interface MessageService {

	List<Message> getAllMessages();
	Message getOneMessage(Integer id);
	void saveMessage(Message message);
	void deleteMessage(Integer messageId);
}
