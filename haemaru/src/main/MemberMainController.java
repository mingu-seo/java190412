package main;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.MemberService;
import member.MemberVO;
import property.SiteProperty;


@Controller
public class MemberMainController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/index.do")
	public String read(Model model) throws Exception {

		return "index";
	}
	
	@RequestMapping("/member/join")
	public String join(Model model, MemberVO vo) throws Exception {
			memberService.insert(vo);
			String redirectUrl = SiteProperty.MEMBER_INDEX_PAGE; // 시작페이지
			
			return "redirect:"+redirectUrl;
		}
	
	@RequestMapping("/member/login")
	public String login(Model model, @RequestParam(value="login_url", required=false) String login_url, @RequestParam(value="login_param", required=false) String login_param, MemberVO vo, HttpSession session) throws Exception {
		if (memberService.loginCheck(vo)) {
			
			MemberVO memberInfo = memberService.getLoginSessionInfo(vo);
			System.out.println(memberInfo.getName());
			session.setAttribute("memberInfo", memberInfo);	// 세션 저장
			String redirectUrl = SiteProperty.MEMBER_INDEX_PAGE; // 시작페이지
			
			// 로그인 이전페이지 존재하는 경우
			if(login_url != null && !"".equals(login_url)) {
				redirectUrl = login_url;
				
				if(login_param != null && !"".equals(login_param)) {
					redirectUrl = redirectUrl + "?" + login_param;					
				}
			}
			
			return "redirect:"+redirectUrl;
		} else {
			model.addAttribute("code", "alertMessageBack");
			model.addAttribute("message", "아이디, 비밀번호가 올바르지 않습니다.");
			return "include/alert";
		}
	}
	
	/**
	 * 로그아웃 처리
	 * @param model
	 * @return
	 */
	@RequestMapping("/member/logout")
	public String logout(Model model, HttpSession session) {
		//loginInfoProvider.get().remove();
		session.invalidate();
		model.addAttribute("code", "alertMessageUrl");
		model.addAttribute("message", "정상적으로 로그아웃 되었습니다.");
		model.addAttribute("url", "/index.do");
		
		return "include/alert";		
	}
}
