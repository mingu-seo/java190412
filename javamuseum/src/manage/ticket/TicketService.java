package manage.ticket;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import manage.exhibition.ExhibitionDAO;
import manage.member.PointVO;
import util.DateUtil;
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
//		int oNum = param.getOld_number();			//노인 수
//		int num = param.getNumber();				//총 인원
//		int saleAfterPrice = 0;						//할인 적용 후 금액
//		int usePoint = param.getUsepoint();			//사용 포인트
//		
//		//결제 금액
//		if(oNum > 0) {
//			saleAfterPrice = ((num - oNum) * 7000) + (oNum * 5000);
//		} else {
//			saleAfterPrice = num * 7000;
//		}
//		int pay_price = saleAfterPrice - usePoint;	//실제 결제 금액
//		
//		//포인트 적립 후 param에 셋
//		param.setStorepoint((int)(pay_price * 0.05));
//		
//		//실제 결제 금액과 할인 금액 셋
//		param.setPay_price(pay_price);
//		param.setSale_price(10000-pay_price);
		
		param.setPrice(10000);
		param.setSale_price(param.getPrice()-param.getPay_price());
		
		//회원 포인트 적립, 사용
		if(param.getReservestate() == 1) {
			int point = ticketDao.memberPoint(param.getMember_pk());		//해당 회원 포인트 불러오기
			int usepoint = param.getUsepoint();;												//예매시 사용 포인트
			int storepoint = param.getStorepoint();							//예매시 적립 포인트
			
			
			point = point + storepoint - usepoint;
			param.setPoint(point);											//총 point를 다시 update
			ticketDao.storePoint(param);
		}
		
		int lastNo = (Integer)ticketDao.insert(param);					//전시 등록
		
		if(param.getReservestate() == 1) {
			//point table에 포인트 코멘트 넣기(적립 포인트)
			PointVO vo = new PointVO();
			vo.setMember_pk(param.getMember_pk());
			vo.setMemo("예매 포인트 적립");
			vo.setAccum(param.getStorepoint());
			vo.setState(0);
			vo.setDisplay_pk(param.getNo());
			ticketDao.pointComment(vo);
			
			if(param.getUsepoint() != 0) {									//사용 포인트 있을 시 따로 insert도 해준다
				//point table에 포인트 코멘트 넣기(사용 포인트)
				PointVO vo1 = new PointVO();
				vo1.setMember_pk(param.getMember_pk());
				vo1.setMemo("예매 포인트 사용");
				vo1.setAccum(param.getUsepoint());
				vo1.setState(1);
				vo1.setDisplay_pk(param.getNo());
				ticketDao.pointComment(vo1);
			}
		}
		
		return lastNo;
	}
	
	public TicketVO read(int no) throws Exception {
		TicketVO param = ticketDao.read(no);
		return param;
	}
	
	public int update(TicketVO param) throws Exception {
		TicketVO data = ticketDao.read(param.getNo());					//회원 기존 데이터
		
		if(param.getReservestate() == 2 && data.getReservestate() == 1) {
			ArrayList<PointVO> pointList = (ArrayList<PointVO>)ticketDao.pointRead(param.getNo());
			int point = ticketDao.memberPoint(param.getMember_pk());	//회원 포인트 조회
			PointVO pointvo = new PointVO();
			PointVO pointvo1 = new PointVO();
			
			//예매 취소 하면
			for(int i = 0; i < pointList.size(); i++) {
				if(pointList.get(i).getState() == 0) {
					point -= pointList.get(i).getAccum();
					pointvo.setMemo("관리자:예매 취소로 지급 포인트를 회수합니다.");
					pointvo.setState(1);
					pointvo.setAccum(pointList.get(i).getAccum());
					pointvo.setMember_pk(param.getMember_pk());
					pointvo.setDisplay_pk(param.getNo());
					ticketDao.pointComment(pointvo);
				} else if(pointList.get(i).getState() == 1){
					point += pointList.get(i).getAccum();
					pointvo1.setMemo("관리자:예매 취소로 사용 포인트를 반환합니다.");
					pointvo1.setState(0);
					pointvo1.setAccum(pointList.get(i).getAccum());
					pointvo1.setMember_pk(param.getMember_pk());
					pointvo1.setDisplay_pk(param.getNo());
					ticketDao.pointComment(pointvo1);
				}
			}
			param.setPoint(point);
			ticketDao.storePoint(param);
		}
		
		int r = (Integer)ticketDao.update(param);
		return r;
	}
	
	public void reserveUpdate(TicketVO param) throws Exception {
		TicketVO data = ticketDao.read(param.getNo());
		param.setCanceldate(DateUtil.getToday());
		
		ArrayList<PointVO> pointList = (ArrayList<PointVO>)ticketDao.pointRead(param.getNo());
		int point = ticketDao.memberPoint(param.getMember_pk());
		PointVO pointvo = new PointVO();
		PointVO pointvo1 = new PointVO();
		
		for(int i = 0; i < pointList.size(); i++) {
			if(pointList.get(i).getState() == 0) {
				point -= pointList.get(i).getAccum();
				pointvo.setMemo("관리자:예매 취소로 지급 포인트를 회수합니다.");
				pointvo.setState(1);
				pointvo.setAccum(pointList.get(i).getAccum());
				pointvo.setMember_pk(param.getMember_pk());
				pointvo.setDisplay_pk(param.getNo());
				ticketDao.pointComment(pointvo);
			} else if(pointList.get(i).getState() == 1){
				point += pointList.get(i).getAccum();
				pointvo1.setMemo("관리자:예매 취소로 사용 포인트를 반환합니다.");
				pointvo1.setState(0);
				pointvo1.setAccum(pointList.get(i).getAccum());
				pointvo1.setMember_pk(param.getMember_pk());
				pointvo1.setDisplay_pk(param.getNo());
				ticketDao.pointComment(pointvo1);
			}
		}
		param.setPoint(point);
		ticketDao.storePoint(param);
		
		ticketDao.reserveUpdate(param);
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
				
				if(r > 0) {
					delCount++;
				}
			}
		}
		return delCount;
	}
}
