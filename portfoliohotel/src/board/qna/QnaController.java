package board.qna;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import board.qna.QnaVO;
import board.qna.QnaService;
import board.member.MemberVO;

import util.Function;

@Controller
public class QnaController {

	@Autowired
	QnaService qnaService;
	
	/*	[사용자]  QnA 목록	 */
	@RequestMapping("/support/qna/qna")
	public String qna(Model model, QnaVO param) throws Exception {
		int[] rowPageCount = qnaService.count(param);
		ArrayList<QnaVO> list = qnaService.list(param);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);
		
		return "support/qna/qna";
	}

	@RequestMapping("/support/qna/qna_q")
	public String qna_q(Model model, QnaVO param, HttpSession session) throws Exception {
		MemberVO vo = (MemberVO)session.getAttribute("memberInfo");
		
		model.addAttribute("vo", param);
		
		return "support/qna/qna_q";
	}
	
	@RequestMapping("/support/qna/qna_read")
	public String qna_read(Model model, QnaVO param, HttpSession session) throws Exception {
		QnaVO data = qnaService.read(param);
		MemberVO vo = (MemberVO)session.getAttribute("memberInfo");
		
		
		model.addAttribute("data", data);
		model.addAttribute("param", param);
		
		if(data.getNo() == param.getNo() && data.getPassword() == param.getPassword()) {
		return "support/qna/qna_edit";	
		}
		
		return "support/qna/qna_read";
	}
	
	@RequestMapping("/support/qna/qna_edit")
	public String qna_edit(Model model, QnaVO param) throws Exception {
		QnaVO data = qnaService.read(param);
		
		model.addAttribute("data", data);
		model.addAttribute("param", param);

		return "support/qna/qna_edit";
	}
	

	/*
	 * @RequestMapping("/membership/mypage") public String qna_myPage(Model model,
	 * QnaVO param) throws Exception { int[] rowPageCount = qnaService.count(param);
	 * ArrayList<QnaVO> list = qnaService.list(param);
	 * 
	 * model.addAttribute("totCount", rowPageCount[0]);
	 * model.addAttribute("totPage", rowPageCount[1]); model.addAttribute("qlist",
	 * list); model.addAttribute("qvo", param); return "membership/mypage"; }
	 */
	
	///
	@RequestMapping("/support/qna/popup")
	public String popup(Model model, QnaVO param, HttpSession session) throws Exception {
		QnaVO data = qnaService.read(param);
		MemberVO vo = (MemberVO)session.getAttribute("memberInfo");
		
		model.addAttribute("data", data);
		model.addAttribute("param", param);
		if(data.getNo() == param.getNo() && data.getPassword() == param.getPassword()) {
		return "support/qna/qna_read";	
		}
		return "support/qna/qna_read";
		/* return "/membership/popup"; */
	}
	
	@RequestMapping("/support/qna/processU")
	public String processU(Model model, QnaVO param, HttpServletRequest request) throws Exception {
		model.addAttribute("param", param);
		QnaVO data = qnaService.read(param);
		System.out.println(param.getCmd());
		if ("write".equals(param.getCmd())) {
			int r = qnaService.insert(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "qna");
		} else if ("checkPW".equals(param.getCmd())) {
			System.out.println(data.getPassword());
			System.out.println(param.getPassword());
			if(data.getPassword().equals(param.getPassword())) {
				model.addAttribute("code", "alertMessageUrl");
				model.addAttribute("message", "성공!");
				model.addAttribute("url", "/support/qna/qna_edit?no=" + param.getNo());
			}else {
				model.addAttribute("code", "alertMessageUrl");
				model.addAttribute("message", "비밀번호가 올바르지 않습니다.");
				model.addAttribute("url", "/support/qna/qna_read?no=" + param.getNo());
			}
		}else if ("edit".equals(param.getCmd())) {
			int r = qnaService.update(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다.", "수정실패"));
			model.addAttribute("url", "/support/qna/qna_read?no=" + param.getNo());
		}
		
		
		return "include/alert";
	}



	// ======================= 관리자 ===============================================

	
	/*	[관리자]  QnA 목록	 */ 
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
	
	/*	[관리자]  QnA 글쓰기	 */ 
	@RequestMapping("/manage/board/qna/write")
	public String write(Model model, QnaVO param) throws Exception {
		model.addAttribute("vo", param);

		return "manage/board/qna/write";
	}
	
	/*	[관리자]  QnA 수정	 */ 
	@RequestMapping("/manage/board/qna/edit")
	public String edit(Model model, QnaVO param) throws Exception {

		QnaVO data = qnaService.read(param);
		model.addAttribute("data", data);
		model.addAttribute("param", param);

		return "manage/board/qna/edit";
	}
	
	/*	[관리자]  QnA 세부	 */ 
	@RequestMapping("/manage/board/qna/read")
	public String read(Model model, QnaVO param) throws Exception {
		QnaVO data = qnaService.read(param);
		model.addAttribute("data", data);
		model.addAttribute("param", param);

		return "manage/board/qna/read";
	}
	
	/*	[관리자]  QnA 답변	 */ 
	@RequestMapping("/manage/board/qna/write_reply")
	public String write_reply(Model model, QnaVO param) throws Exception {
		QnaVO data = qnaService.read(param);
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		
		return "manage/board/qna/write_reply";
	}
	
	/*	[관리자]  QnA 답변 수정	 */
	@RequestMapping("/manage/board/qna/edit_reply")
	public String edit_reply(Model model, QnaVO param) throws Exception {
		QnaVO data = qnaService.read(param);
		model.addAttribute("data", data);
		model.addAttribute("vo", param);

		return "manage/board/qna/edit_reply";
	}
	
	/*	[관리자]  QnA 답변 삭제	 */
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
