package user.mypage;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import user.ticket.UTicketVO;
import util.Page;

@Service
public class MypageService {

	@Autowired
	private MypageDAO mypageDao;
	
	public ArrayList myResList(int member_pk) throws Exception {
		ArrayList list = mypageDao.myResList(member_pk);
		
		return list;
	}
	
	public int[] resCount(UTicketVO param) throws Exception {
		int rowCount = mypageDao.resCount(param);
		int[] rowPageCount = new int[2];
		int pageCount = Page.getPageCount(3, rowCount);
		rowPageCount[0] = rowCount;
		rowPageCount[1] = pageCount;
		return rowPageCount;
	}
	
}
