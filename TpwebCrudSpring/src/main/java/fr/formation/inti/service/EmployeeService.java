package fr.formation.inti.service;

import java.util.List;
import java.util.Optional;

import fr.formation.inti.entity.Employee;

public interface EmployeeService {
	
	Optional<Employee> findById(Integer id);

	List<Employee> findAll();

	Employee save(Employee e);

	

	void deleteById(int id);

//	Employee getEmployee(int empId) throws ResourceNotFoundException;

}
