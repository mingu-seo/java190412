package member;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import member.MemberVO;
import member.MypettVO;
import mypet.MypetVO;
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
	
	@RequestMapping("/manage/member/read")
	public String read(Model model, MemberVO param) throws Exception {
		MemberVO data = memberService.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		
		return "manage/member/read";
	}
	
	@RequestMapping("/manage/member/mypetList")
	public String mypetList(Model model, MemberVO param) throws Exception {
		ArrayList<MypettVO> list = memberService.mypetList(param.getNo());
		model.addAttribute("list", list);
		return "manage/member/mypetList";
	}
	
	@RequestMapping("/manage/member/edit")
	public String edit(Model model, MemberVO param) throws Exception {
		MemberVO data = memberService.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		
		return "manage/member/edit";
	}
	
	@RequestMapping("/manage/member/write")
	public String write(Model model, MemberVO param) throws Exception {
		model.addAttribute("vo", param);
		
		return "manage/member/write";
	}
	
	/**
	 * 관리자 아이디 중복체크
	 * 사용자에서 저장시 ajax로 체크
	 * @param model
	 * @param param
	 * @return
	 * @throws Exception
	 */
	
	@RequestMapping("/manage/member/idcheck")
	public String idcheck(Model model, MemberVO param, HttpServletRequest request) throws Exception {
		model.addAttribute("vo", param);
		int value = memberService.idcheck(request.getParameter("email"));

		model.addAttribute("value", value);
		
		return "include/return";
	}
	
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
			model.addAttribute("message", Function.message(r, "총 "+r+"건이 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		} else if ("delete".equals(param.getCmd())) {
			int r = memberService.delete(param.getNo());
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		}
		
		return "include/alert";
	}
	
	@RequestMapping("/my/my-infor.do")
	public String myInfor(Model model, MemberVO param, HttpSession session) throws Exception {
		MemberVO m = (MemberVO)session.getAttribute("memberInfo");
		MemberVO data = memberService.read(m.getNo());//세션에서 가져와야됨
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		
		return "my/my-infor";
	}
	
	@RequestMapping("/my/my-infor-editJson.do")
	public String myInforEditJson(Model model, MemberVO param, HttpSession session) throws Exception {
		MemberVO m = (MemberVO)session.getAttribute("memberInfo");
		MemberVO data = memberService.read(m.getNo());
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		
		return "my/my-infor-editJson";
	}
	
	@RequestMapping("/my/my-infor-edit.do")
	public String myInforEdit(Model model, MemberVO param) throws Exception {
		memberService.update(param);
		model.addAttribute("vo", param);
		
		return "redirect:my-infor.do";
	}
	
}
