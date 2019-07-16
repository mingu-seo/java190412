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
}
	
	
