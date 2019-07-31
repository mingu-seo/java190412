package manage.doctor;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import manage.doctor.DoctorVO;
import manage.doctor.sched.SchedVO;
import manage.reserve.ReserveService;
import manage.reserve.ReserveVO;
import member.MemberVO;
import mypet.MypetVO;
import util.Function;

@Controller
public class DoctorController {

	@Autowired
	private DoctorService doctorService;
	
	@Autowired
	private ReserveService reserveService;

	@RequestMapping("/manage/doctor/index")
	public String index(Model model, DoctorVO param) throws Exception {
		int[] rowPageCount = doctorService.count(param);
		ArrayList<DoctorVO> list = doctorService.list(param);

		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);

		return "manage/doctor/index";
	}
	
	@RequestMapping("/reservation/reservationDoctorList.do")
	public String doctorList(Model model, DoctorVO param, SchedVO svo) throws Exception {
		param.setPageRows(99999);
		param.setIsDoctor(1);
		ArrayList<DoctorVO> list = doctorService.list(param);
		model.addAttribute("list", list);
		
		// 예약시간
		for (int i=0; i<list.size(); i++) {
			svo.setDoctor_pk(list.get(i).getNo());
			SchedVO slist = reserveService.schedList(svo);
			ArrayList<ReserveVO> tlist = reserveService.reservedTime(svo.getDate(), svo.getDoctor_pk());
			list.get(i).setSlist(slist);
			list.get(i).setTlist(tlist);
		}
		return "reservation/reservationDoctorList";
	}

	@RequestMapping("/manage/doctor/read")
	public String read(Model model, DoctorVO param) throws Exception {
		DoctorVO data = doctorService.read(param.getNo());

		
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		
		return "manage/doctor/read";
	}

	@RequestMapping("/manage/doctor/write")
	public String write(Model model, DoctorVO param) throws Exception {
		model.addAttribute("vo", param);

		return "manage/doctor/write";
	}
	
	@RequestMapping("/manage/doctor/edit")
	public String edit(Model model, DoctorVO param) throws Exception {
		DoctorVO data = doctorService.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		return "manage/doctor/edit";
	}
	
	@RequestMapping("/intro/intro-staff.do")
	public String Intro(Model model, DoctorVO param) throws Exception {
		//DoctorVO data = doctorService.read(param.getNo());
		
		ArrayList list = doctorService.Intro(param);
		model.addAttribute("list", list);
		
		return "intro/intro-staff";
	}


	@RequestMapping("/manage/doctor/process")
	public String process(Model model, DoctorVO param, HttpServletRequest request) throws Exception {
		model.addAttribute("doctorvo", param);
		if ("write".equals(param.getCmd())) {
			int r = doctorService.insert(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "index");
		} else if ("edit".equals(param.getCmd())) {
			int r = doctorService.update(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다.", "수정실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		} else if ("groupDelete".equals(param.getCmd())) {
			int r = doctorService.groupDelete(request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "총 " + r + "건이 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		} else if ("delete".equals(param.getCmd())) {
			int r = doctorService.delete(param.getNo());
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		}

		return "include/alert";
	}

}
