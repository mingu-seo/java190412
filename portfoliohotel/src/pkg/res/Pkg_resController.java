package pkg.res;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import manage.admin.AdminVO;
import pkg.PkgService;
import pkg.PkgVO;
import util.Function;

@Controller
public class Pkg_resController {

	@Autowired
	Pkg_resService pkg_resService;
	
	@Autowired
	PkgService pkgService;

	/* [관리자] pkg_res 목록 */
	@RequestMapping("/manage/pkg/pkg_res/index")
	public String index(Model model, Pkg_resVO param) throws Exception {
		param.setTablename("pkg_res");
		int[] rowPageCount = pkg_resService.count(param);
		ArrayList<Pkg_resVO> list = pkg_resService.list(param);

		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);

		return "manage/pkg/pkg_res/index";
	}

	/* [관리자] pkg_res 글쓰기 */
	
	 @RequestMapping("/manage/pkg/pkg_res/write") 
	 public String insertReview(Model model, Pkg_resVO param, HttpServletRequest request) throws Exception { 
	  model.addAttribute("vo", param); 
		  
		 return "manage/pkg/pkg_res/write"; 
	}
	  
	/* [사용자] pkg_res 글쓰기 */
	@RequestMapping("/book/pkg_pkg_book")
	public String insertReview(Model model, PkgVO param, Pkg_resVO rsparam) throws Exception {
		PkgVO prdata = pkgService.read(param.getNo());
		model.addAttribute("vo", param); 
		model.addAttribute("rsparam", rsparam);
		model.addAttribute("prdata", prdata);
		return "book/pkg_pkg_book";
	}
	 
		/**
		 * 등록, 수정, 삭제 cmd값으로 구분해서 처리
		 * @param model
		 * @param param
		 * @param request
		 * @return
		 * @throws Exception
		 */
	@RequestMapping("/manage/pkg/pkg_res/process")
	public String process(Model model, Pkg_resVO param, HttpServletRequest request) throws Exception {
		model.addAttribute("vo", param);
		param.setTablename("pkg_res");
		System.out.println(param.getCmd());
			
		if ("write".equals(param.getCmd()) ) {
			int r = pkg_resService.insert(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "index");
		} else if ("edit".equals(param.getCmd())) {
			int r = pkg_resService.update(param, request);
			//productService.deleteOption(param.getNo()); //왜 getNo()
			/* noticeService.insertOption(request, param.getNo()); */
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다.", "수정실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		} else if ("delete".equals(param.getCmd())) {
			int r = pkg_resService.delete(param.getNo());
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		} else if ("groupDelete".equals(param.getCmd())) {
			int r = pkg_resService.groupDelete(request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "총 "+r+"건이 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
			}	
			return "include/alert";
		}
	
	@RequestMapping("/book/confirm_pkg/process")
	public String pkg_res(Model model, Pkg_resVO param, HttpServletRequest request) throws Exception {
		model.addAttribute("vo", param);
		param.setTablename("pkg_res");
		System.out.println(param.getCmd());
			
		if ("write".equals(param.getCmd()) ) {
			int r = pkg_resService.insert(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "/book/confirm_pkg?no="+r);
		} 
		
		return "include/alert";
	}
	
	@RequestMapping("/book/confirm_pkg")
	public String dining(Model model, PkgVO param, Pkg_resVO rsparam) throws Exception {
		PkgVO pkg_data = pkgService.read(param.getNo());
		Pkg_resVO res_data = pkg_resService.read(rsparam.getNo());
		model.addAttribute("vo", param);
		model.addAttribute("pkg_data", pkg_data);
		model.addAttribute("res_param", rsparam);
		model.addAttribute("res_data", res_data);
		return "book/confirm_pkg";
	}	
	

}
