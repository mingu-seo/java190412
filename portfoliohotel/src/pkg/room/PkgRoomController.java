package pkg.room;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import manage.admin.AdminVO;
import util.Function;

@Controller
public class PkgRoomController {
	
	@RequestMapping("/pkg/room/room_offer")
	public String room_offer(Model model, PkgRoomVO param) {
		
		return "pkg/room/room_offer";
	}
	
	@RequestMapping("/pkg/room/bbq")
	public String ppq(Model model, AdminVO param) throws Exception {
		
		return "pkg/room/bbq";
	}
	
	@RequestMapping("/pkg/room/senseof")
	public String senseof(Model model, AdminVO param) throws Exception {
		
		return "pkg/room/senseof";
	}
	
	@RequestMapping("/pkg/room/oasis")
	public String oasis(Model model, AdminVO param) throws Exception {
		
		return "pkg/room/oasis";
	}
}
