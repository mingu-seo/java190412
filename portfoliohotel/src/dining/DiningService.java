package dining;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import util.Page;

@Service
public class DiningService {

	@Autowired
	private DiningDAO diningDao;
	
	public int[] count(DiningVO vo) throws Exception {
		int rowCount = diningDao.count(vo);
		int[] rowPageCount = new int[2];
		int pageCount = Page.getPageCount(vo.getPageRows(), rowCount);
		rowPageCount[0] = rowCount;
		rowPageCount[1] = pageCount;
		return rowPageCount;
	}

	public ArrayList list(DiningVO vo) throws Exception {
		ArrayList list = diningDao.list(vo);
		return list;
	}
	
	public int insert(DiningVO vo) throws SQLException {
		int no = diningDao.insert(vo);
		return no;
	}
	
}
