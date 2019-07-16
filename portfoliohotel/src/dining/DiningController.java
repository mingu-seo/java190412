package dining;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import manage.admin.AdminVO;

@Controller
public class DiningController {
	
	@RequestMapping("/dining/thefesta.do")
	public String thefesta(Model model, AdminVO param) throws Exception {
		
		return "dining/thefesta";
	}
	
	@RequestMapping("/dining/granum-dining.do")
	public String granum_dining(Model model, AdminVO param) throws Exception {
		
		return "dining/granum-dining";
	}
	@RequestMapping("/dining/moon-bar.do")
	public String moon_bar(Model model, AdminVO param) throws Exception {
		
		return "dining/moon-bar";
	}
	@RequestMapping("/dining/outdoor-kitchen.do")
	public String outdoor_kitchen(Model model, AdminVO param) throws Exception {
		
		return "dining/outdoor-kitchen";
	}
}
	
	
