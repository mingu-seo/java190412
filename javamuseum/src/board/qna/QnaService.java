package board.qna;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
		MultipartFile file= (MultipartFile)fileMap.get("filename_tmp");
		if (!file.isEmpty()) {
			fu.upload(file, SiteProperty.NOTICE_UPLOAD_PATH, SiteProperty.REAL_PATH, "qna");
			vo.setFilename(fu.getName());
			vo.setFilename_org(fu.getSrcName());
			vo.setFilesize(fu.getSrcSize());
		}
		int maxgno = qnaDao.getMaxGno();
		vo.setGno(maxgno);
		int lastNo = (Integer)qnaDao.insert(vo);
		
		return lastNo;
	}
	
	public int reply(QnaVO vo) throws Exception{
		int maxOno = qnaDao.getMaxOno(vo);		//같은 그룹내 최대 ono
		int minOno = qnaDao.getMinOno(vo);		//같은 그룹내에 원글 ono보다 크고 원글의 nested보다 작거나 같은 최소 ono
		if(minOno == 0) {
			vo.setOno(maxOno+1);
		}else {
			HashMap hm = new HashMap();
			hm.put("gno", vo.getGno());
			hm.put("minono", minOno);
			qnaDao.UpdateOno(hm);
			vo.setOno(minOno);
		}
		vo.setNest(vo.getNest()+1);
		
		
		int r = qnaDao.insert(vo);
		return r;
	}
	
	public QnaVO read(QnaVO vo, boolean userCon) throws Exception {
		QnaVO data = qnaDao.read(vo);
		if (userCon) {	// 사용자쪽 조회시만 update
			qnaDao.updateReadno(vo);
		}
		return data;
	}

	public int update(QnaVO vo) throws Exception {
		QnaVO data = qnaDao.read(vo);
		int r = (Integer)qnaDao.update(vo);
		if(r > 0){
			if("1".equals(vo.getFilename_chk()) || !"".equals(Function.checkNull(vo.getFilename()))){
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
				int r = qnaDao.delete(nvo);
				if (r > 0) {
					delCount++;
					//Function.fileDelete(vo.getUploadPath(), data.getFilename());
				}
			}
		}
		return delCount;
	}

	/*
	public ArrayList mainList(NoticeVO vo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
*/
}
