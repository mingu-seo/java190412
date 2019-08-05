package pkg;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pkg.res.Pkg_resService;
import pkg.res.Pkg_resVO;

@Controller
public class Header_menuController {
	
	@Autowired
	PkgService pkgService;
	
	@Autowired
	Pkg_resService pkg_resService;
	
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
	public String Senseof(Model model, PkgVO param, Pkg_resVO prparam)  throws Exception {
		PkgVO data = pkgService.read(param.getNo());
		model.addAttribute("pkg_data", data);
		model.addAttribute("pkg_param", param);
		model.addAttribute("prparam", prparam);
		
		return "pkg/detail_page/pkg_detail_page";
	}
}
