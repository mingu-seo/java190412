package board.qna;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.swing.plaf.basic.BasicInternalFrameTitlePane.TitlePaneLayout;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import property.SiteProperty;
import util.FileUtil;
import util.Function;
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
		MultipartFile file= (MultipartFile)fileMap.get("imagename_tmp");
		if (!file.isEmpty()) {
			fu.upload(file, SiteProperty.QNA_UPLOAD_PATH, SiteProperty.REAL_PATH, "qna");
			vo.setFilename(fu.getName());
			vo.setFilename_org(fu.getSrcName());
		}
		
		int lastNo = (Integer)qnaDao.insert(vo);
		
		return lastNo;
	}
	
	public QnaVO read(QnaVO vo) throws Exception {
		QnaVO data = qnaDao.read(vo);
		return data;
	}

	public int update(QnaVO vo) throws Exception {
		QnaVO data = qnaDao.read(vo);
		int r = (Integer)qnaDao.update(vo);
		if(r > 0){
			if("1".equals(vo.getFilename_org()) || !"".equals(Function.checkNull(vo.getFilename()))){
				Function.fileDelete(vo.getUploadPath(), data.getFilename());
			}
		}
		return r;
	}

	
	public int delete(QnaVO vo) throws Exception {
		QnaVO data = qnaDao.read(vo);
		int r = qnaDao.delete(vo);
		if (r > 0) {
			Function.fileDelete(vo.getUploadPath(), data.getFilename());
		}
		return r;
	}
	
	public int groupDelete(QnaVO vo, HttpServletRequest request) throws Exception {
		String[] nos = request.getParameterValues("no");
		int delCount = 0;
		if (nos.length > 0) {
			for (int i=0; i<nos.length; i++) {
				QnaVO nvo = new QnaVO();
				nvo.setNo(Function.getIntParameter(nos[i]));
				QnaVO data = qnaDao.read(vo);
				int r = qnaDao.delete(vo);
				if (r > 0) {
					delCount++;
					Function.fileDelete(vo.getUploadPath(), data.getFilename());
				}
			}
		}
		return delCount;
	}
	
	public void insertOption(HttpServletRequest req, int no) throws Exception {
		String[] title = req.getParameterValues("title");
		String[] optPrice = req.getParameterValues("optPrice");
		int optSize = title.length;
		for(int i=0; i<optSize; i++) {
			HashMap m = new HashMap();
			m.put("title", title[i]);
			m.put("price", optPrice[i]);
			m.put("no", no);
			qnaDao.insertOption(m);
		}
	}
	
	public ArrayList<HashMap> listOption(int no) throws Exception {
		ArrayList<HashMap> list = qnaDao.listOption(no);
		return list;
	}
	
	public void deleteOption(int no) throws Exception{
		qnaDao.deleteOption(no);
	}
	
	public ArrayList<QnaReplyVO> reviewlist(int no) throws Exception{
		return qnaDao.reviewlist(no);
	}
	public void reviewInsert(QnaReplyVO vo) throws Exception{
		qnaDao.reviewInsert(vo);
		
	}
	
	public void reviewDelete(int no) throws Exception {
		qnaDao.reviewDelete(no);
	}
	

}
