package board.notice;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import util.Function;

@Controller
public class NoticeController {

	@Autowired
	NoticeService noticeService;

	@RequestMapping("/manage/board/notice/index")
	public String index(Model model, NoticeVO param) throws Exception {
		param.setTablename("notice");
		int[] rowPageCount = noticeService.count(param);
		ArrayList<NoticeVO> list = noticeService.list(param);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);
		
		return "manage/board/notice/index";
	}	
	
	@RequestMapping("/membership/notice")
	public String Nindex(Model model, NoticeVO param) throws Exception {
		param.setTablename("notice");
		int[] rowPageCount = noticeService.count(param);
		ArrayList<NoticeVO> list = noticeService.list(param);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);
		
		return "membership/notice";
	}	
	
	@RequestMapping("/manage/board/notice/read")
	public String read(Model model, NoticeVO param) throws Exception {
		NoticeVO data = noticeService.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("param", param);
		
		return "manage/board/notice/read";
	}
	
	@RequestMapping("/manage/board/notice/edit")
	public String edit(Model model, NoticeVO param) throws Exception {
		NoticeVO data = noticeService.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		return "manage/board/notice/edit";
	}
	
	@RequestMapping("/manage/board/notice/write")
	public String insertReview(Model model, NoticeVO param) throws Exception {
		model.addAttribute("vo", param);
		return "manage/board/notice/write";
	}
	
	@RequestMapping("/manage/board/notice/delete")
	public String deleteReview(Model model, NoticeVO param) throws Exception {
		noticeService.delete(param.getNo());
		
		return "manage/board/notice/delete";
	}
	
	/**
	 * 등록, 수정, 삭제 cmd값으로 구분해서 처리
	 * @param model
	 * @param param
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/board/notice/process")
	public String process(Model model, NoticeVO param, HttpServletRequest request) throws Exception {
		model.addAttribute("vo", param);
		param.setTablename("notice");
		System.out.println(param.getCmd());
		
		if ("write".equals(param.getCmd()) ) {
			
			int r = noticeService.insert(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "index");
		} else if ("edit".equals(param.getCmd())) {
			int r = noticeService.update(param, request);
			//productService.deleteOption(param.getNo()); //왜 getNo()
			/* noticeService.insertOption(request, param.getNo()); */
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다.", "수정실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		} else if ("delete".equals(param.getCmd())) {
			int r = noticeService.delete(param.getNo());
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		} else if ("groupDelete".equals(param.getCmd())) {
			int r = noticeService.groupDelete(request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "총 "+r+"건이 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		}		
		return "include/alert";
	}
}
