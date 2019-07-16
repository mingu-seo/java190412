package board.notice;

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
	
	public int insert(NoticeVO vo, HttpServletRequest request) throws SQLException, IOException {
		FileUtil fu = new FileUtil();
		Map fileMap = fu.getFileMap(request);
		MultipartFile file= (MultipartFile)fileMap.get("filename_tmp");
		if (!file.isEmpty()) {
			fu.upload(file, SiteProperty.NOTICE_UPLOAD_PATH, SiteProperty.REAL_PATH, "product");
			vo.setFile(fu.getName());
			vo.setFile_org(fu.getSrcName());
		}
		int no = noticeDao.insert(vo);
		return no;
	}
	
	public int delete(int no) throws SQLException {
		int cnt = noticeDao.delete(no);
		return cnt;
	}
	
	public NoticeVO read(int no) throws SQLException {
		NoticeVO vo = noticeDao.read(no);
		return vo;
	}

}
