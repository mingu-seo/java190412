package user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import manage.member.MemberVO;
import property.SiteProperty;
import user.member.UmemberService;

@Controller
public class UserMainController {
	@Autowired
	private UmemberService memberSerivce;

	//메인페이지 구경용
	@RequestMapping("/user/index")
	public String main(Model model) throws Exception {
		return "/user/index";
	}
	
	@RequestMapping("/user/login")
	private String login(Model model, @RequestParam(value="login_url", required=false) String login_url,
						@RequestParam(value="login_param", required=false) String login_param, 
						MemberVO vo, HttpSession session) throws Exception {
		MemberVO memberInfo = memberSerivce.getLoginSessionInfo(vo);
		session.setAttribute("memberInfo", memberInfo);
		String redirectUrl = SiteProperty.UserINDEX_PAGE;
		
		return "redirect:" + redirectUrl;
	}
}

