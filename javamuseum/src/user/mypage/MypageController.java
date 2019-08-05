package user.mypage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import manage.member.MemberVO;
import manage.ticket.TicketVO;
import user.ticket.UTicketService;
import user.ticket.UTicketVO;

@Controller
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	@Autowired
	private UTicketService uticketService;
	
	@RequestMapping("/user/mypage/mypage")
	public String mypage(Model model, UTicketVO param, HttpServletRequest request) throws Exception {
		MemberVO member = (MemberVO)request.getSession().getAttribute("memberInfo");

		model.addAttribute("param", param);
		return "user/mypage/mypage";
	}
	
	@RequestMapping("/user/mypage/ticket")
	public String ticket(Model model, UTicketVO param, TicketVO tparam) throws Exception {
		ArrayList<UTicketVO> myResList = mypageService.myResList(param.getMember_pk());
		int[] resRowPageCount = mypageService.resCount(param);		//마이페이지 예매내역 페이징
		
		model.addAttribute("tparam", tparam);
		model.addAttribute("myResList", myResList);
		model.addAttribute("restotCount", resRowPageCount[0]);
		model.addAttribute("restotPage", resRowPageCount[1]);
		return "user/mypage/ticket";
	}
	
	
	@RequestMapping("/user/mypage/cancel") 
	public String ticketCancel(Model model, UTicketVO param) throws Exception { 
		uticketService.cancel(param);
	
		return "include/return"; 
	}
	 
}