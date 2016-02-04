package com.nowstartjava.tutorials.serviceImpl;

import java.util.Date;
import java.util.List;

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
		message.setDate(new Date());
		messageRepository.save(message);
	}

	@Override
	public void deleteMessage(Integer messageId) {
		messageRepository.delete(messageId);
	}

	@Override
	public List<Message> getAllMessages() {
		return messageRepository.findAll();
	}

	@Override
	public Message getOneMessage(Integer id) {
		return messageRepository.findOne(id);
	}

}
