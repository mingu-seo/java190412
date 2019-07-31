package pkg.res;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import manage.admin.AdminVO;
import pkg.PkgVO;
import util.Function;

@Controller
public class Pkg_resController {

	@Autowired
	Pkg_resService pkg_resService;

	/* [관리자] pkg 목록 */
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

	/* [관리자] pkg 글쓰기 */
	
	  @RequestMapping("/manage/pkg/pkg_res/write") 
	  public String insertReview(Model model, Pkg_resVO param) throws Exception { 
		  model.addAttribute("vo", param); 
		  
		  return "manage/pkg/pkg_res/write"; 
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
			} 	
			return "include/alert";
		}

}
