package room.res;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import room.RoomService;
import room.RoomVO;
import room.Room_optVO;
import util.Function;

@Controller
public class Room_resController {

	@Autowired
	Room_resService room_resService;
	
	@Autowired
	RoomService roomService;
	
	@RequestMapping("/manage/room/res/index")
	public String index(Model model, Room_resVO vo, RoomVO rvo) throws Exception {
		ArrayList<Room_resVO> list = room_resService.list(vo);
		
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);
		model.addAttribute("rvo", rvo);
		
		return "manage/room/res/index";
	}
	
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
	
	@RequestMapping("/manage/room/res/read")
	public String read(Model model, Room_resVO vo) throws Exception {
		Room_resVO read = room_resService.read(vo);
		
		model.addAttribute("read", read);
		model.addAttribute("vo", vo);
		
		return "manage/room/res/read";
	}
	
	@RequestMapping("/manage/room/res/edit")
	public String edit(Model model, Room_resVO vo) throws Exception {
		Room_resVO read = room_resService.read(vo);
		
		model.addAttribute("read", read);
		model.addAttribute("vo", vo);
		
		return "manage/room/res/edit";
	}
	
	
	@RequestMapping("/manage/room/res/process")
	public String process(Model model, Room_resVO vo, HttpServletRequest request, RoomVO rvo) throws Exception {
		if ("write".equals(vo.getCmd())) {
			int r = room_resService.insert(vo);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "index");
		}
		return "include/alert";
	}
}
