package manage.reserve;

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
public class ReserveContoller {

	@Autowired
	private ReserveService reserveService;
	
	
	@RequestMapping("/manage/reserve/index")
	public String index(Model model, ReserveVO param) throws Exception {
		int[] rowPageCount = reserveService.count(param);
		ArrayList<ReserveVO> list = reserveService.list(param);

		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);

		return "manage/reserve/index";
	}

	@RequestMapping("/manage/reserve/read")
	public String read(Model model, ReserveVO param) throws Exception {
		ReserveVO data = reserveService.read(param.getNo());
		
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		
		return "manage/reserve/read";
	}
	

	@RequestMapping("/manage/reserve/edit")
	public String edit(Model model, ReserveVO param) throws Exception {
		ReserveVO data = reserveService.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		return "manage/reserve/edit";
	}

	@RequestMapping("/manage/reserve/write")
	public String write(Model model, ReserveVO param) throws Exception {
		model.addAttribute("vo", param);

		return "manage/reserve/write";
	}

	

	@RequestMapping("/manage/reserve/process")
	public String process(Model model, ReserveVO param,  HttpServletRequest request) throws Exception {
		model.addAttribute("productvo", param);
		if ("write".equals(param.getCmd())) {
			int r = reserveService.insert(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "index");
		} else if ("edit".equals(param.getCmd())) {
			int r = reserveService.update(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다.", "수정실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		} else if ("groupDelete".equals(param.getCmd())) {
			int r = reserveService.groupDelete(request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "총 " + r + "건이 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		} else if ("delete".equals(param.getCmd())) {
			int r = reserveService.delete(param.getNo());
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		}
		
		return "include/alert";
	}

}
