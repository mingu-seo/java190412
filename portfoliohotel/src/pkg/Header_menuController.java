package pkg;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Header_menuController {
	
	@Autowired
	PkgService pkgService;
	
	@RequestMapping("/header_menu")
	public String header_menu(Model model, PkgVO param) throws Exception {
		param.setTablename("pkg");
		int[] rowPageCount = pkgService.count(param);
		ArrayList<PkgVO> plist = pkgService.list(param);
		
		model.addAttribute("ptotCount", rowPageCount[0]);
		model.addAttribute("ptotPage", rowPageCount[1]);
		model.addAttribute("plist", plist);
		model.addAttribute("pvo", param);
		
		return "header_menu";
	}
	
	@RequestMapping("/pkg/detail_page/pkg_detail_page")
	public String Senseof(Model model, PkgVO param)  throws Exception {
		PkgVO data = pkgService.read(param.getNo());
		model.addAttribute("pkg_data", data);
		model.addAttribute("pkg_param", param);
		
		return "pkg/detail_page/pkg_detail_page";
	}
}
