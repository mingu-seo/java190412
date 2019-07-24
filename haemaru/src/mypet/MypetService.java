package mypet;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import property.SiteProperty;
import util.FileUtil;
import util.Page;
import util.Function;

@Service
public class MypetService {

	@Autowired
	private MypetDAO mypetDAO;
	
	public int[] count(MypetVO vo) throws Exception {
		int rowCount = mypetDAO.count(vo);
		int[] rowPageCount = new int[2];
		int pageCount = Page.getPageCount(vo.getPageRows(), rowCount);
		rowPageCount[0] = rowCount;
		rowPageCount[1] = pageCount;
		return rowPageCount;
	}

	public ArrayList list(MypetVO vo) throws Exception {
		ArrayList list = mypetDAO.list(vo);
		return list;
	}

	public int insert(MypetVO vo, HttpServletRequest request) throws Exception {
		
		FileUtil fu = new FileUtil();
		Map fileMap = fu.getFileMap(request);
		MultipartFile file= (MultipartFile)fileMap.get("image_tmp");
		if (!file.isEmpty()) {
			fu.upload(file, SiteProperty.MYPET_UPLOAD_PATH, SiteProperty.REAL_PATH, "mypet");
			vo.setMypet_image(fu.getName());
			vo.setMypet_image_org(fu.getSrcName());
		}
		
		int lastNo = (Integer)mypetDAO.insert(vo);
		
		return lastNo;
	}
	
	public MypetVO read(MypetVO vo) throws Exception {
		MypetVO data = mypetDAO.read(vo);
		
		return data;
	}

	public int update(MypetVO vo) throws Exception {
		MypetVO data = mypetDAO.read(vo);
		int r = (Integer)mypetDAO.update(vo);
		if(r > 0){
			if("1".equals(vo.getMypet_image_chk()) || !"".equals(Function.checkNull(vo.getMypet_image()))){
				Function.fileDelete(vo.getUploadPath(), data.getMypet_image());
			}
		}
		return r;
	}

	
	public int delete(int no) throws Exception {
		int cnt = mypetDAO.delete(no);
		return cnt;
	}
	
	public int groupDelete(HttpServletRequest request) throws Exception {
		String[] no = request.getParameterValues("no");
		int r = 0;
		for (int i = 0; i < no.length; i++) {
			int nos = Integer.parseInt(no[i]);
			r += mypetDAO.delete(nos);
		}
		return r;
	}
	
	
}
