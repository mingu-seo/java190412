package membership;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import manage.admin.AdminVO;

@Controller
public class MembershipController {

	@RequestMapping("/membership/sign_in")
	public String sign_in(Model model, AdminVO param) throws Exception {

		return "membership/sign_in";
	}

	@RequestMapping("/membership/choice_join")
	public String choice_join(Model model, AdminVO param) throws Exception {

		return "membership/choice_join";

	}

	@RequestMapping("/membership/mypage")
	public String mypage(Model model, AdminVO param) throws Exception {

		return "membership/mypage";

	}

	@RequestMapping("/membership/edit_account")
	public String edit_account(Model model, AdminVO param) throws Exception {

		return "membership/edit_account";

	}

	@RequestMapping("/membership/edit_password")
	public String edit_password(Model model, AdminVO param) throws Exception {

		return "membership/edit_password";

	}

	@RequestMapping("/membership/join")
	public String join(Model model, AdminVO param) throws Exception {

		return "membership/join";

	}

	@RequestMapping("/membership/delete_account")
	public String delete_account(Model model, AdminVO param) throws Exception {

		return "membership/delete_account";

	}

}
