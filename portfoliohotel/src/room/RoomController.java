package room;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import manage.admin.AdminVO;
import util.Function;

@Controller
public class RoomController {

	@Autowired
	RoomService roomService;

	/**
	 * 관리자 페이지
	 */
	@RequestMapping("/manage/room/index")
	public String index(Model model, RoomVO vo) throws Exception {
		ArrayList<RoomVO> list = roomService.list(vo);

		model.addAttribute("list", list);
		model.addAttribute("vo", vo);

		return "manage/room/index";
	}

	@RequestMapping("/manage/room/write")
	public String write(Model model, RoomVO vo) throws Exception {
		model.addAttribute("vo", vo);

		return "manage/room/write";
	}

	@RequestMapping("/manage/room/read")
	public String read(Model model, RoomVO vo) throws Exception {
		RoomVO read = roomService.read(vo);

		model.addAttribute("read", read);
		model.addAttribute("vo", vo);

		return "manage/room/read";
	}

	@RequestMapping("/manage/room/edit")
	public String edit(Model model, RoomVO vo) throws Exception {
		RoomVO read = roomService.read(vo);

		model.addAttribute("read", read);
		model.addAttribute("vo", vo);

		return "manage/room/edit";
	}

	/**
	 * 사용자 페이지
	 */
	@RequestMapping("/room/room-detail-subpage.do")
	public String room_detail_subpage(Model model, AdminVO param) throws Exception {

		return "room/room-detail-subpage";
	}

	@RequestMapping("/room/room-detail-subpage2.do")
	public String room_detail_subpage2(Model model, AdminVO param) throws Exception {

		return "room/room-detail-subpage2";
	}

	@RequestMapping("/room/room-detail-subpage3.do")
	public String room_detail_subpage3(Model model, AdminVO param) throws Exception {

		return "room/room-detail-subpage3";
	}

	@RequestMapping("/room/room-detail-subpage4.do")
	public String room_detail_subpage4(Model model, AdminVO param) throws Exception {

		return "room/room-detail-subpage4";
	}

	@RequestMapping("/book/add_option.do")
	public String add_option(Model model, AdminVO param) throws Exception {

		return "book/add_option";
	}

	@RequestMapping("/book/check_room.do")
	public String check_room(Model model, AdminVO param) throws Exception {

		return "book/check_room";
	}

	@RequestMapping("/book/price_room.do")
	public String price_room(Model model, AdminVO param) throws Exception {

		return "book/price_room";
	}

	/**
	 * 등록, 수정, 삭제 cmd값으로 구분해서 처리
	 * 
	 * @param model
	 * @param param
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/room/process")
	public String process(Model model, RoomVO param, HttpServletRequest request) throws Exception {
		model.addAttribute("vo", param);

		if ("write".equals(param.getCmd())) {
			int r = roomService.insert(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "index");
		} else if ("edit".equals(param.getCmd())) { 
			int r = roomService.update(param, request);
			model.addAttribute("code", "alertMessageUrl"); model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다.", "수정실패")); 
			model.addAttribute("url", "/manage/room/read?no="+param.getNo()); 
		} else if ("groupDelete".equals(param.getCmd())) { 
			int r = roomService.groupDelete(param, request); 
			model.addAttribute("code", "alertMessageUrl"); 
			model.addAttribute("message", Function.message(r, "총 "+r+"건이 삭제되었습니다.", "삭제실패")); 
			model.addAttribute("url", param.getTargetURLParam("index", param, 0)); 
		} else if ("delete".equals(param.getCmd())) { 
			int r = roomService.delete(param);
			model.addAttribute("code", "alertMessageUrl"); 
			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패")); 
			model.addAttribute("url", param.getTargetURLParam("index", param, 0)); 
		}

		return "include/alert";
	}

}
