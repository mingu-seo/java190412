package test;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class TestController {
	
	@Autowired
	private TestService testService;

	@RequestMapping("/test")
	public String test(Model model, @RequestParam(value="member_pk", required = false) String pk) throws Exception {
		model.addAttribute("test", "테스트"); 
		model.addAttribute("member_pk",pk);
		
		
		return "test";
	}
	
	public static void main(String[] args) {
		System.out.println("test");
	}
}
