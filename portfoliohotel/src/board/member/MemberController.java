package board.member;

import java.util.ArrayList;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import util.Function;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	@RequestMapping("/manage/member/index")
	public String index(Model model, MemberVO param) throws Exception {
		int[] rowPageCount = memberService.count(param);
		ArrayList<MemberVO> list = memberService.list(param);

		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);

		return "manage/member/index";
	}
	
//	@RequestMapping("/manage/member/join")
//	public String join(Model model, MemberVO param) throws Exception {
//		MemberVO data = memberService.read(param.getNo());
//		model.addAttribute("data", data);
//		model.addAttribute("vo", param);
//
//		return "manage/member/join";
//	}
	
	

	@RequestMapping("/manage/member/read")
	public String read(Model model, MemberVO param) throws Exception {
		MemberVO data = memberService.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("vo", param);

		return "manage/member/read";
	}
	
	

	@RequestMapping("/manage/member/edit")
	public String edit(Model model, MemberVO param) throws Exception {
		MemberVO data = memberService.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("vo", param);

		return "manage/member/edit";
	}
	
	@RequestMapping("/manage/member/memberMypage")
	public String mypage(Model model, MemberVO param) throws Exception {
		MemberVO data = memberService.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("vo", param);

		return "manage/member/memberMypage";
	}
	
	@RequestMapping("/manage/member/memberIndex")
	public String memberIndex(Model model, MemberVO param) throws Exception {
		MemberVO data = memberService.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("vo", param);

		return "manage/member/memberIndex";
	}
	
	/*
	 * @RequestMapping("/manage/member/memberIndex") public String memberIndex(Model
	 * model, MemberVO param) throws Exception { MemberVO data =
	 * memberService.read(param.getNo()); model.addAttribute("data", data);
	 * model.addAttribute("vo", param);
	 * 
	 * return "manage/member/memberIndex"; }
	 */
	
	@RequestMapping("/manage/member/memberDelete")
	public String memberDelete(Model model, MemberVO param) throws Exception {
		MemberVO data = memberService.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("vo", param);

		return "manage/member/memberDelete";
	}
	
//	@RequestMapping("/manage/member/pwedit")
//	public String PWedit(Model model, MemberVO param) throws Exception {
//		MemberVO data = memberService.read(param.getNo());
//		model.addAttribute("data", data);
//		model.addAttribute("vo", param);
//
//		return "manage/member/pwedit";
//	}

	@RequestMapping("/manage/member/write")
	public String write(Model model, MemberVO param) throws Exception {
		model.addAttribute("vo", param);

		return "manage/member/write";
	}
	
	@RequestMapping("/manage/member/loginForm")
	public String loginForm(Model model, MemberVO param) throws Exception {
		model.addAttribute("vo", param);

		return "manage/member/loginForm";
	}
	
	
	@RequestMapping("/manage/member/idcheck")
	public String idcheck(Model model, MemberVO param) throws Exception {
		model.addAttribute("vo", param);
		int value = memberService.idcheck(param);

		model.addAttribute("value", value);
		
		return "include/return";
	}
	
	@RequestMapping("/manage/member/idSrc")
	public String idSrc(Model model, MemberVO param) throws Exception {
		model.addAttribute("vo", param);

		return "manage/member/idSrc";
	}
	
	@RequestMapping("/manage/member/pwdSrc")
	public String pwdSrc(Model model, MemberVO param) throws Exception {
		model.addAttribute("vo", param);

		return "manage/member/pwdSrc";
	}

	/**
	 * 관리자 아이디 중복체크 사용자에서 저장시 ajax로 체크
	 * 
	 * @param model
	 * @param param
	 * @return
	 * @throws Exception
	 */
	
	@RequestMapping("/manage/member/loginCheck")
	public String loginCheck(Model model, MemberVO param, HttpSession session) throws Exception {
		model.addAttribute("vo", param);

		return "manage/member/loginCheck";
	}
	
	
	
	
//	@RequestMapping("/manage/member/loginCheck")
//	public String loginCheck(Model model, MemberVO param, HttpSession session) throws Exception {
//		boolean result = memberService.loginCheck(param,session);
//		model.addAttribute("vo", param);
//		
//
//		return "manage/member/loginCheck";
//	}
//	
//	@RequestMapping("/manage/member/loginCheck")
//	public String loginCheck(Model model, MemberVO param) throws Exception {
//		model.addAttribute("vo", param);
//		int value = memberService.loginCheck(param);
//
//		model.addAttribute("value", value);
//		
//		return "include/return";
//	}
	
	
	
	@RequestMapping("/manage/member/emailcheck") //회원 가입 이메일 체크
	public String emailcheck(Model model, MemberVO param, HttpServletRequest request) throws Exception {
		model.addAttribute("vo", param);

		int value = memberService.emailcheck(request.getParameter("email"));

		model.addAttribute("value", value);

		return "include/return";
	}
	
	@RequestMapping("/manage/member/pwdcheck")//회원가입 비밀번호 체크
	public String pwdcheck(Model model, MemberVO param, HttpServletRequest request) throws Exception {
		model.addAttribute("vo", param);

		int value = memberService.pwdcheck(request.getParameter("pwd"));

		model.addAttribute("value", value);

		return "include/return";
	}
	
	@RequestMapping("/manage/member/samePwdcheck") //회원가입 비밀번호 체크
	public String samePwdcheck(Model model, MemberVO param, HttpServletRequest request) throws Exception {
		model.addAttribute("vo", param);

		int value = memberService.samePwdcheck(request.getParameter("samePwdcheck"));

		model.addAttribute("value", value);

		return "include/return";
	}

	/**
	 * 등록, 수정, 삭제 cmd값으로 구분해서 처리
	 * 
	 * @param model
	 * @param param
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/member/process")
	public String process(Model model, MemberVO param, HttpServletRequest request) throws Exception {
		model.addAttribute("vo", param);

		if ("write".equals(param.getCmd())) {
			int r = memberService.insert(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "index");

		} else if ("edit".equals(param.getCmd())) {
			int r = memberService.update(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다.", "수정실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));

		} else if ("groupDelete".equals(param.getCmd())) {
			int r = memberService.groupDelete(request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "총 " + r + "건이 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));

		} else if ("delete".equals(param.getCmd())) {
			int r = memberService.delete(param.getNo());
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패"));
			
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		}

		return "include/alert";
	}

//	@RequestMapping("/manage/member/loginHistory")
//	public String loginHistory(Model model, MemberVO param) throws Exception {
//		int[] rowPageCount = memberService.countLoginHistory(param);
//		ArrayList<MemberVO> list = memberService.listLoginHistory(param);
//		
//		model.addAttribute("totCount", rowPageCount[0]);
//		model.addAttribute("totPage", rowPageCount[1]);
//		model.addAttribute("list", list);
//		model.addAttribute("vo", param);
//		
//		return "manage/member/loginHistory";
//	}
}
