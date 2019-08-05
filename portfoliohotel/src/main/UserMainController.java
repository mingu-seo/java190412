package main;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import board.faq.FaqVO;
import manage.admin.AdminVO;

@Controller
public class UserMainController {

	@RequestMapping("/index")
	public String index(Model model, AdminVO param) throws Exception {
		
		
		return "index";
	}
	
	@RequestMapping("/pkg/special_promotion")
	public String pkg_special(Model model, AdminVO param) throws Exception {
		
		return "dining/moon-bar";
	}
	
}
