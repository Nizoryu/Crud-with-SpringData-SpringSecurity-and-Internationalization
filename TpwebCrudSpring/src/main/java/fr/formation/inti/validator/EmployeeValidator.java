package fr.formation.inti.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import fr.formation.inti.entity.Employee;

@Component
public class EmployeeValidator implements Validator{

	
	@Override   
	public boolean supports(Class<?> paramClass) {   //return si c'est le bon objet a analyser
		return Employee.class.equals(paramClass);
	}

	@Override
	public void validate(Object obj, Errors errors) {
	
		ValidationUtils.rejectIfEmpty(errors, "firstName", "firstName.required");
		ValidationUtils.rejectIfEmpty(errors, "lastName", "lastName.required");
		ValidationUtils.rejectIfEmpty(errors, "title", "title.required");
		ValidationUtils.rejectIfEmpty(errors, "startDate", "startDate.required");
				
//		Employee emp = (Employee) obj;
//		if(emp.getStartDate()){
//			errors.rejectValue("id", "negativeValue", new Object[]{"'id'"}, "id can't be negative");
//		}
	
		
	}
}
