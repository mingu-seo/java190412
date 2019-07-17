package manage.doctor;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import manage.admin.AdminVO;
import member.MemberVO;
import util.Function;

@Controller
public class DoctorController {

	@Autowired
	private DoctorService doctorService;
	
	
	@RequestMapping("/manage/doctor/index")
	public String index(Model model, DoctorVO param) throws Exception {
		int[] rowPageCount = doctorService.count(param);
		ArrayList<DoctorVO> list = doctorService.list(param);

		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);

		return "manage/doctor/index";
	}


	@RequestMapping("/manage/doctor/write")
	public String write(Model model, DoctorVO param) throws Exception {
		model.addAttribute("vo", param);

		return "manage/doctor/write";
	}

	
	@RequestMapping("/manage/doctor/process")
	public String process(Model model, DoctorVO param,  HttpServletRequest request) throws Exception {
		model.addAttribute("doctorvo", param);
		if ("write".equals(param.getCmd())) {
			int r = doctorService.insert(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "index");
		} else if ("edit".equals(param.getCmd())) {
			int r = doctorService.update(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다.", "수정실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		} else if ("groupDelete".equals(param.getCmd())) {
			int r = doctorService.groupDelete(request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "총 " + r + "건이 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		} else if ("delete".equals(param.getCmd())) {
			int r = doctorService.delete(param.getNo());
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		}
		
		return "include/alert";
	}

	
}
