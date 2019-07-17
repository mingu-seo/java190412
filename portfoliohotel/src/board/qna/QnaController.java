package board.qna;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import board.notice.NoticeVO;
import board.qna.QnaService;
import manage.admin.AdminVO;
import util.Function;

@Controller
public class QnaController {
	
	@Autowired
	QnaService qnaService;
	
	@RequestMapping("/membership/qna.do")
	public String qna(Model model, QnaVO param) throws Exception {
		
		return "membership/qna";
	}
	
	@RequestMapping("/membership/qna_q.do")
	public String qna_q(Model model, QnaVO param) throws Exception {
		
		return "membership/qna_q";
	}
	
	//관리자
	
	@RequestMapping("/manage/board/qna/index.do")
	public String index(Model model, QnaVO param) throws Exception {
		
		
		return "manage/board/qna/index";
	}
	
	
	@RequestMapping("/manage/board/qna/write.do")
	public String write(Model model, QnaVO param) throws Exception {
		model.addAttribute("vo", param);
		
		return "manage/board/qna/write";
	}
//	
//	@RequestMapping("/manage/board/qna/edit")
//	public String edit(Model model, QnaVO param) throws Exception {
//		
//		param.setTablename("qna");
//		int[] rowPageCount = qnaService.count(param);
//		ArrayList<QnaVO> list = qnaService.list(param);
//		
//		model.addAttribute("totCount", rowPageCount[0]);
//		model.addAttribute("totPage", rowPageCount[1]);
//		model.addAttribute("list", list);
//		model.addAttribute("vo", param);
//		
//		
//		return "membership/qna";
//	}
//	
//	@RequestMapping("/manage/qna/process")
//	public String process(Model model, QnaVO param, HttpServletRequest request) throws Exception {
//		model.addAttribute("qvo", param);
//		
//		if ("write".equals(param.getCmd())) {
//			int r = qnaService.insert(param, request);
//			model.addAttribute("code", "alertMessageUrl");
//			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
//			model.addAttribute("url", "/manage/qna/read?no="+param.getNo());
//		} else if ("edit".equals(param.getCmd())) {
//			int r = qnaService.update(param);
//			model.addAttribute("code", "alertMessageUrl");
//			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다.", "수정실패"));
//			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
//		} else if ("groupDelete".equals(param.getCmd())) {
//			int r = qnaService.groupDelete(request);
//			model.addAttribute("code", "alertMessageUrl");
//			model.addAttribute("message", Function.message(r, "총 "+r+"건이 삭제되었습니다.", "삭제실패"));
//			model.addAttribute("url", "/manage/qna/read?no="+param.getNo());
//		} else if ("delete".equals(param.getCmd())) {
//			int r = qnaService.delete(param.getNo());
//			model.addAttribute("code", "alertMessageUrl");
//			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패"));
//			model.addAttribute("url", "/manage/qna/read?no="+param.getNo());
//		}
//		
//		return "include/alert";
//	}
}
