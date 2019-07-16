package board.faq;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import manage.admin.AdminVO;

@Controller
public class FaqController {
	
	@RequestMapping("/membership/faq.do")
	public String faq(Model model, AdminVO param) throws Exception {
		
		return "membership/faq";
	}

}
