package fr.formation.inti.dao;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import fr.formation.inti.entity.Employee;

@Repository("EmployeeRepository")
public interface EmployeeDAO extends CrudRepository<Employee, Integer> {
	
//	List<Employee> findByLastName(String lastName);
//
//	Optional<Employee> findById(Integer id);
//
	List<Employee> findAll();

//	Employee save(Employee entiy);

//	void delete(Employee entiy);

//	void deleteById(Integer id);

}
