
package manage.reservation;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import manage.program.ProgramService;
import manage.program.ProgramVO;
import util.Function;

@Controller
public class ReservationController {

   @Autowired
   private ReservationService reservationService;
   private ProgramService programService;
   
   
   @RequestMapping("/manage/program/reservation/list")
   public String index(Model model, ReservationVO param) throws Exception {
      int[] rowPageCount = reservationService.count(param);
      ArrayList<ReservationVO> list = reservationService.list(param);
      
      model.addAttribute("totCount", rowPageCount[0]);
      model.addAttribute("totPage", rowPageCount[1]);
      model.addAttribute("list", list);
      model.addAttribute("vo", param);
      
      return "manage/program/reservation/list";
   }

   @RequestMapping("/manage/program/reservation/read")
   public String read(Model model, ReservationVO param) throws Exception {
      ReservationVO data = reservationService.read(param.getNo());
      
      model.addAttribute("data", data);
      model.addAttribute("vo", param);
      
      return "manage/program/reservation/read";
   }
   

   @RequestMapping("/manage/program/reservation/edit")
   public String edit(Model model, ReservationVO param) throws Exception {
      ReservationVO data = reservationService.read(param.getNo());
      model.addAttribute("data", data);
      model.addAttribute("vo", param);
      
      return "manage/program/reservation/edit";
   }

   @RequestMapping("/manage/program/reservation/write")
   public String write(Model model, ReservationVO param) throws Exception {
      model.addAttribute("param", param);

      return "manage/program/reservation/write";
   }

   

   @RequestMapping("/manage/program/reservation/process")
   public String process(Model model, ReservationVO param,  HttpServletRequest request) throws Exception {
      model.addAttribute("programvo", param);
      if ("write".equals(param.getCmd())) {
         int r = reservationService.insert(param, request);
         model.addAttribute("code", "alertMessageUrl");
         model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
         model.addAttribute("url", "list");
      } else if ("edit".equals(param.getCmd())) {
         int r = reservationService.update(param, request);
         model.addAttribute("code", "alertMessageUrl");
         model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다.", "수정실패"));
         model.addAttribute("url", param.getTargetURLParam("list", param, 0));
	} else if ("groupDelete".equals(param.getCmd())) {
        int r = reservationService.groupDelete(request);
        model.addAttribute("code", "alertMessageUrl");
        model.addAttribute("message", Function.message(r, "총 " + r + "건이 삭제되었습니다.", "삭제실패"));
        model.addAttribute("url", param.getTargetURLParam("list", param, 0));
     } else if ("delete".equals(param.getCmd())) {
        int r = reservationService.delete(param.getNo());
        model.addAttribute("code", "alertMessageUrl");
        model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패"));
        model.addAttribute("url", param.getTargetURLParam("list", param, 0));
     }
      
      return "include/alert";
   }

   
}