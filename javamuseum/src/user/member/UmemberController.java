package user.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import manage.member.MemberVO;

@Controller
public class UmemberController {
	
	@RequestMapping("/user/mypage/mypage")
	public String mypage(Model model) throws Exception{
		
		return "user/mypage/mypage";
	}
}