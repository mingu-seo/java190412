package board.notice;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import board.notice3.NoticeVO3;
import manage.admin.AdminVO;

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
	
}
