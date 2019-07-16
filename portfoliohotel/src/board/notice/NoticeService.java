package board.notice;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.notice3.NoticeVO3;
import util.Page;

@Service
public class NoticeService {
	
	@Autowired
	private NoticeDAO noticeDao;
	
	public int[] count(NoticeVO vo) throws Exception {
		int rowCount = noticeDao.count(vo);
		int[] rowPageCount = new int[2];
		int pageCount = Page.getPageCount(vo.getPageRows(), rowCount);
		rowPageCount[0] = rowCount;
		rowPageCount[1] = pageCount;
		return rowPageCount;
	}
	
	public ArrayList list(NoticeVO vo) throws Exception {
		ArrayList list = noticeDao.list(vo);
		return list;
	}	

}
