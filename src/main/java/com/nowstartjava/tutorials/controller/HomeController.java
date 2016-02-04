package com.nowstartjava.tutorials.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nowstartjava.tutorials.model.Menu;
import com.nowstartjava.tutorials.model.Message;
import com.nowstartjava.tutorials.service.MenuService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private MenuService menuService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);
		model.addAttribute("titleMsg", "Home");
		return "home";
	}

	@RequestMapping("/contact")
	public String getContact(@ModelAttribute("message") Message message, Model model) {
		model.addAttribute("titleMsg", "Contact");
		return "contactPage";
	}

	@RequestMapping("/aboutUs")
	public String getMenu(@ModelAttribute("menu") Menu menu, Model model) {
		model.addAttribute("titleMsg", "About Us");
		List<Menu> menulist = menuService.findAll();
		model.addAttribute("listMenu", menulist);
		return "aboutUs";
	}
}
