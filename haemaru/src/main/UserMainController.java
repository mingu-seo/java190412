package main;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class UserMainController {
	@RequestMapping("/index.do")
	public String read(Model model) throws Exception {
		
		
		return "index";
	}
}
