package manage.reserve;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import property.SiteProperty;
import util.DateUtil;
import util.Function;
import util.Page;
import manage.doctor.DoctorDAO;
import manage.doctor.DoctorVO;
import manage.doctor.sched.*;
import member.MemberDAO;
import member.MemberVO;

@Service
public class ReserveService {

	@Autowired
	private ReserveDao reserveDao;

	@Autowired
	private MemberDAO memberDao;

	public int[] count(ReserveVO param) throws SQLException {
		int rowCount = reserveDao.count(param);
		int[] rowPageCount = new int[2];
		int pageCount = Page.getPageCount(param.getPageRows(), rowCount);
		rowPageCount[0] = rowCount;
		rowPageCount[1] = pageCount;
		return rowPageCount;
	}

	public ArrayList list(ReserveVO param) throws SQLException {
		ArrayList list = reserveDao.list(param);
		return list;
	}

	public int insert(ReserveVO vo) throws Exception { 
		MemberVO mvo = new MemberVO();
		mvo.setName(vo.getName());
		mvo.setTel(vo.getTel());

		MemberVO rvo = memberDao.checkMember(mvo);

		if (rvo != null) {
			vo.setMember_pk(rvo.getNo());
		} else {
			int mno = memberDao.insert(mvo);
			vo.setMember_pk(mno);
		}

		int lastNo = (Integer) reserveDao.insert(vo);
		return lastNo;
	}

	public ReserveVO read(int no) throws SQLException {
		ReserveVO vo = reserveDao.read(no);
		return vo;
	}

	public int update(ReserveVO vo) throws Exception {
		ReserveVO data = reserveDao.read(vo.getNo());
		int r = (Integer) reserveDao.update(vo);
		return r;
	}

	public int delete(int no) throws SQLException {
		int cnt = reserveDao.delete(no);
		return cnt;
	}

	public int groupDelete(HttpServletRequest request) throws SQLException {
		String[] no = request.getParameterValues("no");
		int r = 0;
		for (int i = 0; i < no.length; i++) {
			int nos = Integer.parseInt(no[i]);
			r += reserveDao.delete(nos);
		}
		return r;
	}

	public ArrayList doctorList(String date, int department) throws Exception {
		HashMap hm = new HashMap();
		hm.put("department", department);
		hm.put("yoil", DateUtil.getYoil(date));
		return reserveDao.doctorList(hm);
	}

	public SchedVO schedList(SchedVO param) throws Exception {
		int yoil = DateUtil.getYoil(param.getDate());
		param.setYoil(yoil);
		SchedVO slist = reserveDao.schedList(param);
		return slist;
	}

	public ArrayList reservedTime(String date, int doctor_pk) throws Exception {
		ReserveVO vo = new ReserveVO();
		vo.setDoctor_pk(doctor_pk);
		vo.setRes_date(date);
		return reserveDao.reservedTime(vo);
	}

	public ArrayList<ReserveVO> reservation(ReserveVO param) throws Exception {
		return reserveDao.reservation(param);
	}

	public void reserveInsert(ReserveVO vo) throws SQLException {
		reserveDao.reserveInsert(vo);
	}
}
