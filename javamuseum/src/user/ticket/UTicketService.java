package user.ticket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UTicketService {

	@Autowired
	private UTicketDAO uticketDao;
	
	public int insert(UTicketVO param) throws Exception {
		int oNum = param.getOld_number();			//노인 수
		int aNum = param.getAdult_number();			//성인 수
		int sNum = param.getStudent_number();		//학생 수
		int totalnum = param.getNumber();			//총 인원
		int saleAfterPrice = 0;						//할인 적용 후 금액
		int usePoint = param.getUsepoint();			//사용 포인트
		
		//결제 금액
		if(totalnum == 5) {
			if(oNum > 0) {
				saleAfterPrice = ((totalnum - oNum) * 7000) + (oNum * 5000);
			} else {
				saleAfterPrice = totalnum * 7000;
			}
		} else {
			saleAfterPrice = (oNum * 5000) + (aNum * 9000) + (sNum * 8000);
		}
		
		int pay_price = saleAfterPrice - usePoint;	//실제 결제 금액
		
		//포인트 적립 후 param에 셋
		param.setStorepoint((int)(pay_price * 0.05));
		
		//실제 결제 금액과 할인 금액 셋
		param.setPay_price(pay_price);
		param.setSale_price(10000-pay_price);
		
		int lastNo = (Integer)uticketDao.insert(param);
		
		return lastNo;
	}
}
