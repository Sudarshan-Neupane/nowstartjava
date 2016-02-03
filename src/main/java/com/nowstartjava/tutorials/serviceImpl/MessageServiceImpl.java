package com.nowstartjava.tutorials.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nowstartjava.tutorials.model.Message;
import com.nowstartjava.tutorials.repository.MessageRepository;
import com.nowstartjava.tutorials.service.MessageService;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	private MessageRepository messageRepository;
	
	@Override
	public void saveMessage(Message message) {
		messageRepository.save(message);
	}

	@Override
	public void deleteMessage(Integer messageId) {
		messageRepository.delete(messageId);
	}

}
