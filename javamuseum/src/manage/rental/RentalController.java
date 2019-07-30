package manage.rental;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import email.SendMail;
import util.Function;


@Controller
public class RentalController {

	@Autowired
	private RentalService rentalService;
	
	@RequestMapping("/manage/rental/index")
	public String index(Model model, RentalVO param) throws Exception {
		int[] rowPageCount = rentalService.count(param);
		ArrayList<RentalVO> list = rentalService.list(param);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);
		
		return "manage/rental/index";
	}
	
	@RequestMapping("/manage/rental/read")
	public String read(Model model, RentalVO param) throws Exception {
		RentalVO data = rentalService.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		
		return "manage/rental/read";
	}
	
	@RequestMapping("/user/hall2")	// 사용자 페이지 - 대관 신청
	public String write(Model model, RentalVO param) throws Exception {
		model.addAttribute("vo", param);
		return "user/hall2";
	}
	
	@RequestMapping("/user/rental/process")
	public String process(Model model, RentalVO param, HttpServletRequest request) throws Exception {
		model.addAttribute("vo", param);
		
		if ("write".equals(param.getCmd())) {
			int r = rentalService.insert(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "/user/hall2");
		}
		if ("sendMail".equals(param.getCmd())) {
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 송신되었습니다.", "송신실패"));
			model.addAttribute("url", "/manage/rental/read?no=" + param.getNo());
		} 
		return "include/alert";
	}
	
}
