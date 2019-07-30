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
import util.DateUtil;
import util.Function;

@Controller
public class Room_resController {

	@Autowired
	Room_resService room_resService;
	
	@Autowired
	RoomService roomService;
	
	@RequestMapping("/manage/room/res/index")
	public String index(Model model, Room_resVO vo, RoomVO rvo, HttpServletRequest req) throws Exception {
		int[] rowPageCount = room_resService.count(vo);
		if (req.getParameter("category") == null) {
			vo.setCategory(0);
		} else {
			vo.setCategory(Integer.parseInt(req.getParameter("category")));
		}
		ArrayList<Room_resVO> list = room_resService.list(vo);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
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
		ArrayList<Room_opt_resVO> list_o = room_resService.list_opt(vo.getNo());
		
		model.addAttribute("read", read);
		model.addAttribute("vo", vo);
		model.addAttribute("list_o", list_o);
		
		return "manage/room/res/read";
	}
	
	@RequestMapping("/manage/room/res/edit")
	public String edit(Model model, Room_resVO vo) throws Exception {
		Room_resVO read = room_resService.read(vo);
		ArrayList<Room_opt_resVO> list_o = room_resService.list_opt(read.getNo());

		model.addAttribute("vo", vo);
		model.addAttribute("read", read);
		model.addAttribute("list_o", list_o);
		
		return "manage/room/res/edit";
	}
	
	@RequestMapping("/manage/room/res/cancel")
	public String cancel(Model model, Room_resVO vo) throws Exception {
		int r = room_resService.cancel(vo.getNo());
		model.addAttribute("value",r);
		return "include/return";
	}
	
	
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
}
