
package manage.program;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import manage.member.MemberService;
import manage.reservation.ReservationVO;
import util.Function;

@Controller
public class ProgramController {

	@Autowired
	private ProgramService programService;
	private MemberService memberService;
	
   
   
	@RequestMapping("/manage/program/list")
	public String index(Model model, ProgramVO param, ReservationVO vo) throws Exception {
		int[] rowPageCount = programService.count(param);
		ArrayList<ProgramVO> list = programService.list(param);
		ArrayList<ArrayList<HashMap>> olist = new ArrayList<ArrayList<HashMap>>();

		for (int i=0; i<list.size(); i++) {
		ArrayList<HashMap> ohmlist = programService.listOption(list.get(i).getNo());
		ArrayList<HashMap> optlist = new ArrayList<HashMap>();
		System.out.println(ohmlist.size());
			for (int j=0; j<ohmlist.size(); j++) {
				System.out.println(ohmlist.get(j).get("no"));
				optlist.add(ohmlist.get(j));
			}
			olist.add(optlist);
		}	
			  
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("param", param);
		
		model.addAttribute("olist", olist);
		
		return "manage/program/list";
	}
	
	@RequestMapping("/manage/program/read")
	public String read(Model model, ProgramVO param) throws Exception {
		ProgramVO data = programService.read(param.getNo());
		
		ArrayList<HashMap> olist = programService.listOption(param.getNo());
		      
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		model.addAttribute("olist", olist);
		 
		return "manage/program/read";
	}
	   
	
	@RequestMapping("/manage/program/edit")
	public String edit(Model model, ProgramVO param) throws Exception {
		ProgramVO data = programService.read(param.getNo());
		ArrayList<HashMap> olist = programService.listOption(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("olist", olist);
		  
		return "manage/program/edit";
	}
	
	@RequestMapping("/manage/program/write")
	public String write(Model model, ProgramVO param) throws Exception {
		
		model.addAttribute("vo", param);
		
		return "manage/program/write";
	}
	

	@RequestMapping("/manage/program/process")
	public String process(Model model, ProgramVO param,  HttpServletRequest request) throws Exception {
		model.addAttribute("programvo", param);
		
	
		if ("write".equals(param.getCmd())) {
			int r = programService.insert(param, request);
			programService.insertOption(request, r);

			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "list");
		} else if ("edit".equals(param.getCmd())) {
			int r = programService.update(param, request);
			programService.deleteOption(param.getNo());
			programService.insertOption(request, param.getNo());         
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다.", "수정실패"));
			model.addAttribute("url", param.getTargetURLParam("list", param, 0));
		} else if ("groupDelete".equals(param.getCmd())) {
			int r = programService.groupDelete(request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "총 " + r + "건이 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("list", param, 0));
		} else if ("delete".equals(param.getCmd())) {
			int r = programService.delete(param.getNo());
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("list", param, 0));
		}
		  
		return "include/alert";
	}

   
}