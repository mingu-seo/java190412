package manage.reserve;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import manage.doctor.DoctorVO;
import manage.doctor.sched.*;
import util.Function;

@Controller
public class ReserveContoller {

	@Autowired
	private ReserveService reserveService;
	
	
	@RequestMapping("/manage/reserve/index")
	public String index(Model model, ReserveVO param) throws Exception {
		int[] rowPageCount = reserveService.count(param);
		ArrayList<ReserveVO> list = reserveService.list(param);

		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);

		return "manage/reserve/index";
	}

	@RequestMapping("/manage/reserve/read")
	public String read(Model model, ReserveVO param) throws Exception {
		ReserveVO data = reserveService.read(param.getNo());
		
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		
		return "manage/reserve/read";
	}
	

	@RequestMapping("/manage/reserve/edit")
	public String edit(Model model, ReserveVO param) throws Exception {
		ReserveVO data = reserveService.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		return "manage/reserve/edit";
	}

	@RequestMapping("/manage/reserve/write")
	public String write(Model model, ReserveVO param) throws Exception {
		model.addAttribute("vo", param);

		return "manage/reserve/write";
	}
	
	@RequestMapping("/manage/reserve/doctorList")
	public String doctorList(Model model, HttpServletRequest req) throws Exception {
		String date = req.getParameter("date");
		int department = Integer.parseInt(req.getParameter("department"));
		ArrayList<DoctorVO> list = reserveService.doctorList(date, department);
		model.addAttribute("list", list);

		return "manage/reserve/doctorList";
	}

	@RequestMapping("/manage/reserve/schedList")
	public String doctorList(Model model, SchedVO svo, @RequestParam(value="res_hour", required = false) String arg) throws Exception {
		SchedVO slist = reserveService.schedList(svo);
		ArrayList<Integer> tlist = reserveService.reservedTime(svo.getDate(), svo.getDoctor_pk());
		model.addAttribute("slist", slist);
		model.addAttribute("tlist", tlist);
		model.addAttribute("svo", svo);
		model.addAttribute("arg", arg);

		return "manage/reserve/schedList";
	}

	@RequestMapping("/manage/reserve/process")
	public String process(Model model, ReserveVO param,  HttpServletRequest request) throws Exception {
		model.addAttribute("productvo", param);
		if ("write".equals(param.getCmd())) {
			int r = reserveService.insert(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "index");
		} else if ("edit".equals(param.getCmd())) {
			int r = reserveService.update(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다.", "수정실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		} else if ("groupDelete".equals(param.getCmd())) {
			int r = reserveService.groupDelete(request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "총 " + r + "건이 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		} else if ("delete".equals(param.getCmd())) {
			int r = reserveService.delete(param.getNo());
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		}
		
		return "include/alert";
	}

}
