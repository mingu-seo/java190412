package board.qna;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import board.notice.NoticeVO;
import board.qna.QnaVO;
import mail.SendMail;
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
			fu.upload(file, SiteProperty.QNA_UPLOAD_PATH, SiteProperty.REAL_PATH, "qna");
			vo.setFile(fu.getName());
			vo.setFile_org(fu.getSrcName());
			vo.setFilesize(fu.getSrcSize());
		}
		
		int no = (Integer)qnaDao.insert(vo);
		
		return no;
	}
	
public int update(QnaVO vo) throws SQLException, IOException {
		
	QnaVO data = qnaDao.read(vo);
	int r = (Integer)qnaDao.update(vo);
	if(r > 0){
		if("1".equals(vo.getFile_chk()) || !"".equals(Function.checkNull(vo.getFile()))){
			Function.fileDelete(vo.getUploadPath(), data.getFile());
		}
	}
	return r;
		 
		
	}

	public QnaVO read(QnaVO vo) throws SQLException {
		QnaVO r = qnaDao.read(vo);
		return r;
	}

	public int delete(QnaVO vo) throws SQLException {
		QnaVO read = qnaDao.read(vo);
		int r = qnaDao.delete(vo);
		
		return r;
	}
	

	/*	관리자  쓰기 , 수정*/
	public int updateReply(QnaVO vo)throws SQLException, Exception { 
		 QnaVO read = qnaDao.read(vo);
		 String[] emailArr = read.getEmail().split(",");
		 String[] nameArr= read.getName().split(",");
		 
		 String emailAdress = emailArr[0]+ emailArr[1];
		 String NametoSend = nameArr[0]+ nameArr[1];
		 String ReplyContents = vo.getReply_contents();
		
		 int no = qnaDao.updateReply(vo); 
		 if(vo.getSend_email()==1) {
			 SendMail.sendEmail("joonoh94@naver.com", emailAdress, 
					 			"[Portfolio HOTEL]"+NametoSend+"님 질문에 답변이 달렸습니다.", 
					 			"답변 : " + ReplyContents ); 
		 }
		 return no; 
	 } 
	 
	/*	관리자  삭제	  */
	 public int deleteReply(QnaVO vo) throws SQLException {
		 int no = qnaDao.deleteReply(vo); 
		 return no; 
		}
	 
	/*
	 * public int replyDelete(int no) throws SQLException { int cnt =
	 * qnaDao.replyDelete(no); return cnt; }
	 */
	 



	public int groupDelete(QnaVO vo, HttpServletRequest request) throws Exception {
		String[] nos = request.getParameterValues("no");
		int delCount = 0;
		if (nos.length > 0) {
			for (int i=0; i<nos.length; i++) {
				QnaVO nvo = new QnaVO();
				nvo.setNo(Function.getIntParameter(nos[i]));
				QnaVO data = qnaDao.read(nvo);
				int r = qnaDao.delete(nvo);
				if (r > 0) {
					delCount++;
					Function.fileDelete(vo.getUploadPath(), data.getFile());
				}
			}
		}
		return delCount;
	}

	

	
}