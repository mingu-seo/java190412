package user.ticket;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import manage.member.PointVO;
import manage.ticket.TicketDAO;
import manage.ticket.TicketVO;

@Service
public class UTicketService {

	@Autowired
	private UTicketDAO uticketDao;
	@Autowired
	private TicketDAO ticketDao;
	
	public int insert(UTicketVO param) throws Exception {
		int oNum = param.getOld_number();								//노인 수
		int aNum = param.getAdult_number();								//성인 수
		int sNum = param.getStudent_number();							//학생 수
		int totalnum = param.getNumber();								//총 인원
		int saleAfterPrice = 0;											//할인 적용 후 금액
		int usePoint = param.getUsepoint();								//사용 포인트
		int point = ticketDao.memberPoint(param.getMember_pk());		//해당 회원 포인트 불러오기
		
		//결제 금액
		if(totalnum >= 5) {
			if(oNum > 0) {
				saleAfterPrice = ((totalnum - oNum) * 7000) + (oNum * 5000);
			} else {
				saleAfterPrice = totalnum * 7000;
			}
		} else {
			saleAfterPrice = (oNum * 5000) + (aNum * 9000) + (sNum * 8000);
		}
		
		//실제 결제 금액
		int pay_price = saleAfterPrice - usePoint;
		
		//포인트 적립 후 param에 셋
		param.setStorepoint((int)(pay_price * 0.05));
		
		//실제 결제 금액과 할인 금액 셋
		param.setPay_price(pay_price);
		param.setSale_price((10000*totalnum)-pay_price);
		
		
		//포인트 적립
		param.setPoint(point+param.getStorepoint()-usePoint);
		uticketDao.storePoint(param);
		
		int lastNo = (Integer)uticketDao.insert(param);
		
		//point table에 포인트 코멘트 넣기(적립 포인트)
		if(param.getReservestate() == 1) {
			PointVO vo = new PointVO();
			vo.setMember_pk(param.getMember_pk());
			vo.setMemo("예매 포인트 적립");
			vo.setAccum(param.getStorepoint());
			vo.setState(0);
			vo.setDisplay_pk(param.getNo());
			ticketDao.pointComment(vo);
					
			//point table에 포인트 코멘트 넣기(사용 포인트)
			if(param.getUsepoint() != 0) {									//사용 포인트 있을 시 따로 insert도 해준다
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
	 
	
	public int cancel(UTicketVO param) throws Exception {
		UTicketVO data = uticketDao.read(param.getNo());
		data.setCanceldate(param.getCanceldate());
		ArrayList<PointVO> pointList = (ArrayList<PointVO>)ticketDao.pointRead(data.getNo());
		int point = ticketDao.memberPoint(data.getMember_pk());	//회원 포인트 조회
		PointVO pointvo = new PointVO();
		PointVO pointvo1 = new PointVO();
		
		//예매 취소 하면 포인트 회수
		for(int i = 0; i < pointList.size(); i++) {
			if(pointList.get(i).getState() == 0) {
				point -= pointList.get(i).getAccum();
				pointvo.setMemo("관리자:예매 취소로 지급 포인트를 회수합니다.");
				pointvo.setState(1);
				pointvo.setAccum(pointList.get(i).getAccum());
				pointvo.setMember_pk(data.getMember_pk());
				pointvo.setDisplay_pk(param.getNo());
				ticketDao.pointComment(pointvo);
			} else if(pointList.get(i).getState() == 1){
				point += pointList.get(i).getAccum();
				pointvo1.setMemo("관리자:예매 취소로 사용 포인트를 반환합니다.");
				pointvo1.setState(0);
				pointvo1.setAccum(pointList.get(i).getAccum());
				pointvo1.setMember_pk(data.getMember_pk());
				pointvo1.setDisplay_pk(param.getNo());
				ticketDao.pointComment(pointvo1);
			}
		}
		data.setPoint(point);
		uticketDao.storePoint(data);
		
		int r = (Integer)uticketDao.cancel(data);
		return r;
	}
}
