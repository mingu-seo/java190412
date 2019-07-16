package pet;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import manage.admin.AdminVO;
import util.Function;

@Controller
public class PetController {

	@Autowired
	private PetService petService;
	
	@RequestMapping("/manage/pet/index")
	public String index(Model model, PetVO param) throws Exception {
		int[] rowPageCount = petService.count(param);
		ArrayList<PetVO> list = petService.list(param);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);
	
		return "manage/pet/index";
	}
	
	@RequestMapping("/manage/pet/read")
	public String read(Model model, PetVO param) throws Exception {
		PetVO data = petService.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		
		return "manage/pet/read";
	}
	
	@RequestMapping("/manage/pet/edit")
	public String edit(Model model, PetVO param) throws Exception {
		PetVO data = petService.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		
		return "manage/pet/edit";
	}
	
	@RequestMapping("/manage/pet/write")
	public String write(Model model, PetVO param) throws Exception {
		model.addAttribute("vo", param);
		
		return "manage/pet/write";
	}
	
	@RequestMapping("/my/my-pet.do")
	public String myInfor(Model model, PetVO param) throws Exception {
		PetVO data = petService.read(param.getNo());//세션에서 가져와야됨
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		
		return "my/my-pet.do";
	}
	
	/**
	 * 관리자 아이디 중복체크
	 * 사용자에서 저장시 ajax로 체크
	 * @param model
	 * @param param
	 * @return
	 * @throws Exception
	 */
	
	@RequestMapping("/manage/pet/idcheck")
	public String idcheck(Model model, PetVO param, HttpServletRequest request) throws Exception {
		model.addAttribute("vo", param);
		int value = petService.idcheck(request.getParameter("id"));

		model.addAttribute("value", value);
		
		return "include/return";
	}
	
	@RequestMapping("/manage/pet/process")
	public String process(Model model, PetVO param, HttpServletRequest request) throws Exception {
		model.addAttribute("vo", param);
		
		if ("write".equals(param.getCmd())) {
			int r = petService.insert(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "index");
		} else if ("edit".equals(param.getCmd())) {
			int r = petService.update(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다.", "수정실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		} else if ("groupDelete".equals(param.getCmd())) {
			int r = petService.groupDelete(request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "총 "+r+"건이 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		} else if ("delete".equals(param.getCmd())) {
			int r = petService.delete(param.getNo());
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		}
		
		return "include/alert";
	}
}
