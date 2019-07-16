package room;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import manage.admin.AdminVO;

@Controller
public class RoomController {
	
	@Autowired
	RoomService roomService;
	
	@RequestMapping("/manage/room/index")
	public String index(Model model, RoomVO vo) throws Exception{
		ArrayList<RoomVO> list = roomService.list(vo);
		
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);
		
		return "manage/room/index";
	}
	
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
	
}
