package dining;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import util.Function;

@Controller
public class DiningController {

	@Autowired
	DiningService diningService;

	@RequestMapping("/manage/dining/index")
	public String index(Model model, DiningVO param) throws Exception {
		param.setTablename("dining");
		int[] rowPageCount = diningService.count(param);
		ArrayList<DiningVO> list = diningService.list(param);

		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);

		return "manage/dining/index";
	}

	@RequestMapping("/manage/dining/read")
	public String read(Model model, DiningVO param) throws Exception {
		DiningVO data = diningService.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("vo", param);

		return "manage/dining/read";
	}

	@RequestMapping("/manage/dining/edit")
	public String edit(Model model, DiningVO param) throws Exception {
		DiningVO data = diningService.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("vo", param);

		return "manage/dining/edit";
	}

	@RequestMapping("/manage/dining/write")
	public String write(Model model, DiningVO param) throws Exception {
		model.addAttribute("vo", param);

		return "manage/dining/write";
	}

	@RequestMapping("/dining/thefesta")
	public String thefesta(Model model, DiningVO param) throws Exception {
		DiningVO data = diningService.read(36);
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		return "dining/thefesta";
	}

	@RequestMapping("/dining/granum-dining")
	public String granum_dining(Model model, DiningVO param) throws Exception {
			DiningVO data = diningService.read(37);
			model.addAttribute("data", data);
			model.addAttribute("vo", param);
			return "dining/granum-dining";
		}

	@RequestMapping("/dining/moon-bar")
	public String moon_bar(Model model, DiningVO param) throws Exception {
		DiningVO data = diningService.read(38);
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		return "dining/moon-bar";
	}

	@RequestMapping("/dining/outdoor-kitchen")
	public String outdoor_kitchen(Model model, DiningVO param) throws Exception {
		DiningVO data = diningService.read(39);
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		return "dining/outdoor-kitchen";
	}

	@RequestMapping("/book/confirm-dining")
	public String confirm_dining(Model model, DiningVO param) throws Exception {

		return "book/confirm-dining";
	}

	@RequestMapping("/manage/dining/process.do")
	public String process(Model model, DiningVO param, HttpServletRequest request) throws Exception {
		model.addAttribute("vo", param);

		if ("write".equals(param.getCmd())) {
			System.out.println("info:" + param.getInfo());
			int r = diningService.insert(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "index");
		} else if ("edit".equals(param.getCmd())) {
			int r = diningService.update(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다.", "수정실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		} else if ("groupDelete".equals(param.getCmd())) {
			int r = diningService.groupDelete(request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "총 " + r + "건이 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		} else if ("delete".equals(param.getCmd())) {
			int r = diningService.delete(param.getNo());
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		}

		return "include/alert";
	}
}


