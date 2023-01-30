package fr.formation.inti.controller;

import java.security.Principal;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import fr.formation.inti.entity.Employee;
import fr.formation.inti.entity.User;
import fr.formation.inti.service.EmployeeService;
import fr.formation.inti.service.UserService;

@Controller
public class MainController {
	@Autowired
	private UserService userserv;
	@Autowired
	private EmployeeService empserv;
	private User u;
	
	@Autowired
	@Qualifier("employeeValidator")
	private Validator validator;
	
	@InitBinder
	private void initBinder(WebDataBinder binder) {
		binder.setValidator(validator);
	}

	@RequestMapping(value = { "/", "/welcome" }, method = RequestMethod.GET)
	public String welcomePage(Model model) {
		model.addAttribute("title", "Welcome");
		model.addAttribute("message", "This is welcome page!");
		return "view/welcomePage";
	}

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adminPage(Model model) {
		model.addAttribute("u",u);
		return "view/adminPage";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage(Model model) {

		return "view/loginPage";
	}

	@RequestMapping(value = "/logoutSuccessful", method = RequestMethod.GET)
	public String logoutSuccessfulPage(Model model) {
		model.addAttribute("title", "Logout");
		return "view/logoutSuccessfulPage";
	}

	@RequestMapping(value = "/userInfo", method = RequestMethod.GET)
	public String userInfo(Model model, Principal principal) {

		// After user login successfully.
		String userName = principal.getName();
		System.out.println("User Name: " + userName);
		model.addAttribute("message1", "affiche la liste des User si : Role_ADMIN");
		List<User> list1 = userserv.findAll();
		model.addAttribute("listemp", list1);
		return "view/userInfoPage";
	}

	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public String accessDenied(Model model, Principal principal) {

		if (principal != null) {
			model.addAttribute("message",
					"Hi " + principal.getName() + "<br> You do not have permission to access this page!");
		} else {
			model.addAttribute("msg", "You do not have permission to access this page!");
		}
		return "view/403Page";
	}

	@RequestMapping(value = "/listemployee", method = RequestMethod.GET)
	public String listEmployee(Model model) {
		List<Employee> list1 = empserv.findAll();
		model.addAttribute("listemp", list1);
		return "view/listemp_page";
	}

	@RequestMapping(value = "/updateEmp", method = RequestMethod.GET )
	public String updateEmployee(@RequestParam("empId") Integer id, Employee employee, Model model) {		
		Optional<Employee> e = empserv.findById(id);
		model.addAttribute("emp", e.get());
		System.out.println(e);
		return "view/updateEmpPage";
	}
	
	@PostMapping (value = "/updateEmp")
	public String updateEmployeePost( @ModelAttribute("emp") Employee employee) {
		System.out.println("save "+employee);
//		employee.setStartDate(new GregorianCalendar().getTime());		
			Employee e = employee;
			System.out.println(e);
			empserv.save(e);	
		return "redirect:/listemployee";
		
	}
	
	
	//creation emp
	@GetMapping(value = "/saveEmp")
	public String SaveEmployee (Employee employee) {
		return "view/addempPage";
	}
	
	@PostMapping(value = "/saveEmp")
	public String SaveEmployeePost (@Validated @ModelAttribute("employee") Employee employee, BindingResult br)   {
		if (br.hasErrors()) {
			return "view/addempPage";	
		}	
		System.out.println(employee);
		employee.setStartDate(new GregorianCalendar().getTime());
		empserv.save(employee);
		return "redirect:/listemployee";
		
	}
	
	@GetMapping(value ="/deleteEmp")
	public String DeleteEmp (@RequestParam("id") int id, Model model) {
		empserv.deleteById(id);
		System.out.println(id);
//		return listEmployee(model);
		return "redirect:/listemployee";
	}
	

}
