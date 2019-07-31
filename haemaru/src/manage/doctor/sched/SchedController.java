package manage.doctor.sched;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import manage.admin.AdminVO;
import member.MemberVO;
import util.Function;

@Controller
public class SchedController {

	@Autowired
	private SchedService schedService;
	
	
	@RequestMapping("/manage/sched/index")
	public String index(Model model, SchedVO param) throws Exception {
		int[] rowPageCount = schedService.count(param);
		ArrayList<SchedVO> list = schedService.list(param);

		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);

		return "manage/sched/index";
	}

	@RequestMapping("/manage/sched/read")
	public String read(Model model, SchedVO param) throws Exception {
		SchedVO data = schedService.read(param.getNo(), "");
		
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		
		return "manage/sched/read";
	}
	

	@RequestMapping("/manage/sched/edit")
	public String edit(Model model, SchedVO param, @RequestParam(value="noType", required = false) String noType) throws Exception {
		SchedVO data = schedService.read(param.getNo(), noType);
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		return "manage/sched/edit";
	}

	@RequestMapping("/manage/sched/write")
	public String write(Model model, SchedVO param) throws Exception {
		model.addAttribute("vo", param);

		return "manage/sched/write";
	}

	

	@RequestMapping("/manage/sched/process")
	public String process(Model model, SchedVO param,  HttpServletRequest request) throws Exception {
		model.addAttribute("productvo", param);
		if ("write".equals(param.getCmd())) {
			int r = schedService.insert(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "index");
		} else if ("edit".equals(param.getCmd())) {
			int r = schedService.update(param, request, null);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다.", "수정실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		} else if ("groupDelete".equals(param.getCmd())) {
			int r = schedService.groupDelete(request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "총 " + r + "건이 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		} else if ("delete".equals(param.getCmd())) {
			int r = schedService.delete(param.getNo());
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		}
		
		return "include/alert";
	}

}
