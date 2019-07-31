package user.exhibition;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UExhibitionController {

	@Autowired
	private UExhibitionService uexhibitionService;
	
	@RequestMapping("user/exhibition/subExhibition1")
	public String index(Model model, UExhibitionVO param) throws Exception {
		int[] rowPageCount = uexhibitionService.count(param);
		ArrayList<UExhibitionVO> ingList = uexhibitionService.ingList(param);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("param", param);
		model.addAttribute("ingList", ingList);
		
		return "user/exhibition/subExhibition1";
	}
	
	@RequestMapping("user/exhibition/ticket")
	public String ticket(Model model, UExhibitionVO param) throws Exception {
		UExhibitionVO ticket = uexhibitionService.ticket(param.getNo());
		
		model.addAttribute("ticket", ticket);
		return "user/exhibition/ticket";
	}
}
