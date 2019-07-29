package pkg;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import manage.admin.AdminVO;
import util.Function;

@Controller
public class PkgController {

	@Autowired
	PkgService pkgService;
	
	/* [관리자] pkg 목록 */
	@RequestMapping("/manage/pkg/index")
	public String index(Model model, PkgVO param) throws Exception {
		param.setTablename("pkg");
		int[] rowPageCount = pkgService.count(param);
		ArrayList<PkgVO> list = pkgService.list(param);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);
		
		return "manage/pkg/index";
	}		
	
	/* [관리자] pkg 글쓰기 */
	@RequestMapping("/manage/pkg/write")
	public String insertReview(Model model, PkgVO param) throws Exception {
		model.addAttribute("vo", param);
		return "manage/pkg/write";
	}
	
	/* [관리자] 패키지 상세페이지 */
	@RequestMapping("/manage/pkg/read")
	public String read(Model model, PkgVO param) throws Exception {
		PkgVO data = pkgService.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("param", param);
		
		return "manage/pkg/read";
	}
	
	/* [관리자] pkg 수정 */
	@RequestMapping("/manage/pkg/edit")
	public String edit(Model model, PkgVO param) throws Exception {
		PkgVO data = pkgService.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		return "manage/pkg/edit";
	}
	
	/**
	 * 등록, 수정, 삭제 cmd값으로 구분해서 처리
	 * @param model
	 * @param param
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/pkg/process")
	public String process(Model model, PkgVO param, HttpServletRequest request) throws Exception {
		model.addAttribute("vo", param);
		param.setTablename("pkg");
		System.out.println(param.getCmd());
		
		if ("write".equals(param.getCmd()) ) {
			int r = pkgService.insert(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "index");
		} else if ("edit".equals(param.getCmd())) {
			int r = pkgService.update(param, request);
			//productService.deleteOption(param.getNo()); //왜 getNo()
			/* noticeService.insertOption(request, param.getNo()); */
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다.", "수정실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		} else if ("delete".equals(param.getCmd())) {
			int r = pkgService.delete(param.getNo());
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		} else if ("groupDelete".equals(param.getCmd())) {
			int r = pkgService.groupDelete(request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "총 "+r+"건이 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		}		
		return "include/alert";
	}
	 
	@RequestMapping("/pkg/dining/petit")
	public String petit(Model model, PkgVO param) {
		
		return "pkg/dining/petit";
	}
	
	@RequestMapping("/pkg/birthday/birthday2")
	public String birthday(Model model, PkgVO param) {
		
		return "pkg/birthday/birthday2";
	}
	
	@RequestMapping("/pkg/birthday/birthday")
	public String Senseof(Model model, PkgVO param)  throws Exception {
		PkgVO data = pkgService.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("param", param);
		
		return "pkg/birthday/birthday";
	}
	
	@RequestMapping("/pkg/dining/granum")
	public String granum(Model model, PkgVO param) {
		
		return "pkg/dining/granum";
	}
	
	@RequestMapping("/pkg/dining/dining_offer")
	public String dining_offer(Model model, PkgVO param) throws Exception {
		
		return "pkg/dining/dining_offer";
	}
	
	@RequestMapping("/book/pkg_book_channel") 
	public String pkg_book_channel(Model model, PkgVO param) throws Exception {
		
		return "book/pkg_book_channel";
	}
	
	@RequestMapping("/book/dining_pkg_book")
	public String dining_pkg_book(Model model, PkgVO param) {
		
		return "book/dining_pkg_book";
	}
	
	@RequestMapping("/pkg/room/reasonable")
	public String reasonable(Model model, PkgVO param) {
		
		return "pkg/room/reasonable";
	}
	
	@RequestMapping("/pkg/room/room_offer")
	public String room_offer(Model model, PkgVO param) {
		
		return "pkg/room/room_offer";
	}
	
	@RequestMapping("/pkg/room/bbq")
	public String ppq(Model model, AdminVO param) throws Exception {
		
		return "pkg/room/bbq";
	}
	
	@RequestMapping("/pkg/room/senseof")
	public String senseof(Model model, AdminVO param) throws Exception {
		
		return "pkg/room/senseof";
	}
	
	@RequestMapping("/pkg/room/oasis")
	public String oasis(Model model, AdminVO param) throws Exception {
		
		return "pkg/room/oasis";
	}
	
}
