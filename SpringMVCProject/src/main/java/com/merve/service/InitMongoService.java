package com.merve.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;

import com.merve.domain.User;

public class InitMongoService {
	
	@Autowired
	private MongoTemplate mongoTemplate;
	
	public void init(){
		
		mongoTemplate.dropCollection("user");
		
		User merve = new User();
		merve.setFirstName("Merve");
		merve.setLastName("Duzel");
		merve.setPhoneNumber("131242534");
		
		User sebo = new User();
		sebo.setFirstName("Sebo");
		sebo.setLastName("Duzel");
		sebo.setPhoneNumber("534534534");
		
		User osman = new User();
		osman.setFirstName("Osman");
		osman.setLastName("Uzun");
		osman.setPhoneNumber("23435664");
		
		mongoTemplate.insert(osman);
		mongoTemplate.insert(merve);
		mongoTemplate.insert(sebo);
	}
}
