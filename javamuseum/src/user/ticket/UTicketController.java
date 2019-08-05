package user.ticket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import util.Function;

@Controller
public class UTicketController {

	@Autowired
	private UTicketService uticketService;
	
	@RequestMapping("/user/exhibition/process")
	public String process(Model model, UTicketVO param) throws Exception {
		if("reserve".equals(param.getCmd())) {
			int r = uticketService.insert(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r,  "정상적으로 예매되었습니다.", "예매 실패"));
			model.addAttribute("url", "/user/exhibition/subExhibition1");
		}
		
		return "include/alert";
	}
}
