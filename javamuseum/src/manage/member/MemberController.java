package manage.member;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

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
	
	@RequestMapping("/manage/member/read")
	public String read(Model model, MemberVO param) throws Exception {
		MemberVO data = memberService.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		
		return "manage/member/read";
	}
//	
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
	 * 등록, 수정, 삭제 cmd값으로 구분해서 처리
	 * @param model
	 * @param param
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/member/process")
	public String process(Model model, MemberVO param, HttpServletRequest request, PointVO pntparam) throws Exception {
		model.addAttribute("vo", param);
		
		
		if ("write".equals(param.getCmd())) {
			param.setEmail(param.getEmail() + "@" + param.getEmail2());
			param.setTel(param.getfTel() + "-" + param.getmTel() + "-" + param.geteTel());
			param.setBirthday(param.getYear() + "-" + param.getMonth() + "-" + param.getDay());
			int r = memberService.insert(param);
			pntparam.setMember_pk(r);
			pntparam.setAccum(1000);
			pntparam.setMemo("회원가입 적립금");
			pntparam.setState(0);
			int p = memberService.pointinsert(pntparam);
			model.addAttribute(p);
			memberService.pointupdate(pntparam);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "index");
		} else if ("edit".equals(param.getCmd())) {
			param.setEmail(param.getEmail() + "@" + param.getEmail2());
			param.setTel(param.getfTel() + "-" + param.getmTel() + "-" + param.geteTel());
			param.setBirthday(param.getYear() + "-" + param.getMonth() + "-" + param.getDay());
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
		} else if ("pointwrite".equals(param.getCmd())) {
			int r = memberService.pointinsert(pntparam);
			int state = pntparam.getState();
			if(state == 0) {
				memberService.pointupdate(pntparam);
			} else if (state == 1) {
				memberService.pointuse(pntparam);
			}
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "point?member_pk="+pntparam.getMember_pk());
		}
		return "include/alert";
	}
	
	@RequestMapping("/manage/member/idcheck")
	public String idcheck(Model model, MemberVO param) throws Exception {
		model.addAttribute("vo", param);
		int value = memberService.idcheck(param);

		model.addAttribute("value", value);
		
		return "include/return";
	}
	
	@RequestMapping("/manage/member/point")
	public String index(Model model, PointVO param) throws Exception {
		int[] rowPageCount = memberService.pointcount(param);
		ArrayList<PointVO> pointlist = memberService.pointlist(param);
		param.setMember_pk(param.getMember_pk());
		MemberVO data = memberService.read(param.getMember_pk());
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", pointlist);
		model.addAttribute("vo", param);
		model.addAttribute("mvo", data);
		
		return "manage/member/point";
	}
}
