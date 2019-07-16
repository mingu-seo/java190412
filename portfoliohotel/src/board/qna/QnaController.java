package board.qna;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import manage.admin.AdminVO;

@Controller
public class QnaController {
	@RequestMapping("/membership/qna.do")
	public String qna(Model model, AdminVO param) throws Exception {
		
		return "membership/qna";
	}
	
	@RequestMapping("/membership/qna_q.do")
	public String qna_q(Model model, AdminVO param) throws Exception {
		
		return "membership/qna_q";
	}
}
