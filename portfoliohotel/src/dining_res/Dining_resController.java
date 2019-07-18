package dining_res;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dining.DiningService;
import dining.DiningVO;

@Controller
public class Dining_resController {
	
	@Autowired
	DiningService diningService;
	
	@RequestMapping("/manage/dining_res/index")
	public String index(Model model, Dining_resVO param) throws Exception {
		param.setTablename("dining_res");
		int[] rowPageCount = dining_resService.count(param);
		ArrayList<DiningVO> list = dining_resService.list(param);

		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);

		return "manage/dining/index";
	}

	
}
