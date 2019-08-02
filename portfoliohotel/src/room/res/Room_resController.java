package room.res;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import manage.admin.AdminVO;
import room.RoomService;
import room.RoomVO;
import room.Room_optVO;
import util.DateUtil;
import util.Function;

@Controller
public class Room_resController {

	@Autowired
	Room_resService room_resService;
	
	@Autowired
	RoomService roomService;
	
	/**
	 * 관리자 객실 예약 목록
	 * @param model
	 * @param vo
	 * @param rvo
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/room/res/index")
	public String index(Model model, Room_resVO vo, RoomVO rvo, HttpServletRequest req) throws Exception {
		int[] rowPageCount = room_resService.count(vo);
		if (req.getParameter("category") == null) {
			vo.setCategory(2);
		} else {
			vo.setCategory(Integer.parseInt(req.getParameter("category")));
		}
		ArrayList<Room_resVO> list = room_resService.index(vo);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);
		model.addAttribute("rvo", rvo);
		
		return "manage/room/res/index";
	}
	
	/**
	 * 관리자 객실 예약 목록_일자별
	 * @param model
	 * @param vo
	 * @param rvo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/room/res/list")
	public String list(Model model, Room_resVO vo, @RequestParam(value="yearMonth", required = false) String yearMonth) throws Exception {
		if ("".equals(yearMonth) || yearMonth == null) {
			yearMonth = DateUtil.getFullToday().substring(0,7);
		}
		String nextMonth = DateUtil.getYearMonth(yearMonth, 1);
		String prevMonth = DateUtil.getYearMonth(yearMonth, -1);
		
		ArrayList<HashMap> map = room_resService.list(yearMonth);
		
		model.addAttribute("vo", vo);
		model.addAttribute("map", map);
		model.addAttribute("yearMonth", yearMonth);
		model.addAttribute("nextMonth", nextMonth);
		model.addAttribute("prevMonth", prevMonth);
		
		return "manage/room/res/list";
	}
	
	@RequestMapping("/manage/room/res/check")
	public String check(Model model, Room_resVO vo, HttpServletRequest req, RoomVO rvo) throws Exception {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("checkin", (String)req.getParameter("checkin"));
		map.put("checkout", (String)req.getParameter("checkout"));
		
		ArrayList<HashMap> map_c = room_resService.check(map);
		ArrayList<RoomVO> list_r = roomService.list(rvo);
		model.addAttribute("map_c", map_c);
		model.addAttribute("list_r", list_r);
		return "manage/room/res/check";
	}
	
	/**
	 * 관리자 객실 예약 등록
	 * @param model
	 * @param vo
	 * @param rvo
	 * @param ovo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/room/res/write")
	public String write(Model model, Room_resVO vo, RoomVO rvo, Room_optVO ovo) throws Exception {
		ArrayList<RoomVO> list = roomService.list(rvo);
		ArrayList<Room_optVO> list_o = roomService.list_opt(ovo);
		
		model.addAttribute("vo", vo);
		model.addAttribute("rvo", rvo);
		model.addAttribute("ovo", ovo);
		model.addAttribute("list", list);
		model.addAttribute("list_o", list_o);
		
		return "manage/room/res/write";
	}
	
	/**
	 * 관리자 객실 예약 상세
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/room/res/read")
	public String read(Model model, Room_resVO vo) throws Exception {
		Room_resVO read = room_resService.read(vo);
		ArrayList<Room_opt_resVO> list_o = room_resService.list_opt(vo.getNo());
		
		model.addAttribute("read", read);
		model.addAttribute("vo", vo);
		model.addAttribute("list_o", list_o);
		
		return "manage/room/res/read";
	}
	
	/**
	 * 관리자 객실 예약 수정
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/room/res/edit")
	public String edit(Model model, Room_resVO vo) throws Exception {
		Room_resVO read = room_resService.read(vo);
		ArrayList<Room_opt_resVO> list_o = room_resService.list_opt(read.getNo());

		model.addAttribute("vo", vo);
		model.addAttribute("read", read);
		model.addAttribute("list_o", list_o);
		
		return "manage/room/res/edit";
	}
	
	/**
	 * 관리자 객실 예약 취소
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/room/res/cancel")
	public String cancel(Model model, Room_resVO vo) throws Exception {
		int r = room_resService.cancel(vo.getNo());
		model.addAttribute("value",r);
		return "include/return";
	}
	
	/**
	 * 등록, 수정, 예약 취소, 개별 삭제, 단체 삭제
	 * @param model
	 * @param vo
	 * @param request
	 * @param ovo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/room/res/process")
	public String process(Model model, Room_resVO vo, HttpServletRequest request, Room_opt_resVO ovo) throws Exception {
		model.addAttribute("vo", vo);
		model.addAttribute("ovo", ovo);
		System.out.println(vo.getCmd());
		if ("write".equals(vo.getCmd())) {
			int r = room_resService.insert(vo, ovo, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "index");
		} else if("edit".equals(vo.getCmd())) {
			int r = room_resService.update(vo);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다.", "수정실패"));
			model.addAttribute("url", "/manage/room/res/read?no="+vo.getNo());
		} else if("cancel".equals(vo.getCmd())) {
			int r = room_resService.cancel(vo.getNo());
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 취소되었습니다.", "취소실패"));
			model.addAttribute("url", "/manage/room/res/read?no="+vo.getNo());
		} else if("delete".equals(vo.getCmd())) {
			int r = room_resService.delete(vo);
			model.addAttribute("code", "alertMessageUrl"); 
			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패")); 
			model.addAttribute("url", vo.getTargetURLParam("index", vo, 0));
		} else if("groupDelete".equals(vo.getCmd())) {
			int r = room_resService.groupDelete(request); 
			model.addAttribute("code", "alertMessageUrl"); 
			model.addAttribute("message", Function.message(r, "총 "+r+"건이 삭제되었습니다.", "삭제실패")); 
			model.addAttribute("url", vo.getTargetURLParam("index", vo, 0)); 
		}
		return "include/alert";
	}
	
	
	@RequestMapping("/book/add_option")
	public String add_option(Model model, Room_optVO vo) throws Exception {
		ArrayList<Room_optVO> list_o = roomService.list_opt(vo);
		model.addAttribute("list_o", list_o);

		return "book/add_option";
	}
	
	@RequestMapping("/book/personal_info")
	public String personal_info(Model model, Room_optVO vo) throws Exception {

		return "book/personal_info";
	}
	
	@RequestMapping("/book/confirm_room")
	public String confirm_room(Model model, Room_optVO vo) throws Exception {

		return "book/confirm_room";
	}

	@RequestMapping("/book/check_room")
	public String check_room(Model model, AdminVO vo) throws Exception {

		return "book/check_room";
	}

	@RequestMapping("/book/price_room")
	public String price_room(Model model, AdminVO vo) throws Exception {

		return "book/price_room";
	}

	@RequestMapping("/book/confirm")
	public String confirm_room(Model model, RoomVO vo) throws Exception {
		return "book/confirm";
	}
}
