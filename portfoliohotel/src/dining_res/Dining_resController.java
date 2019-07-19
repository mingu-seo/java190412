package dining_res;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import util.Function;

@Controller
public class Dining_resController {

	@Autowired
	Dining_resService dining_resService;

	@RequestMapping("/manage/dining_res/index")
	public String index(Model model, Dining_resVO param) throws Exception {
		param.setTablename("dining_res");
		int[] rowPageCount = dining_resService.count(param);
		ArrayList<Dining_resVO> list = dining_resService.list(param);

		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);

		return "manage/dining_res/index";
	}

	@RequestMapping("/manage/dining_res/write")
	public String write(Model model, Dining_resVO param) throws Exception {
		model.addAttribute("vo", param);

		return "manage/dining_res/write";
	}

	@RequestMapping("/manage/dining_res/process.do")
	public String process(Model model, Dining_resVO param) throws Exception {
		model.addAttribute("vo", param);

		if ("write".equals(param.getCmd())) {
			int r = dining_resService.insert(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "index");
		}
		return "include/alert";
	}
}
