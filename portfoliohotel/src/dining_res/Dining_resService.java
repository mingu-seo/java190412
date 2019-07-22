package dining_res;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import util.Page;

@Service
public class Dining_resService {
	
	@Autowired
	private Dining_resDAO dining_resDao;

	public int[] count(Dining_resVO vo) throws Exception {
		int rowCount = dining_resDao.count(vo);
		int[] rowPageCount = new int[2];
		int pageCount = Page.getPageCount(vo.getPageRows(), rowCount);
		rowPageCount[0] = rowCount;
		rowPageCount[1] = pageCount;
		return rowPageCount;
	}

	public ArrayList list(Dining_resVO vo) throws Exception {
		ArrayList list = dining_resDao.list(vo);
		return list;
	}
	
	public int insert(Dining_resVO vo) throws SQLException {
		int no = dining_resDao.insert(vo);
		return no;
	}

}
