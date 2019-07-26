package manage.adopt;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import util.Function;


@Controller
public class AdoptController {

	@Autowired
	private AdoptService adoptService;
	
	@RequestMapping("/adopt/animalprofile/animalprofile")
	public String animalprofile(Model model, AdoptVO param) throws Exception {
		int[] rowPageCount = adoptService.count(param);
		param.setAnimal_category(1);
		ArrayList<AdoptVO> list = adoptService.list(param);
		param.setAnimal_category(2);
		ArrayList<AdoptVO> clist = adoptService.list(param);
		param.setAnimal_category(3);
		ArrayList<AdoptVO> slist = adoptService.list(param);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("list2", clist);
		model.addAttribute("list3", slist);
		model.addAttribute("vo", param);
		
		return "adopt/animalprofile/animalprofile";
	}	
	
	
	@RequestMapping("/manage/adopt/index")
	public String index(Model model, AdoptVO param) throws Exception {
		int[] rowPageCount = adoptService.count(param);
		ArrayList<AdoptVO> list = adoptService.list(param);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);
		
		return "manage/adopt/index";
	}
	
	@RequestMapping("/manage/adopt/read")
	public String read(Model model, AdoptVO param) throws Exception {
		AdoptVO data = adoptService.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		
		return "manage/adopt/read";
	}
	
	@RequestMapping("/manage/adopt/edit")
	public String edit(Model model, AdoptVO param) throws Exception {
		AdoptVO data = adoptService.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		
		return "manage/adopt/edit";
	}
	
	@RequestMapping("/manage/adopt/write")
	public String write(Model model, AdoptVO param) throws Exception {
		model.addAttribute("vo", param);
		
		return "manage/adopt/write";
	}
	
	/**
	 * 관리자 아이디 중복체크
	 * 사용자에서 저장시 ajax로 체크
	 * @param model
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/adopt/idcheck")
	public String idcheck(Model model, AdoptVO param) throws Exception {
		model.addAttribute("vo", param);
		int value = adoptService.idcheck(param);

		model.addAttribute("value", value);
		
		return "include/return";
	}
	
	/**
	 * 등록, 수정, 삭제 cmd값으로 구분해서 처리
	 * @param model
	 * @param param
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/adopt/process")
	public String process(Model model, AdoptVO param, HttpServletRequest request) throws Exception {
		model.addAttribute("vo", param);
		
		if ("write".equals(param.getCmd())) {
			int r = adoptService.insert(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "index");
		} else if ("edit".equals(param.getCmd())) {
			int r = adoptService.update(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다.", "수정실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		} else if ("groupDelete".equals(param.getCmd())) {
			int r = adoptService.groupDelete(request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "총 "+r+"건이 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		} else if ("delete".equals(param.getCmd())) {
			int r = adoptService.delete(param.getNo());
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		}
		
		return "include/alert";
	}
	
//	@RequestMapping("/manage/adopt/loginHistory")
//	public String loginHistory(Model model, AdoptVO param) throws Exception {
//		int[] rowPageCount = adoptService.countLoginHistory(param);
//		ArrayList<AdoptVO> list = adoptService.listLoginHistory(param);
//		
//		model.addAttribute("totCount", rowPageCount[0]);
//		model.addAttribute("totPage", rowPageCount[1]);
//		model.addAttribute("list", list);
//		model.addAttribute("vo", param);
//		
//		return "manage/adopt/loginHistory";
//	}
	
	
	
}
