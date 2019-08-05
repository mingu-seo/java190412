package user.exhibition;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import manage.exhibition.ExhibitionVO;
import util.Page;

@Service
public class UExhibitionService {

	@Autowired
	private UExhibitionDAO uexhibitionDao;
	
	public ArrayList ingList(UExhibitionVO param) throws Exception {
		ArrayList list = uexhibitionDao.ingList(param);
		
		return list;
	}
	
	public int[] count(UExhibitionVO param) throws Exception {
		int rowCount = uexhibitionDao.count(param);
		int[] rowPageCount = new int[2];
		int pageCount = Page.getPageCount(param.getPageRows(), rowCount);
		rowPageCount[0] = rowCount;
		rowPageCount[1] = pageCount;
		return rowPageCount;
	}
	
	public ArrayList edList(UExhibitionVO param) throws Exception {
		ArrayList list = uexhibitionDao.edList(param);
		
		return list;
	}
	
	public UExhibitionVO display(int no) throws Exception {
		UExhibitionVO ticket = uexhibitionDao.display(no);
		
		return ticket;
	}
	
	public UExhibitionVO pastReview(int no) throws Exception {
		UExhibitionVO pastreview = uexhibitionDao.pastReview(no);
		
		return pastreview;
	}
}
