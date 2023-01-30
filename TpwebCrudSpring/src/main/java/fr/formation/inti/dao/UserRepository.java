package fr.formation.inti.dao;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import fr.formation.inti.entity.User;
@Repository("UserRepository")
public interface UserRepository extends CrudRepository<User, Integer>{
	
	List<User> findAll();

	public User findByEmail(String email);
	

}
