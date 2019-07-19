package board.qna;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import manage.admin.AdminVO;
import util.Function;

@Controller
public class QnaController {

	@Autowired
	QnaService qnaService;
	
	@RequestMapping("/manage/product/index")
	public String index(Model model, QnaVO param) throws Exception {
		param.setTablename("product");
		int[] rowPageCount = qnaService.count(param);
		ArrayList<AdminVO> list = qnaService.list(param);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);
		
		return "manage/product/index";
	}
	
	@RequestMapping("/manage/product/read")
	public String read(Model model, QnaVO param) throws Exception {
		QnaVO data = qnaService.read(param);
		ArrayList<HashMap> olist = qnaService.listOption(data.getNo());
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		model.addAttribute("olist", olist);
		
		return "manage/product/read";
	}
	
	
	@RequestMapping("/manage/product/write")
	public String write(Model model, QnaVO param) throws Exception {
		model.addAttribute("vo", param);
		
		return "manage/product/write";
	}
	
	@RequestMapping("/manage/product/edit")
	public String edit(Model model, QnaVO param) throws Exception {
		param.setTablename("product");
		QnaVO data = qnaService.read(param);
		ArrayList<HashMap> olist = qnaService.listOption(data.getNo());
		model.addAttribute("data", data);
		model.addAttribute("param", param);
		model.addAttribute("olist", olist);
		
		return "manage/product/edit";
	}
	
	@RequestMapping("/manage/product/reviewlist")
	public String reviewList(Model model, QnaVO param) throws Exception {
		ArrayList<QnaReplyVO> list = qnaService.reviewlist(param.getNo());
		model.addAttribute("list", list);		
		return "manage/product/reviewlist";
	}
	
	/**
	 * 등록, 수정, 삭제 cmd값으로 구분해서 처리
	 * @param model
	 * @param param
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/product/process")
	public String process(Model model, QnaVO param, HttpServletRequest request) throws Exception {
		model.addAttribute("vo", param);
		param.setTablename("product");
		System.out.println(param.getCmd());
		
		if ("write".equals(param.getCmd())) {
			int r = qnaService.insert(param, request);
			qnaService.insertOption(request, r);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "index");
		} else if ("edit".equals(param.getCmd())) {
			int r = qnaService.update(param);
			qnaService.deleteOption(param.getNo());
			qnaService.insertOption(request, param.getNo());
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다.", "수정실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		} else if ("groupDelete".equals(param.getCmd())) {
			int r = qnaService.groupDelete(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "총 "+r+"건이 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		} else if ("delete".equals(param.getCmd())) {
			int r = qnaService.delete(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		}
		
	
		return "include/alert";
	}
	
	@RequestMapping("/review/insert.do")
	public String insertReview(Model model, QnaReplyVO param) throws Exception {
		qnaService.reviewInsert(param);
		return "include/return";
	}
	
	@RequestMapping("/review/delete.do")
	public String deleteReview(Model model, QnaReplyVO param) throws Exception {
		qnaService.reviewDelete(param.getNo());
		return "include/return";
	}
}
