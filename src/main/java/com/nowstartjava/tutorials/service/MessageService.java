package com.nowstartjava.tutorials.service;

import com.nowstartjava.tutorials.model.Message;

public interface MessageService {

	void saveMessage(Message message);
	void deleteMessage(Integer messageId);
}
