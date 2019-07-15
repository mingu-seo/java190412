package main;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import manage.admin.AdminVO;

@Controller
public class UserMainController {

	@RequestMapping("/index.do")
	public String index(Model model, AdminVO param) throws Exception {
		
		return "index";
	}
	
	@RequestMapping("/pkg/special_promotion.do")
	public String pkg_special(Model model, AdminVO param) throws Exception {
		
		return "pkg/special_promotion";
	}
	
	
}
