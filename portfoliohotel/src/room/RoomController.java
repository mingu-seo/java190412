package room;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import manage.admin.AdminVO;
import util.Function;

@Controller
public class RoomController {

	@Autowired
	RoomService roomService;

//	관리자_객실
	@RequestMapping("/manage/room/index")
	public String index(Model model, RoomVO vo) throws Exception {
		ArrayList<RoomVO> list = roomService.list(vo);

		model.addAttribute("list", list);
		model.addAttribute("vo", vo);

		return "manage/room/index";
	}

	@RequestMapping("/manage/room/write")
	public String write(Model model, RoomVO vo, Room_serviceVO vo_s, Room_imageVO vo_i, HttpServletRequest req) throws Exception {
		int no = vo.getNo();
		vo_s.setRoom_pk(no);
		vo_i.setRoom_pk(no);
		
		model.addAttribute("vo", vo);
		model.addAttribute("vo_s", vo_s);
		model.addAttribute("vo_i", vo_i);

		return "manage/room/write";
	}

	@RequestMapping("/manage/room/read")
	public String read(Model model, RoomVO vo) throws Exception {
		RoomVO read = roomService.read(vo);
		ArrayList<HashMap> list = roomService.list_service(read.getNo());
		ArrayList<HashMap> list_i = roomService.list_image(read.getNo());

		model.addAttribute("read", read);
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		model.addAttribute("list_i", list_i);
		return "manage/room/read";
	}

	@RequestMapping("/manage/room/edit")
	public String edit(Model model, RoomVO vo) throws Exception {
		RoomVO read = roomService.read(vo);
		ArrayList<HashMap> list = roomService.list_service(read.getNo());
		ArrayList<HashMap> list_i = roomService.list_image(read.getNo());
		
		
		model.addAttribute("read", read);
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		model.addAttribute("list_i", list_i);

		return "manage/room/edit";
	}
	
	@RequestMapping("/manage/room/delete_image")
	public String delete_image(Model model, Room_imageVO vo) throws Exception {
		roomService.delete_image(vo.getNo(), vo.getImage());
		
		return "include/return";
	}
	
	
//	관리자_객실 옵션
	@RequestMapping("/manage/room/index_opt")
	public String index_opt(Model model, Room_optVO vo) throws Exception {
		ArrayList<RoomVO> list_opt = roomService.list_opt(vo);

		model.addAttribute("list", list_opt);
		model.addAttribute("vo", vo);

		return "manage/room/index_opt";
	}
	
	@RequestMapping("/manage/room/write_opt")
	public String write_opt(Model model, Room_optVO vo) throws Exception {
		model.addAttribute("vo", vo);

		return "manage/room/write_opt";
	}
	
	
	

	/**
	 * 사용자 페이지
	 */
	@RequestMapping("/room/room-detail-subpage.do")
	public String room_detail_subpage(Model model, AdminVO vo) throws Exception {

		return "room/room-detail-subpage";
	}

	@RequestMapping("/room/room-detail-subpage2.do")
	public String room_detail_subpage2(Model model, AdminVO vo) throws Exception {

		return "room/room-detail-subpage2";
	}

	@RequestMapping("/room/room-detail-subpage3.do")
	public String room_detail_subpage3(Model model, AdminVO vo) throws Exception {

		return "room/room-detail-subpage3";
	}

	@RequestMapping("/room/room-detail-subpage4.do")
	public String room_detail_subpage4(Model model, AdminVO vo) throws Exception {

		return "room/room-detail-subpage4";
	}

	@RequestMapping("/book/add_option.do")
	public String add_option(Model model, AdminVO vo) throws Exception {

		return "book/add_option";
	}

	@RequestMapping("/book/check_room.do")
	public String check_room(Model model, AdminVO vo) throws Exception {

		return "book/check_room";
	}

	@RequestMapping("/book/price_room.do")
	public String price_room(Model model, AdminVO vo) throws Exception {

		return "book/price_room";
	}

	/**
	 * 등록, 수정, 삭제 cmd값으로 구분해서 처리
	 * 
	 * @vo model
	 * @vo vo
	 * @vo request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/room/process")
	public String process(Model model, RoomVO vo, Room_imageVO vo_i, HttpServletRequest request, @RequestParam(required=false) List<MultipartFile> image_tmp) throws Exception {
		model.addAttribute("vo", vo);
		model.addAttribute("vo_i", vo_i);

		if ("write".equals(vo.getCmd())) {
			int r = roomService.insert(vo, request, image_tmp);
			roomService.insert_service(request, r);
//			roomService.insert_image(request, r);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "index");
		} else if ("edit".equals(vo.getCmd())) { 
			int r = roomService.update(vo, request, vo_i, image_tmp);
			roomService.update_service(request, vo.getNo());
			model.addAttribute("code", "alertMessageUrl"); 
			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다.", "수정실패")); 
			model.addAttribute("url", "/manage/room/read?no="+vo.getNo()); 
		} else if ("groupDelete".equals(vo.getCmd())) { 
			int r = roomService.groupDelete(vo, request); 
			model.addAttribute("code", "alertMessageUrl"); 
			model.addAttribute("message", Function.message(r, "총 "+r+"건이 삭제되었습니다.", "삭제실패")); 
			model.addAttribute("url", vo.getTargetURLParam("index", vo, 0)); 
		} else if ("delete".equals(vo.getCmd())) { 
			int r = roomService.delete(vo);
			model.addAttribute("code", "alertMessageUrl"); 
			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패")); 
			model.addAttribute("url", vo.getTargetURLParam("index", vo, 0)); 
		}

		return "include/alert";
	}
	
	@RequestMapping("/manage/room/process_del")
	public String process(Model model, RoomVO vo, Room_imageVO vo_i, HttpServletRequest request) throws Exception {
		model.addAttribute("vo", vo);
		model.addAttribute("vo_i", vo_i);

		if ("groupDelete".equals(vo.getCmd())) { 
			int r = roomService.groupDelete(vo, request); 
			model.addAttribute("code", "alertMessageUrl"); 
			model.addAttribute("message", Function.message(r, "총 "+r+"건이 삭제되었습니다.", "삭제실패")); 
			model.addAttribute("url", vo.getTargetURLParam("index", vo, 0)); 
		} else if ("delete".equals(vo.getCmd())) { 
			int r = roomService.delete(vo);
			model.addAttribute("code", "alertMessageUrl"); 
			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패")); 
			model.addAttribute("url", vo.getTargetURLParam("index", vo, 0)); 
		}

		return "include/alert";
	}
	
	@RequestMapping("/manage/room/process_opt")
	public String process_opt(Model model, Room_optVO vo, HttpServletRequest request) throws Exception {
		model.addAttribute("vo", vo);

		if ("write_opt".equals(vo.getCmd())) {
			int r = roomService.insert_opt(vo, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "index_opt");
		} else if ("edit_opt".equals(vo.getCmd())) { 
			int r = roomService.update_opt(vo, request);
			model.addAttribute("code", "alertMessageUrl"); 
			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다.", "수정실패")); 
			model.addAttribute("url", "index_opt"); 
		} else if ("groupDelete_opt".equals(vo.getCmd())) { 
			int r = roomService.groupDelete_opt(vo, request); 
			model.addAttribute("code", "alertMessageUrl"); 
			model.addAttribute("message", Function.message(r, "총 "+r+"건이 삭제되었습니다.", "삭제실패")); 
			model.addAttribute("url", "index_opt"); 
		} else if ("delete_opt".equals(vo.getCmd())) { 
			int r = roomService.delete_opt(vo);
			model.addAttribute("code", "alertMessageUrl"); 
			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패")); 
			model.addAttribute("url", "index_opt"); 
		}
		return "include/alert";
	}

}
