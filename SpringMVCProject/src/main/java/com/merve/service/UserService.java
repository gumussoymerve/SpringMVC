package com.merve.service;

import java.util.List;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.merve.domain.User;
import com.merve.repository.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	public User create(User user){
		
		user.setId(UUID.randomUUID().toString());
		
		return userRepository.save(user);
	}
	
	public User read( User user){
		return user;
	}
	
	public List<User> readAll(){
		return userRepository.findAll();
	}
	
	public User update(User user){
		
		User oldUser = userRepository.findByFirstname(user.getFirstName());
		
		if(oldUser == null){
			return null;
		}
		
		oldUser.setFirstName(user.getFirstName());
		oldUser.setLastName(user.getLastName());
		oldUser.setPhoneNumber(user.getPhoneNumber());
		
		return userRepository.save(oldUser);
	}
	
	public Boolean delete(User user){
		User oldUser = userRepository.findByFirstname(user.getFirstName());
		
		if(oldUser == null){
			return false;
		}
		
		userRepository.delete(oldUser);
		return true;
	}
}
