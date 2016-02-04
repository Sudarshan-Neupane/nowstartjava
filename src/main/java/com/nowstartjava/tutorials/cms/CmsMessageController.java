package com.nowstartjava.tutorials.cms;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.nowstartjava.tutorials.model.Message;
import com.nowstartjava.tutorials.service.MessageService;

@Controller
@RequestMapping("/cms")
public class CmsMessageController {
	@Autowired
	private MessageService messageService;
	
	/*@RequestMapping("/inbox")
	public ResponseEntity<List<Message>> getAllInbox(){
		return new ResponseEntity<List<Message>>(HttpStatus.OK);
	}*/
	
	@RequestMapping("/messages")
	public String getAllInbox(){
		
		return "cms/message";
	}
	
	@RequestMapping(value="/inbox",method=RequestMethod.GET)
	public ResponseEntity<List<Message>> getAllMessages(){
		List<Message> messages = messageService.getAllMessages();
		if(messages == null){
			return new ResponseEntity<List<Message>>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<List<Message>>(messages,HttpStatus.OK);
	}
	
	@RequestMapping(value="/inbox/{id}",method=RequestMethod.GET)
	public ResponseEntity<Message> getAllMessages(@PathVariable("id")Integer id){
		Message message = messageService.getOneMessage(id);
		return new ResponseEntity<Message>(message,HttpStatus.OK);
	}

	@RequestMapping(value="/delete/{id}",method=RequestMethod.DELETE)
	public ResponseEntity<Message> deleteMessage(@PathVariable("id")Integer id){
		System.out.println(id);
		messageService.deleteMessage(id);
		return new ResponseEntity<Message>(HttpStatus.OK);
	}
	
}
