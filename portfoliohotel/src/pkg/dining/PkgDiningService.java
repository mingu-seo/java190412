package pkg.dining;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import board.notice.NoticeVO;
import property.SiteProperty;
import util.FileUtil;
import util.Page;

@Service
public class PkgDiningService {
	
	@Autowired
	private PkgDiningDAO pkgDiningDao;
	
	public int[] count(PkgDiningVO vo) throws Exception {
		int rowCount = pkgDiningDao.count(vo);
		int[] rowPageCount = new int[2];
		int pageCount = Page.getPageCount(vo.getPageRows(), rowCount);
		rowPageCount[0] = rowCount;
		rowPageCount[1] = pageCount;
		return rowPageCount;
	}	
	
	public ArrayList list(PkgDiningVO vo) throws Exception {
		ArrayList list = pkgDiningDao.list(vo);
		return list;
	}	
	
	public int insert(PkgDiningVO vo, HttpServletRequest request) throws SQLException, IOException {
		int no = pkgDiningDao.insert(vo);
		return no;
	}

}
