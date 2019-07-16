package membership;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import manage.admin.AdminVO;

@Controller
public class MembershipController {

	@RequestMapping("/membership/sign_in.do")
	public String sign_in(Model model, AdminVO param) throws Exception {

		return "membership/sign_in";
	}

	@RequestMapping("/membership/choice_join.do")
	public String choice_join(Model model, AdminVO param) throws Exception {

		return "membership/choice_join";

	}
}
