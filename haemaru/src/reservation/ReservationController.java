package reservation;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class ReservationController {
	@RequestMapping("/reservation/index.do")
	public String read(Model model) throws Exception {
		
		
		return "reservation/index";
	}
}
