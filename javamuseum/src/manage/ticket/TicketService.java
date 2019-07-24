package manage.ticket;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import manage.exhibition.ExhibitionDAO;
import util.Page;

@Service
public class TicketService {

	@Autowired
	private TicketDAO ticketDao;
	@Autowired
	private ExhibitionDAO exhibitionDao;
	
	public ArrayList list(TicketVO param) throws Exception {
		ArrayList list = ticketDao.list(param);
		return list;
	}
	
	public int[] count(TicketVO param) throws Exception {
		int rowCount = ticketDao.count(param);
		int[] rowPageCount = new int[2];
		int pageCount = Page.getPageCount(param.getPageRows(), rowCount);
		rowPageCount[0] = rowCount;
		rowPageCount[1] = pageCount;
		return rowPageCount;
	}
	
	public int insert(TicketVO param) throws Exception {
		int oNum = param.getOld_number();			//노인 수
		int num = param.getNumber();				//총 인원
		int saleAfterPrice = 0;						//할인 적용 후 금액
		int usePoint = param.getUsepoint();			//사용 포인트
		
		//결제 금액
		if(oNum > 0) {
			saleAfterPrice = ((num - oNum) * 7000) + (oNum * 5000);
		} else {
			saleAfterPrice = num * 7000;
		}
		int pay_price = saleAfterPrice - usePoint;	//실제 결제 금액
		
		//포인트 적립 후 param에 셋
		param.setStorepoint((int)(pay_price * 0.05));
		
		//실제 결제 금액과 할인 금액 셋
		param.setPay_price(pay_price);
		param.setSale_price(10000-pay_price);
		int lastNo = (Integer)ticketDao.insert(param);
		return lastNo;
	}
	
	public TicketVO read(int no) throws Exception {
		TicketVO param = ticketDao.read(no);
		return param;
	}
	
	public int update(TicketVO param, HttpServletRequest request) throws Exception {
		TicketVO data = ticketDao.read(param.getNo());
		int r = (Integer)ticketDao.update(param);
		return r;
	}
	
	public int delete(TicketVO param) throws Exception {
		int r = ticketDao.delete(param.getNo());
		
		return r;
	}
	
	public int groupDelete(TicketVO param, HttpServletRequest request) throws Exception {
		String[] nos = request.getParameterValues("no");
		int delCount = 0;
		if(nos.length > 0) {
			for(int i = 0; i < nos.length; i++) {
				int r = ticketDao.delete(Integer.parseInt(nos[i]));
			}
		}
		return delCount;
	}
}
