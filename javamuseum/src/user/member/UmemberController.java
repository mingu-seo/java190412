package user.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UmemberController {
	
	@RequestMapping("/user/hall2")
	public String main(Model model) throws Exception {
		return "/user/hall2";
	}
}
