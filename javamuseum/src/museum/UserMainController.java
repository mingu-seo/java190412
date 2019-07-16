package museum;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserMainController {

	@RequestMapping("/index.do")
	public String main(Model model) throws Exception {

		return "index";
	}
}
