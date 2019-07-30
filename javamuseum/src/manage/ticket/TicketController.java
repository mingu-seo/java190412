package manage.ticket;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import manage.exhibition.ExhibitionService;
import manage.exhibition.ExhibitionVO;
import manage.member.MemberService;
import manage.member.MemberVO;
import util.Function;

@Controller
public class TicketController {

	@Autowired
	private TicketService ticketService;
	@Autowired
	private ExhibitionService exhibitionService;
	@Autowired
	private MemberService memberService;
	
	//예매 메인 페이지
	@RequestMapping("/manage/ticket/index")
	public String index(Model model, TicketVO param, ExhibitionVO exparam) throws Exception {
		int[] rowPageCount = ticketService.count(param);
		ArrayList<TicketVO> list = ticketService.list(param);
		ArrayList<ExhibitionVO> ingList = exhibitionService.ingList(exparam);
		ArrayList<ExhibitionVO> exList = exhibitionService.exList(exparam);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("param", param);
		model.addAttribute("ingList", ingList);
		model.addAttribute("exList", exList);
		
		return "manage/ticket/index";
	}
	//예매 등록 페이지
	@RequestMapping("/manage/ticket/write")
	public String write(Model model, TicketVO param, ExhibitionVO dparam) throws Exception {
		ArrayList<ExhibitionVO> list = exhibitionService.ingList(dparam);

		model.addAttribute("param", param);
		model.addAttribute("list", list);
		return "manage/ticket/write";
	}
	
	//예매 상세 페이지
	@RequestMapping("/manage/ticket/read")
	public String read(Model model, TicketVO param) throws Exception {
		TicketVO vo = ticketService.read(param.getNo());
		model.addAttribute("vo", vo);
		model.addAttribute("param", param);
		
		return "manage/ticket/read";
	}
	
	//예매 수정 페이지
	@RequestMapping("/manage/ticket/edit")
	public String edit(Model model, TicketVO param, ExhibitionVO exparam) throws Exception {
		TicketVO vo = ticketService.read(param.getNo());
		ArrayList<ExhibitionVO> list = exhibitionService.ingList(exparam);
		model.addAttribute("vo", vo);
		model.addAttribute("param", param);
		model.addAttribute("list", list);
		
		return "manage/ticket/edit";
	}
	
	//예매 회원 검색 페이지
	@RequestMapping("/manage/ticket/searchMemb")
	public String search(Model model, TicketVO param, MemberVO mparam) throws Exception {
		int[] rowPageCount = memberService.count(mparam);
		ArrayList<MemberVO> list = memberService.list(mparam);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("param", param);
		
		return "manage/ticket/searchMemb";
	}
	
	//예매 메인 페이지 ajax
	@RequestMapping("/reserve/update")
	public String reserveUpdate(Model model, TicketVO param) throws Exception {
		ticketService.reserveUpdate(param);
		return "include/return";
	}

	//예매 등록, 수정, 삭제 실행
	@RequestMapping("/manage/ticket/process")
	public String process(Model model, TicketVO param, HttpServletRequest request) throws Exception{
		model.addAttribute("vo", param);
		if("write".equals(param.getCmd())) {
			int r = ticketService.insert(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r,  "정상적으로 등록되었습니다.", "등록 실패"));
			model.addAttribute("url", "index");
		} else if("edit".equals(param.getCmd())) {
			int r = ticketService.update(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r,  "정상적으로 수정되었습니다.", "수정 실패"));
			model.addAttribute("url", param.getTargetURLParam("read", param, param.getNo()));
		}else if("delete".equals(param.getCmd())) {
			int r = ticketService.delete(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r,  "정상적으로 삭제되었습니다.", "삭제 실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, param.getReqPageNo()));
		} else if("groupDelete".equals(param.getCmd())) {
			int r = ticketService.groupDelete(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r,  "총 " + r + "건이 정상적으로 삭제되었습니다.", "삭제 실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, param.getReqPageNo()));
		}
		
		return "include/alert";
	}
}
