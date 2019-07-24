package board.faq;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import board.notice.NoticeVO;
import manage.admin.AdminVO;
import util.Function;

@Controller
public class FaqController {

	@Autowired
	FaqService faqService;
	
	@RequestMapping("/manage/board/faq/index")
	public String index(Model model, FaqVO param) throws Exception {
		param.setTablename("faq");
		int[] rowPageCount = faqService.count(param);
		ArrayList<AdminVO> list = faqService.list(param);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);
		
		return "manage/board/faq/index";
	}
	
	@RequestMapping("/manage/board/faq/read")
	public String read(Model model, FaqVO param) throws Exception {
		FaqVO data = faqService.read(param, false);
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		
		return "manage/board/faq/read";
	}
	
	
	
	@RequestMapping("/manage/board/faq/write")
	public String write(Model model, FaqVO param) throws Exception {
		model.addAttribute("vo", param);
		
		return "manage/board/faq/write";
	}
	
	@RequestMapping("/manage/board/faq/edit")
	public String edit(Model model, FaqVO param) throws Exception {
		param.setTablename("faq");
		FaqVO data = faqService.read(param, false);
		model.addAttribute("data", data);
		model.addAttribute("param", param);
		
		return "manage/board/faq/edit";
	}
	
	
	/**
	 * 등록, 수정, 삭제 cmd값으로 구분해서 처리
	 * @param model
	 * @param param
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/board/faq/process.do")
	public String process(Model model, FaqVO param, HttpServletRequest request) throws Exception {
		model.addAttribute("vo", param);
		param.setTablename("faq");
		System.out.println(param.getCmd());
		if ("write".equals(param.getCmd())) {
			
			int r = faqService.insert(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "index");
		} else if ("edit".equals(param.getCmd())) {
			int r = faqService.update(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다.", "수정실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		} else if ("groupDelete".equals(param.getCmd())) {
			int r = faqService.groupDelete(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "총 "+r+"건이 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		} else if ("delete".equals(param.getCmd())) {
			int r = faqService.delete(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		}
		return "include/alert";
	}
	
	
	@RequestMapping("/customer/faq/index")
	public String main(Model model, FaqVO param) throws Exception {
		param.setTablename("notice");
		int[] rowPageCount = faqService.count(param);
		ArrayList<AdminVO> list = faqService.list(param);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);
		
		
		return "/customer/faq/index";
	}
	
}
