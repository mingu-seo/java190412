package pkg.dining;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import board.notice.NoticeVO;
import pkg.dining.PkgDiningVO;
import util.Function;

@Controller
public class PkgDiningController {

	@Autowired
	PkgDiningService pkgDiningService;
	
	/* [관리자] pkg 목록 */
	@RequestMapping("/manage/pkg/dining/index")
	public String index(Model model, PkgDiningVO param) throws Exception {
		param.setTablename("pkg");
		int[] rowPageCount = pkgDiningService.count(param);
		ArrayList<PkgDiningVO> list = pkgDiningService.list(param);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);
		
		return "manage/pkg/dining/index";
	}	
	
	/* [관리자] 공지사항 글쓰기 */
	@RequestMapping("/manage/pkg/dining/write")
	public String insertReview(Model model, PkgDiningVO param) throws Exception {
		model.addAttribute("vo", param);
		return "manage/pkg/dining/write";
	}
	
	/**
	 * 등록, 수정, 삭제 cmd값으로 구분해서 처리
	 * @param model
	 * @param param
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/pkg/dining/process")
	public String process(Model model, PkgDiningVO param, HttpServletRequest request) throws Exception {
		model.addAttribute("vo", param);
		param.setTablename("pkg");
		System.out.println(param.getCmd());
		
		if ("write".equals(param.getCmd()) ) {
			int r = pkgDiningService.insert(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "index");
		} 
		
		return "include/alert";
	}
	
	@RequestMapping("/pkg/dining/petit")
	public String petit(Model model, PkgDiningVO param) {
		
		return "pkg/dining/petit";
	}
	
	@RequestMapping("/pkg/dining/granum")
	public String granum(Model model, PkgDiningVO param) {
		
		return "pkg/dining/granum";
	}
	
	@RequestMapping("/pkg/dining/dining_offer")
	public String dining_offer(Model model, PkgDiningVO param) throws Exception {
		
		return "pkg/dining/dining_offer";
	}
	
	@RequestMapping("/book/pkg_book_channel") 
	public String pkg_book_channel(Model model, PkgDiningVO param) throws Exception {
		
		return "book/pkg_book_channel";
	}
	
	@RequestMapping("/book/dining_pkg_book")
	public String dining_pkg_book(Model model, PkgDiningVO param) {
		
		return "book/dining_pkg_book";
	}
	
	@RequestMapping("/pkg/room/reasonable")
	public String reasonable(Model model, PkgDiningVO param) {
		
		return "pkg/room/reasonable";
	}
}
