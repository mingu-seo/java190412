package board.qna;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import board.qna.QnaVO;
import board.notice.NoticeVO;
import board.qna.QnaService;
import manage.admin.AdminVO;

import room.Room_optVO;
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

	// 관리자

	@RequestMapping("/manage/board/qna/index")
	public String index(Model model, QnaVO param) throws Exception {

		param.setTablename("qna");
		int[] rowPageCount = qnaService.count(param);
		ArrayList<QnaVO> list = qnaService.list(param);

		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);

		return "manage/board/qna/index";
	}

	@RequestMapping("/manage/board/qna/write")
	public String write(Model model, QnaVO param) throws Exception {
		model.addAttribute("vo", param);

		return "manage/board/qna/write";
	}

	@RequestMapping("/manage/board/qna/edit")
	public String edit(Model model, QnaVO param) throws Exception {

		QnaVO data = qnaService.read(param);
		model.addAttribute("data", data);
		model.addAttribute("param", param);

		return "manage/board/qna/edit";
	}

	@RequestMapping("/manage/board/qna/read")
	public String read(Model model, QnaVO param) throws Exception {
		QnaVO data = qnaService.read(param);
		model.addAttribute("data", data);
		model.addAttribute("param", param);

		return "manage/board/qna/read";
	}

	@RequestMapping("/manage/board/qna/write_reply")
	public String write_reply(Model model, QnaVO param) throws Exception {
		QnaVO data = qnaService.read(param);
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		
		return "manage/board/qna/write_reply";
	}
	
	@RequestMapping("/manage/board/qna/edit_reply")
	public String edit_reply(Model model, QnaVO param) throws Exception {
		QnaVO data = qnaService.read(param);
		model.addAttribute("data", data);
		model.addAttribute("vo", param);

		return "manage/board/qna/edit_reply";
	}
	
	@RequestMapping("/manage/board/qna/delete_reply")
	public String delete_reply(Model model, QnaVO param) throws Exception {
		QnaVO data = qnaService.read(param);
		model.addAttribute("data", data);
		model.addAttribute("vo", param);

		return "manage/board/qna/delete_reply";
	}



	@RequestMapping("/manage/board/qna/process")
	public String process(Model model, QnaVO param, HttpServletRequest request) throws Exception {
		model.addAttribute("param", param);

		if ("write".equals(param.getCmd())) {
			int r = qnaService.insert(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "index");
		} else if ("edit".equals(param.getCmd())) {
			int r = qnaService.update(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다.", "수정실패"));
			model.addAttribute("url", "/manage/board/qna/read?no=" + param.getNo());
		} else if ("groupDelete".equals(param.getCmd())) {
			int r = qnaService.groupDelete(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "총 " + r + "건이 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		} else if ("delete".equals(param.getCmd())) {
			int r = qnaService.delete(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		} else if ("write_reply".equals(param.getCmd())) {
			int r = qnaService.updateReply(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "답변이 정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url","/manage/board/qna/read?no=" + param.getNo());
		} else if ("edit_reply".equals(param.getCmd())) {
			int r = qnaService.updateReply(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "답변이 정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url","/manage/board/qna/read?no=" + param.getNo());
		} else if ("delete_reply".equals(param.getCmd())) {
			int r = qnaService.deleteReply(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", "/manage/board/qna/read?no=" + param.getNo());
		}
		return "include/alert";
	}

	/*
	 * @RequestMapping("/manage/board/qna/write_reply") public String
	 * write_reply(Model model, QnaVO param)throws Exception {
	 * qnaService.replyInsert(param); int a = productService.reviewInsert(param);
	 * model.addAttribute("value", a); return "include/return";
	 * 
	 * }
	 * 
	 * @RequestMapping("/manage/board/qna/write_delete") public String
	 * deleteReply(Model model, QnaVO param)throws Exception {
	 * qnaService.replyDelete(param.getNo()); return "include/return";
	 * 
	 * }
	 */

}
