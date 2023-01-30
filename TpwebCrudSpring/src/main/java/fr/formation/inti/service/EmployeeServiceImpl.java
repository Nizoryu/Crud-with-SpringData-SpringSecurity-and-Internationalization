package fr.formation.inti.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fr.formation.inti.dao.EmployeeDAO;
import fr.formation.inti.entity.Employee;

@Service("employeeService")
@Transactional
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	private EmployeeDAO dao;
	
        // Count number of Employee
//        long count = dao.count();

		@Override
		public List<Employee> findAll() {
			
			return dao.findAll();
		}

		@Override
		@Transactional
		public Employee save(Employee e) {		
			return dao.save(e);
		}

		@Override
		public void delete(Employee entiy) {
			// TODO Auto-generated method stub			
		}

		@Override
		public void deleteById(int id) {
			dao.deleteById(id);
			
		}
		
		
		@Override
		public Optional<Employee> findById(Integer id) {
			
			return dao.findById(id);
		}
//        System.out.println("Number of Employees: " + count);
		
	
}
