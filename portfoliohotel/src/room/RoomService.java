package room;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import property.SiteProperty;
import util.FileUtil;
import util.Function;

@Service
public class RoomService {

	@Autowired
	private RoomDAO roomDAO;
	
	/**
	 * 객실 목록
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public ArrayList list(RoomVO vo) throws Exception {
		ArrayList list = roomDAO.list(vo);
		return list;
	}
	
	/**
	 * 객실 등록
	 * @param vo
	 * @param req
	 * @param files
	 * @return
	 * @throws Exception
	 */
	public int insert(RoomVO vo, HttpServletRequest req, List<MultipartFile> files) throws Exception{	
		String[] arr = new String[10];
		String[] arr_org = new String[10];
		
		FileUtil fu = new FileUtil();
		Map fileMap = fu.getFileMap(req);
		
		int lastNo = (Integer)roomDAO.insert(vo);
		
		MultipartHttpServletRequest mreq = (MultipartHttpServletRequest) req;
		Iterator images = mreq.getFileNames();
		
		HashMap m = new HashMap();
		m.put("room_pk", lastNo);
		FileUtil fu2 = new FileUtil();
		System.out.println("files.size():"+files.size());
		for (int i=0; i<files.size(); i++) {
			if (!files.get(i).isEmpty()) {
				fu2.upload(files.get(i), SiteProperty.ROOM_UPLOAD_PATH, SiteProperty.REAL_PATH, "room");
				m.put("image", fu2.getName());
				roomDAO.insert_image(m);
			}
		}
		
		return lastNo;
	}
	
	
	/**
	 * 객실 이미지 목록
	 * @param room_pk
	 * @return
	 * @throws SQLException
	 */
	public ArrayList<HashMap> list_image(int room_pk) throws Exception {
		return roomDAO.list_image(room_pk);
	}
	
	/**
	 * 객실 상세
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public RoomVO read(RoomVO vo) throws Exception {
		RoomVO read = roomDAO.read(vo);
		return read;
	}
	
	/**
	 * 객실 수정
	 * @param vo
	 * @param req
	 * @param vo_i
	 * @param files
	 * @return
	 * @throws Exception
	 */
	public int update(RoomVO vo, HttpServletRequest req, Room_imageVO vo_i, List<MultipartFile> files) throws Exception {
		RoomVO read = roomDAO.read(vo);		
		
		MultipartHttpServletRequest mreq = (MultipartHttpServletRequest) req;
		Iterator images = mreq.getFileNames();
		
		HashMap m = new HashMap();
		m.put("room_pk", read.getNo());
		FileUtil fu = new FileUtil();
		System.out.println("files.size():"+files.size());
		for (int i=0; i<files.size(); i++) {
			if (!files.get(i).isEmpty()) {
				fu.upload(files.get(i), SiteProperty.ROOM_UPLOAD_PATH, SiteProperty.REAL_PATH, "room");
				m.put("image", fu.getName());
				roomDAO.insert_image(m);
			}
		}
		
		int r = roomDAO.update(vo);
		
		if(r > 0) {
			if("1".equals(vo_i.getImage_chk()) || !"".equals(Function.checkNull(vo_i.getImage()))) {
				Function.fileDelete(SiteProperty.REAL_PATH+SiteProperty.ROOM_UPLOAD_PATH, vo_i.getImage());
			}
		}
		
		return r;
	}
	
	/**
	 * 객실 삭제
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int delete(RoomVO vo) throws SQLException {
		RoomVO read = roomDAO.read(vo);
		int r = roomDAO.delete(vo);
		
		return r;
	}
	
	/**
	 * 객실 단체 삭제
	 * @param vo
	 * @param req
	 * @return
	 * @throws Exception
	 */
	public int groupDelete(RoomVO vo, HttpServletRequest req) throws Exception {
		String[] nos = req.getParameterValues("no");
		int delCount = 0;
		if(nos.length > 0) {
			for (int i=0; i<nos.length; i++) {
				RoomVO rvo = new RoomVO();
				rvo.setNo(Function.getIntParameter(nos[i]));
				RoomVO read = roomDAO.read(rvo);
				int r = roomDAO.delete(rvo);
				if(r > 0) {
					delCount++;
				}
			}			
		}
		return delCount;
	}
	
	/**
	 * 객실 이미지 삭제
	 * @param no
	 * @param imagename
	 * @throws Exception
	 */
	public void delete_image(int no, String imagename) throws Exception {
		System.out.println(imagename);
		Function.fileDelete(SiteProperty.REAL_PATH+SiteProperty.ROOM_UPLOAD_PATH, imagename);
		roomDAO.delete_image(no);
	}
	
	
	/**
	 * 객실 옵션 목록
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public ArrayList list_opt(Room_optVO vo) throws Exception{
		ArrayList list_opt = roomDAO.list_opt(vo);
		return list_opt;
	}
	
	/**
	 * 객실 옵션 등록
	 * @param vo
	 * @param req
	 * @return
	 * @throws Exception
	 */
	public int insert_opt(Room_optVO vo, HttpServletRequest req) throws Exception{	
		
		FileUtil fu = new FileUtil();
		Map fileMap = fu.getFileMap(req);
		MultipartFile file= (MultipartFile)fileMap.get("imagename_tmp");
		if (!file.isEmpty()) {
			fu.upload(file, SiteProperty.ROOM_OPT_UPLOAD_PATH, SiteProperty.REAL_PATH, "room_opt");
			vo.setImage(fu.getName());
			vo.setImage_org(fu.getSrcName());
		}
		
		int lastNo = (Integer)roomDAO.insert_opt(vo);
		return lastNo;
	}
	
	/**
	 * 객실 옵션 수정
	 * @param vo
	 * @param req
	 * @return
	 * @throws Exception
	 */
	public int update_opt(Room_optVO vo, HttpServletRequest req) throws Exception {
		int r = roomDAO.update_opt(vo);
		return r;
	}
	
	/**
	 * 객실 옵션 삭제
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int delete_opt(Room_optVO vo) throws SQLException {
		Room_optVO read = roomDAO.read_opt(vo);
		int r = roomDAO.delete_opt(vo);
		if (r > 0) {
			Function.fileDelete(SiteProperty.REAL_PATH+SiteProperty.ROOM_OPT_UPLOAD_PATH, read.getImage());
		}
		
		return r;
	}
	
	/**
	 * 객실 옵션 단체 삭제
	 * @param vo
	 * @param req
	 * @return
	 * @throws Exception
	 */
	public int groupDelete_opt(Room_optVO vo, HttpServletRequest req) throws Exception {
		String[] nos = req.getParameterValues("no");
		int delCount = 0;
		if(nos.length > 0) {
			for (int i=0; i<nos.length; i++) {
				Room_optVO rvo = new Room_optVO();
				rvo.setNo(Function.getIntParameter(nos[i]));
				Room_optVO read = roomDAO.read_opt(rvo);
				int r = roomDAO.delete_opt(rvo);
				if(r > 0) {
					delCount++;
				}
			}			
		}
		return delCount;
	}
	
	
	/**
	 * 객실 편의시설 목록
	 * @param room_pk
	 * @return
	 * @throws SQLException
	 */
	public ArrayList<HashMap> list_service(int room_pk) throws SQLException {
		return roomDAO.list_service(room_pk);
	}	
	
	/**
	 * 객실 편의시설 등록
	 * @param req
	 * @param room_pk
	 * @throws Exception
	 */
	public void insert_service(HttpServletRequest req, int room_pk) throws Exception {
		String[] names = req.getParameterValues("name_s");
		
		int size = 0;
		if (names != null) size = names.length;
		
		for(int i=0; i<size; i++) {
			HashMap m = new HashMap();
			m.put("name_s", names[i]);
			m.put("room_pk", room_pk);
			
			roomDAO.insert_service(m);
		}
	}
	
	/**
	 * 객실 편의시설 수정
	 * @param req
	 * @param room_pk
	 * @throws Exception
	 */
	public void update_service(HttpServletRequest req, int room_pk) throws Exception {
		String[] names = req.getParameterValues("name_s");
		
		int size = names.length;
		
		roomDAO.delete_service(room_pk);
		
		for(int i=0; i<size; i++) {
			HashMap m = new HashMap();
			m.put("name_s", names[i]);
			m.put("room_pk", room_pk);
			
			roomDAO.update_service(m);
		}
	}
	
}
