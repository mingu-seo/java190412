package manage.program;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProgramController {

	@Autowired
	ProgramService programService;
	
	@RequestMapping("/manage/program/list")
	public String index(Model model, ProgramVO param) throws Exception {
		param.setTablename("program");
//		int[] rowPageCount = ProgramService.count(param);
		ArrayList<ProgramVO> list = programService.list(param);
		
//		model.addAttribute("totCount", rowPageCount[0]);
//		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);
		
		return "manage/program/list";
	}
	
//	@RequestMapping("/manage/board/notice/write")
//	public String write(Model model, NoticeVO param) throws Exception {
//		model.addAttribute("vo", param);
//		
//		return "manage/board/notice/write";
//	}
//	
//	@RequestMapping("/manage/board/notice/edit")
//	public String edit(Model model, NoticeVO param) throws Exception {
//		param.setTablename("notice");
//		NoticeVO data = noticeService.read(param, false);
//		model.addAttribute("data", data);
//		model.addAttribute("param", param);
//		
//		return "manage/board/notice/edit";
//	}
//	
//	/**
//	 * 등록, 수정, 삭제 cmd값으로 구분해서 처리
//	 * @param model
//	 * @param param
//	 * @param request
//	 * @return
//	 * @throws Exception
//	 */
//	@RequestMapping("/manage/board/notice/process.do")
//	public String process(Model model, NoticeVO param, HttpServletRequest request) throws Exception {
//		model.addAttribute("vo", param);
//		param.setTablename("notice");
//		System.out.println(param.getCmd());
//		if ("write".equals(param.getCmd())) {
//			
//			int r = noticeService.insert(param, request);
//			model.addAttribute("code", "alertMessageUrl");
//			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
//			model.addAttribute("url", "index");
//		} else if ("edit".equals(param.getCmd())) {
//			int r = noticeService.update(param);
//			model.addAttribute("code", "alertMessageUrl");
//			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다.", "수정실패"));
//			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
//		} else if ("groupDelete".equals(param.getCmd())) {
//			int r = noticeService.groupDelete(param, request);
//			model.addAttribute("code", "alertMessageUrl");
//			model.addAttribute("message", Function.message(r, "총 "+r+"건이 삭제되었습니다.", "삭제실패"));
//			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
//		} else if ("delete".equals(param.getCmd())) {
//			int r = noticeService.delete(param);
//			model.addAttribute("code", "alertMessageUrl");
//			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패"));
//			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
//		}
//		
//		return "include/alert";
//	}
}
