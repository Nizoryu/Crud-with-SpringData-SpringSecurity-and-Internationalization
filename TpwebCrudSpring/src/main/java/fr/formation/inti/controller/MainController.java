package fr.formation.inti.controller;

import java.security.Principal;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
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
	private static final Logger log = LogManager.getLogger(MainController.class);
	@Autowired
	private UserService userserv;
	@Autowired
	private EmployeeService empserv;

	@Autowired
	@Qualifier("employeeValidator")
	private Validator validator;

	@InitBinder
	private void initBinder(WebDataBinder binder) {
		binder.setValidator(validator);
	}

	@RequestMapping(value = { "/", "/welcome" }, method = RequestMethod.GET)
	public String welcomePage(Model model, Principal principal) {
//		model.addAttribute("user", u);
		log.warn("GetMapping: WelcomePage.jsp");
		return "view/welcomePage";
	}

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adminPage(Model model, Principal principal) {

		log.warn("GetMapping: adminPage.jsp");
		return "view/adminPage";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage(Model model, Principal principal) {

		log.warn("GetMapping: loginPage2.jsp");
		return "view/loginPage2";
	}

	@RequestMapping(value = "/logoutSuccessful", method = RequestMethod.GET)
	public String logoutSuccessfulPage(Model model) {
		model.addAttribute("title", "Logout");
		log.warn("GetMapping: logoutSuccessfulPage.jsp");
		return "view/logoutSuccessfulPage";
	}

	@RequestMapping(value = "/userInfo", method = RequestMethod.GET)
	public String userInfo(Model model, Principal principal, HttpSession session) {

		// After user login successfully.
		String userName = principal.getName();
		System.out.println("User Name: " + userName);
		session.setAttribute("username", userName);
		model.addAttribute("message1", "affiche la liste des User si : Role_ADMIN");
		List<User> list1 = userserv.findAll();
		model.addAttribute("listemp", list1);
		log.info("GetMapping: userInfoPage.jsp");
		return "view/userInfoPage";
	}

	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public String accessDenied(Model model, Principal principal) {
		model.addAttribute("message",
				"Hi " + principal.getName() + "<br> You do not have permission to access this page!");

		log.warn("GetMapping: 403Page.jsp");
		return "view/403Page";
	}

	@RequestMapping(value = "/listemployee", method = RequestMethod.GET)
	public String listEmployee(Model model) {
		List<Employee> list1 = empserv.findAll();
		model.addAttribute("listemp", list1);
		return "view/listemp_page";
	}

	@RequestMapping(value = "/updateEmp", method = RequestMethod.GET)
	public String updateEmployee(Model model, @RequestParam("empId") Integer id, Employee employee) {
		Optional<Employee> e = empserv.findById(id);
		model.addAttribute("emp", e.get());
		System.out.println(e);
		return "view/updateEmpPage";
	}

	@PostMapping(value = "/updateEmp")
	public String updateEmployeePost(Model model, @Validated @ModelAttribute("emp") Employee employee, BindingResult br) {
		Employee e = employee;
		model.addAttribute("empId",e.getEmpId());
		if (br.hasErrors()) {
			log.error("Bindind error Update "+ employee);
			return "redirect:/updateEmp";
//			return "view/updateEmpPage";
		}
		empserv.save(e);
		log.warn("Update "+ employee);
		return "redirect:/listemployee";

	}

	// create EMP
	@GetMapping(value = "/saveEmp")
	public String SaveEmployee(Employee employee) {
		return "view/addempPage";
	}

	@PostMapping(value = "/saveEmp")
	public String SaveEmployeePost(@Validated @ModelAttribute("employee") Employee employee, BindingResult br) {
		if (br.hasErrors()) {
			log.error("Bindind error Save "+ employee);
			return "view/addempPage";
		}
		System.out.println(employee);
//		employee.setStartDate(new GregorianCalendar().getTime());
		empserv.save(employee);
		log.warn("Save:"+ employee);
		return "redirect:/listemployee";

	}

	@GetMapping(value = "/deleteEmp")
	public String DeleteEmp(@RequestParam("id") int id, Model model) {
		empserv.deleteById(id);
		System.out.println(id);
		log.warn("Delete id:"+ id);
		return "redirect:/listemployee";
	}

}
