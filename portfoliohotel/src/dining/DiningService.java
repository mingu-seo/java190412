package dining;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import property.SiteProperty;
import util.FileUtil;
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

	public int insert(DiningVO vo, HttpServletRequest request) throws Exception {
		FileUtil fu = new FileUtil();
		Map fileMap = fu.getFileMap(request);
		MultipartFile file= (MultipartFile)fileMap.get("image_tmp");
		if (!file.isEmpty()) {
			fu.upload(file, SiteProperty.DINING_UPLOAD_PATH, SiteProperty.REAL_PATH, "dining");
			vo.setImagename(fu.getName());
			vo.setImagename_org(fu.getSrcName());
		}
		
		int lastNo = (Integer)diningDao.insert(vo);
		
		return lastNo;
	}

	public int update(DiningVO vo, HttpServletRequest request) throws SQLException, IOException {
		FileUtil fu = new FileUtil();
		Map fileMap = fu.getFileMap(request);
		MultipartFile file= (MultipartFile)fileMap.get("image_tmp");
		if (!file.isEmpty()) {
			fu.upload(file, SiteProperty.DINING_UPLOAD_PATH, SiteProperty.REAL_PATH, "dining");
			vo.setImagename(fu.getName());
			vo.setImagename_org(fu.getSrcName());
		}
		int cnt = diningDao.update(vo);
		return cnt;
	}

	public int delete(int no) throws SQLException {
		int cnt = diningDao.delete(no);
		return cnt;
	}

	public int groupDelete(HttpServletRequest request) throws SQLException {
		String[] no = request.getParameterValues("no");
		int r = 0;
		for (int i = 0; i < no.length; i++) {
			int nos = Integer.parseInt(no[i]);
			r += diningDao.delete(nos);
		}
		return r;
	}

	public DiningVO read(int no) throws SQLException {
		DiningVO vo = diningDao.read(no);
		return vo;
	}

}
