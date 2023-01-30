package fr.formation.inti.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fr.formation.inti.dao.UserRepository;
import fr.formation.inti.entity.User;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserRepository dao;

	@Override	
	public List<User> findAll() {
		return dao.findAll();
	}



	@Override
	public User findByEmail(String email) {
		
		return dao.findByEmail(email);
	}

}
