package dining;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dining.DiningVO;
import manage.admin.AdminVO;
import dining.DiningVO;

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
	
	@RequestMapping("/manage/dining/write")
	public String write(Model model, DiningVO param) throws Exception {
		model.addAttribute("vo", param);
		
		return "manage/dining/write";
	}
	
	
	@RequestMapping("/dining/thefesta.do")
	public String thefesta(Model model, AdminVO param) throws Exception {
		
		return "dining/thefesta";
	}
	
	@RequestMapping("/dining/granum-dining.do")
	public String granum_dining(Model model, AdminVO param) throws Exception {
		
		return "dining/granum-dining";
	}
	@RequestMapping("/dining/moon-bar.do")
	public String moon_bar(Model model, AdminVO param) throws Exception {
		
		return "dining/moon-bar";
	}
	@RequestMapping("/dining/outdoor-kitchen.do")
	public String outdoor_kitchen(Model model, AdminVO param) throws Exception {
		
		return "dining/outdoor-kitchen";
	}
	@RequestMapping("/dining/dining_origin_book.do")
	public String dining_origin_book(Model model, AdminVO param) throws Exception {
		
		return "dining/dining_origin_book";
	}
	
}
	
	
