package pkg.event_gift;

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
public class PkgEvent_giftController {

	@RequestMapping("/pkg/event_gift/etc_offer")
	public String event_gift(Model model, PkgEvent_giftVO param) throws Exception {
		
		return "pkg/event_gift/etc_offer";
	}
}
