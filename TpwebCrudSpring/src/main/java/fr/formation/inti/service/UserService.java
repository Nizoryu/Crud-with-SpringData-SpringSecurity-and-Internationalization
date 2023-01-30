package fr.formation.inti.service;

import java.util.List;

import fr.formation.inti.entity.User;

public interface UserService {
	
	public List<User> findAll();
	
	User findByEmail(String email);

}
