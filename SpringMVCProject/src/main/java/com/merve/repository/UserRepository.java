package com.merve.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import com.merve.domain.User;

public interface UserRepository extends MongoRepository<User, String> {
	
	User findByFirstname(String firstname);
}
