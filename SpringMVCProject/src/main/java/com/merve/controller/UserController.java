package com.merve.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.merve.domain.User;
import com.merve.dto.UserListDto;
import com.merve.service.UserService;

@Controller
@RequestMapping("/users")
public class UserController {
	
	
	@Autowired
	private UserService userService;
	
	@RequestMapping
	public String getUsersPage(){
		return "users" ;
	}
	
	@RequestMapping(value="/records")
	public @ResponseBody UserListDto getUsers() {
		
		UserListDto userListDto = new UserListDto();
		userListDto.setUsers(userService.readAll());
		return userListDto;
	}
	
	@RequestMapping(value="/get")
	public @ResponseBody User get(@RequestBody User user){
		
		return userService.read(user);
	}
	
	@RequestMapping(value = "/create",method =RequestMethod.POST)
	public @ResponseBody User create(@RequestParam String firstname,@RequestParam String lastname,@RequestParam String phoneNumber){
		
		User newUser = new User();
		newUser.setFirstName(firstname);
		newUser.setLastName(lastname);
		newUser.setPhoneNumber(phoneNumber);
		
		return userService.create(newUser);
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public @ResponseBody User update(@RequestParam String firstname,@RequestParam String lastname,@RequestParam String phoneNumber){
		
		User oldUser = new User();
		oldUser.setFirstName(firstname);
		oldUser.setLastName(lastname);
		oldUser.setPhoneNumber(phoneNumber);
		
		return userService.update(oldUser);
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public @ResponseBody Boolean delete(@RequestParam String firstname){
		
		User oldUser = new User();
		
		oldUser.setFirstName(firstname);
		
		return userService.delete(oldUser);
	}
	
	
	
	
}
