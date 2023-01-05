package com.skilldistillery.itinerary.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.skilldistillery.itinerary.data.UserDAO;
import com.skilldistillery.itinerary.entities.User;

@Controller
@SessionAttributes("loggedInUser")
public class UserController {

	@Autowired
	private UserDAO userDao;
	
	@ModelAttribute("loggedInUser")
	public User initSessionState () {
		return new User();
	}
	
	@RequestMapping(path= {"/", "home.do"})
	public String home(Model model, @ModelAttribute("loggedInUser") User user) {
		model.addAttribute("SMOKETEST", userDao.findById(1)); //FIXME: DELETE LATER!
		return "home";
	}
	
	@GetMapping(path="loginForm.do")
	public String loginForm () {
		return "loginScreen";
	}
	
	@GetMapping(path="createAccountForm.do")
	public String createAccountForm () {
		return "createAccount";
	}
	
	@PostMapping(path= "login.do")
	public String login (Model model, @ModelAttribute("loggedInUser") User user) {
		user = userDao.findByUsernameAndPassword(user.getUsername(), user.getPassword());
		Boolean success = false;
		String view = "home";
		if (user != null) {
			success = true;
		} else {
			view = "loginFailed";
		}
		model.addAttribute("loginSuccess", success);
		return view;
	}
	
	@PostMapping(path="logout.do")
	public String logout (HttpSession session, SessionStatus sessionStatus) {
//		session.removeAttribute("loggedInUser");
		sessionStatus.setComplete();
		return "home";
	}
	
	@PostMapping(path="createAccount.do")
	public String createAccount(Model model, @ModelAttribute("loggedInUser") User user) {
		User createdUser = userDao.addUser(user);
		Boolean success = false;
		if (createdUser != null) {
			success = true;
		}
		model.addAttribute("creationSuccess", success);
		return "home";
	}
}
