package com.nowstartjava.tutorials.cms;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nowstartjava.tutorials.model.Menu;
import com.nowstartjava.tutorials.service.MenuService;

@Controller
public class MenuController {
	@Autowired
	private MenuService menuService;

	@RequestMapping(value = "/cms/save_menu", method = RequestMethod.POST)
	private String addMenu(@ModelAttribute("menu") Menu menu, Model model, RedirectAttributes redirectAttr) {
		menuService.save(menu);
		redirectAttr.addFlashAttribute("messageInsert", "Data insert successfully!!");
		return "redirect:/cms/menupage";
	}

	@RequestMapping(value = "/cms/update_menu", method = RequestMethod.POST)
	private String updateMenu(@ModelAttribute("menu") Menu menu, RedirectAttributes redirectAttr) {
		menuService.update(menu);
		redirectAttr.addFlashAttribute("messageUpdate", "Data update successfully!!");
		return "redirect:/cms/menupage";
	}

	@RequestMapping(value = "/cms/getmenu", method = RequestMethod.GET)
	private ResponseEntity<List<Menu>> getAllMenu(@ModelAttribute("menu") Menu menu) {
		List<Menu> getMenu = menuService.findAll();
		return new ResponseEntity<List<Menu>>(getMenu, HttpStatus.OK);
	}

	@RequestMapping(value = "/cms/getmenu_byid/{id}", method = RequestMethod.GET)
	private ResponseEntity<Menu> getMenuById(@PathVariable("id") Integer id) {
		return new ResponseEntity<Menu>(menuService.findOne(id), HttpStatus.OK);
	}

	// deleting data from the database
	@RequestMapping(value = "/cms/delte_data/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Menu> deleteData(@PathVariable("id") Integer id) {
		menuService.deleteMenu(id);
		return new ResponseEntity<Menu>(HttpStatus.OK);

	}

}
