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
	private UmemberService umemberService;

	// 메인페이지 구경용
	@RequestMapping("/user/index")
	public String main(Model model) throws Exception {
		return "/user/index";
	}
	
	@RequestMapping("/user")
	public String main2(Model model) throws Exception {
		return "/user/login";
	}

	@RequestMapping("/user/login")
	private String login(Model model, @RequestParam(value = "login_url", required = false) String login_url,
			@RequestParam(value = "login_param", required = false) String login_param, MemberVO vo, HttpSession session)
			throws Exception {
		if (umemberService.loginCheck(vo)) {
			MemberVO memberInfo = umemberService.getLoginSessionInfo(vo);
			session.setAttribute("memberInfo", memberInfo);
			String redirectUrl = SiteProperty.UserINDEX_PAGE;

			// 로그인 이전페이지 존재하는 경우
			if (login_url != null && !"".equals(login_url)) {
				redirectUrl = login_url;

				if (login_param != null && !"".equals(login_param)) {
					redirectUrl = redirectUrl + "?" + login_param;
				}
			}
			return "redirect:" + redirectUrl;
		} else {
			model.addAttribute("code", "alertMessageBack");
			model.addAttribute("message", "아이디, 비밀번호가 올바르지 않습니다.");
			return "include/alert";
		}
	}
	
	@RequestMapping("/user/logout")
	public String logout(Model model, HttpSession session) {
		session.invalidate();
		model.addAttribute("code", "alertMessageUrl");
		model.addAttribute("message", "정상적으로 로그아웃 되었습니다.");
		model.addAttribute("url", "/user/index");
		
		return "include/alert";
	}
}
