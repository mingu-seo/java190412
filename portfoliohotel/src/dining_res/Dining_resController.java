package dining_res;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import board.member.MemberVO;
import board.qna.QnaVO;
import dining.DiningVO;
import util.Function;

@Controller
public class Dining_resController {

	@Autowired
	Dining_resService dining_resService;

	@RequestMapping("/manage/dining_res/index")
	public String index(Model model, Dining_resVO param) throws Exception {
		param.setTablename("dining_res");
		int[] rowPageCount = dining_resService.count(param);
		ArrayList<Dining_resVO> list = dining_resService.list(param);

		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);

		return "manage/dining_res/index";
	}
	
	@RequestMapping("/manage/dining_res/read")
	public String read(Model model, Dining_resVO param) throws Exception {
		Dining_resVO data = dining_resService.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		
		return "manage/dining_res/read";
	}
	
	@RequestMapping("/manage/dining_res/edit")
	public String edit(Model model, Dining_resVO param) throws Exception {
		Dining_resVO data = dining_resService.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		
		return "manage/dining_res/edit";
	}

	@RequestMapping("/manage/dining_res/write")
	public String write(Model model, Dining_resVO param) throws Exception {
		model.addAttribute("vo", param);

		return "manage/dining_res/write";
	}
	
	// 사용자
	
	@RequestMapping("/dining/dining_origin_book")
	public String dining_origin_book(Model model, Dining_resVO param, HttpSession session) throws Exception {
		MemberVO vo = (MemberVO)session.getAttribute("memberInfo");
		
		model.addAttribute("vo", param);
		
		return "dining/dining_origin_book";
	}
	
	@RequestMapping("/book/confirm_dining")
	public String confirm_dining(Model model, Dining_resVO param, HttpSession session) throws Exception {
		MemberVO vo = (MemberVO)session.getAttribute("memberInfo");
		
		model.addAttribute("vo", param);
		
		return "book/confirm_dining";
	}
		
	
	@RequestMapping("/manage/dining_res/process.do")
	public String process(Model model, Dining_resVO param, HttpServletRequest request) throws Exception {
		model.addAttribute("vo", param);

		if ("write".equals(param.getCmd())) {
			int r = dining_resService.insert(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "index");
		} else if ("edit".equals(param.getCmd())) {
			int r = dining_resService.update(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다.", "수정실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		} else if ("groupDelete".equals(param.getCmd())) {
			int r = dining_resService.groupDelete(request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "총 "+r+"건이 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		} else if ("delete".equals(param.getCmd())) {
			int r = dining_resService.delete(param.getNo());
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		} 
		
		return "include/alert";
	}
}
