package com.springboot.demo.controller;

import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.demo.dao.EmployeeDAO;
import com.springboot.demo.dao.UsersDAO;
import com.springboot.demo.mail.EmailService;
import com.springboot.demo.model.Employee;
import com.springboot.demo.model.UsersModel;

@Controller
public class SignUpController {
	private EmployeeDAO empDAO = new EmployeeDAO();
	private EmailService emailSV = new EmailService();
	
//	@RequestMapping("/")
//	public ModelAndView displayEmployees() {
//		List<Employee> employees = empDAO.readEmployees();
//		
//		ModelAndView modelAndView = new ModelAndView("display_employees");
//		modelAndView.addObject("employees", employees);
//		
//		return modelAndView;
//	}
	
	@RequestMapping("/signup")
	public ModelAndView signup() {
		ModelAndView modelAndView = new ModelAndView("sign-up-illustration");
		return modelAndView;
	}
	
	@RequestMapping(path = "/verify_otp", method=RequestMethod.POST)
	public String verifyOTP(@PathVariable("one_time_pass")Integer oneTimePass) {
		return null;
		
	}
	@RequestMapping(path = "/signup_req", method=RequestMethod.POST)
	public String signup_req(Model m1, UsersModel users) {
		UsersDAO usersdao = new UsersDAO();
		
		String to = users.getEmail();
		
		String subject = "Your OTP";
		int max = 999999;
		int min = 1;
		int range = max-min;
		Random random1 = new Random();
		int randomnumber = random1.nextInt((max-min)+1)+min;
		System.out.println(randomnumber);
		String OTP = randomnumber+"";
		new java.util.Timer().schedule( 
		        new java.util.TimerTask() {
		            @Override
		            public void run() {
		            	usersdao.deleteOTP(to, OTP);
		                // your code here
		            }
		        }, 
		        60000
		);
		emailSV.sendMail(to, subject, OTP);
		
		
		Boolean result = usersdao.createUser(users, OTP);
		if(result) {
			return "redirect:/configure_otp";
		} else {
			return "redirect:/home";
		}
		
		
		
//		System.out.println(result + " Dar");
//		if (result == true) {
//			return "redirect:/configure_otp/";
//		} else {
//			return "redirect:/home";
//		}
	}
	
	@RequestMapping("/configure_otp")
	public ModelAndView confOtp() {
		ModelAndView modelAndView = new ModelAndView("otp_configure");
		return modelAndView;
	}
	
//	@RequestMapping("/{empid}")
//	public ModelAndView displayEmployee(@PathVariable("empid")Integer empId) {
//		Employee employee = empDAO.readEmployee(empId);
//		
//		ModelAndView modelAndView = new ModelAndView("display_employee");
//		modelAndView.addObject("employee", employee);
//		
//		return modelAndView;
//	}
//	
//	@RequestMapping(value="/new", method=RequestMethod.GET)
//	public ModelAndView newEmployee() {
//		return new ModelAndView("new_employee", "employee", new Employee());
//	}
//	
//	@RequestMapping(value="/new", method=RequestMethod.POST)
//	public String addNewEmployee(@Valid @ModelAttribute("employee")Employee employee, 
//		      BindingResult result) {
//		
//		empDAO.createEmployee(employee);
//	
//		return "redirect:/employees/new";
//	}
//	
//	@RequestMapping(value="/update/{empid}", method=RequestMethod.GET)
//	public ModelAndView updateEmployee(@PathVariable("empid")Integer empId) {
//		return new ModelAndView("update_employee", "employee", empDAO.readEmployee(empId));
//	}
//	
//	@RequestMapping(value="/update", method=RequestMethod.POST)
//	public String doUpdateEmployee(@Valid @ModelAttribute("employee")Employee employee, 
//		      BindingResult result) {
//		
//		empDAO.updateEmployee(employee);
//	
//		return "redirect:/employees/";
//	}
//	
//	@RequestMapping(value="/delete/{empid}", method=RequestMethod.GET)
//	public String deleteEmployee(@PathVariable("empid")Integer empId) {
//		
//		empDAO.deleteEmployee(empId);
//		
//		return "redirect:/employees/";
//	}
	

}
