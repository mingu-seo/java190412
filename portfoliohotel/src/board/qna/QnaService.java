package board.qna;

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
public class QnaService {

	@Autowired
	private QnaDAO qnaDao;
	
	public int[] count(QnaVO vo) throws Exception {
		int rowCount = qnaDao.count(vo);
		int[] rowPageCount = new int[2];
		int pageCount = Page.getPageCount(vo.getPageRows(), rowCount);
		rowPageCount[0] = rowCount;
		rowPageCount[1] = pageCount;
		return rowPageCount;
	}

	public ArrayList list(QnaVO vo) throws Exception {
		ArrayList list = qnaDao.list(vo);
		return list;
	}

	public int insert(QnaVO vo, HttpServletRequest request) throws Exception {
		
		FileUtil fu = new FileUtil();
		Map fileMap = fu.getFileMap(request);
		MultipartFile file= (MultipartFile)fileMap.get("file_tmp");
		if (!file.isEmpty()) {
			fu.upload(file, SiteProperty.QNA_UPLOAD_PATH, SiteProperty.REAL_PATH, "qna");
			vo.setFile(fu.getName());
			vo.setFile_org(fu.getSrcName());
			vo.setFilesize(fu.getSrcSize());
		}
		
		int lastNo = (Integer)qnaDao.insert(vo);
		
		return lastNo;
	}
	public int update(QnaVO vo) throws SQLException {
		int cnt = qnaDao.update(vo);
		return cnt;
	}

	public int delete(int no) throws SQLException {
		int cnt = qnaDao.delete(no);
		return cnt;
	}

	public QnaVO read(int no) throws SQLException {
		QnaVO vo = qnaDao.read(no);
		return vo;
	}



	public int groupDelete(HttpServletRequest request) throws SQLException {
		String[] no = request.getParameterValues("no");
		int r = 0;
		for (int i=0; i<no.length; i++) {
			int nos = Integer.parseInt(no[i]);
			r += qnaDao.delete(nos);
		}
		return r;
	}
	
	
	//관리자
}
