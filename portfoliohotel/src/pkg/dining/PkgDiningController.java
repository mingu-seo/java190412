package pkg.dining;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import board.notice.NoticeVO;
import manage.admin.AdminVO;
import util.Function;

@Controller
public class PkgDiningController {

	@Autowired
	PkgDiningService pkgDiningService;
	
	@RequestMapping("/pkg/dining/petit")
	public String petit(Model model, PkgDiningVO param) {
		
		return "pkg/dining/petit";
	}
	
	@RequestMapping("/pkg/dining/granum")
	public String granum(Model model, PkgDiningVO param) {
		
		return "pkg/dining/granum";
	}
	
	@RequestMapping("/pkg/dinning/dining_offer")
	public String dining_offer(Model model, AdminVO param) throws Exception {
		
		return "pkg/dining/dining_offer";
	}
	
	@RequestMapping("/book/pkg_book_channel") 
	public String pkg_book_channel(Model model, AdminVO param) throws Exception {
		
		return "book/pkg_book_channel";
	}
	
	@RequestMapping("/book/dining_pkg_book")
	public String dining_pkg_book(Model model, PkgDiningVO param) {
		
		return "book/dining_pkg_book";
	}
	
	@RequestMapping("/pkg/room/reasonable")
	public String reasonable(Model model, PkgDiningVO param) {
		
		return "pkg/room/reasonable";
	}
}
