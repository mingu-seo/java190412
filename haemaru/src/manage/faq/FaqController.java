package manage.faq;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import util.Function;


@Controller
public class FaqController {

	@Autowired
	private FaqService faqService;
	
	@RequestMapping("/manage/faq/index")
	public String index(Model model, FaqVO param) throws Exception {
		int[] rowPageCount = faqService.count(param);
		ArrayList<FaqVO> list = faqService.list(param);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);
		
		return "manage/faq/index";
	}
	
	@RequestMapping("/cscenter/faq/faq")
	public String faq(Model model, FaqVO param) throws Exception {
		int[] rowPageCount = faqService.count(param);
		ArrayList<FaqVO> list = faqService.list(param);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);
		
		return "cscenter/faq/faq";
	}
	
	@RequestMapping("/manage/faq/read")
	public String read(Model model, FaqVO param) throws Exception {
		FaqVO data = faqService.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		
		return "manage/faq/read";
	}
	
	@RequestMapping("/manage/faq/edit")
	public String edit(Model model, FaqVO param) throws Exception {
		FaqVO data = faqService.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		
		return "manage/faq/edit";
	}
	
	@RequestMapping("/manage/faq/write")
	public String write(Model model, FaqVO param) throws Exception {
		model.addAttribute("vo", param);
		
		return "manage/faq/write";
	}
	
	/**
	 * 관리자 아이디 중복체크
	 * 사용자에서 저장시 ajax로 체크
	 * @param model
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/faq/idcheck")
	public String idcheck(Model model, FaqVO param) throws Exception {
		model.addAttribute("vo", param);
		int value = faqService.idcheck(param);

		model.addAttribute("value", value);
		
		return "include/return";
	}
	
	/**
	 * 등록, 수정, 삭제 cmd값으로 구분해서 처리
	 * @param model
	 * @param param
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/faq/process")
	public String process(Model model, FaqVO param, HttpServletRequest request) throws Exception {
		model.addAttribute("vo", param);
		
		if ("write".equals(param.getCmd())) {
			int r = faqService.insert(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "index");
		} else if ("edit".equals(param.getCmd())) {
			int r = faqService.update(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다.", "수정실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		} else if ("groupDelete".equals(param.getCmd())) {
			int r = faqService.groupDelete(request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "총 "+r+"건이 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		} else if ("delete".equals(param.getCmd())) {
			int r = faqService.delete(param.getNo());
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		}
		
		return "include/alert";
	}
	
//	@RequestMapping("/manage/faq/loginHistory")
//	public String loginHistory(Model model, FaqVO param) throws Exception {
//		int[] rowPageCount = faqService.countLoginHistory(param);
//		ArrayList<FaqVO> list = faqService.listLoginHistory(param);
//		
//		model.addAttribute("totCount", rowPageCount[0]);
//		model.addAttribute("totPage", rowPageCount[1]);
//		model.addAttribute("list", list);
//		model.addAttribute("vo", param);
//		
//		return "manage/faq/loginHistory";
//	}
}
