package manage.exhibition;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import manage.admin.AdminVO;
import util.Function;

@Controller
public class ExhibitionController {

	@Autowired
	private ExhibitionService exhibitionService;
	
	@RequestMapping("/manage/exhibition/index")
	public String index(Model model, ExhibitionVO param, HttpServletRequest request) throws Exception {
		int[] rowPageCount = exhibitionService.count(param);
		ArrayList<ExhibitionVO> list = exhibitionService.list(param, request);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);
		
		return "manage/exhibition/index";
	}
	
	@RequestMapping("/manage/exhibition/write")
	public String write(Model model, ExhibitionVO param) throws Exception {
		model.addAttribute("vo", param);
		return "manage/exhibition/write";
	}
	
	@RequestMapping("/manage/exhibition/read")
	public String read(Model model, ExhibitionVO param) throws Exception {
		ExhibitionVO data = exhibitionService.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		
		return "manage/exhibition/read";
	}
	
	@RequestMapping("/manage/exhibition/edit")
	public String edit(Model model, ExhibitionVO param) throws Exception {
		param.setTablename("exhibition");
		ExhibitionVO data = exhibitionService.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("param", param);
		
		return "manage/exhibition/edit";
	}
	
	@RequestMapping("/manage/exhibition/process")
	public String process(Model model, ExhibitionVO param, HttpServletRequest request) throws Exception{
		model.addAttribute("vo", param);
		if("write".equals(param.getCmd())) {
			int r = exhibitionService.insert(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r,  "정상적으로 등록되었습니다.", "등록 실패"));
			model.addAttribute("url", "index");
		} else if("edit".equals(param.getCmd())) {
			int r = exhibitionService.update(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r,  "정상적으로 수정되었습니다.", "수정 실패"));
			model.addAttribute("url", param.getTargetURLParam("read", param, param.getNo()));
		}else if("delete".equals(param.getCmd())) {
			int r = exhibitionService.delete(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r,  "정상적으로 삭제되었습니다.", "삭제 실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, param.getReqPageNo()));
		} else if("groupDelete".equals(param.getCmd())) {
			int r = exhibitionService.groupDelete(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r,  "총 " + r + "건이 정상적으로 삭제되었습니다.", "삭제 실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, param.getReqPageNo()));
		}
		
		return "include/alert";
	}
}
