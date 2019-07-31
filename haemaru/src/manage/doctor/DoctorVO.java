package manage.doctor;

import java.sql.Timestamp;
import java.util.ArrayList;

import manage.doctor.sched.SchedVO;
import manage.reserve.ReserveVO;
import util.Parameter;

public class DoctorVO extends Parameter {
	
	
	private int no; //의료진 번호
	private String name; //의료진 이름
	private int department; //의료진 부서 외과, 내과, 영상의학과, 응급중환자센터
	private int position; //원장, 수의사, 테크니션, 리셉션리스트
	private String addr; //의료진 주소
	private String tel; //의료진연락처
	private int category; //의료진 검색 카테고리, 이름, 연락처
	private String doc_image; //의료진 이미지 이름
	private String doc_image_org; //의료진 이미지 원본이름
	private String doc_imagename_chk; //의료진 이미지 이름 체크 : DB에 존재X : VO에만 존재
	private Timestamp registdate; //의료진 등록일
	private int gender; //의료진 성별 남, 여
	
	private int isDoctor;
	
	private SchedVO slist;
	ArrayList<ReserveVO> tlist;

	public DoctorVO() {
		super.setPageRows(10);
		this.isDoctor=0;
	}
	/**
	 * 생성자 페이지로우수 세팅
	 * @param pageRows 페이지 로우수
	 */
	public DoctorVO(int pageRows) {
		super.setPageRows(pageRows);
	}
	
	/**
	 *  검색조건 파라미터
	 *  read에서 index등으로 검색조건 그대로 이동할때
	 *  답글작성 후 다시 read페이지로 돌아갈때 no가 필요하므로 index값 설정
	 *  그 외 필요한 값들은 각 VO에 세팅할 것.
	 * @param pageUrl target URL
	 * @param param Parameter
	 * @param index no값필요시
	 * @return String
	 */
	public String getTargetURLParam(String pageUrl, DoctorVO param, int index) {

		StringBuffer strList= new StringBuffer();

		if (param != null) {
			strList.append(pageUrl);
			strList.append("?stype=" + param.getStype());
			strList.append("&sval="+param.getSval());
			strList.append("&reqPageNo="+param.getReqPageNo());
			if (index > 0) {
				strList.append("&no="+index);
			}
		}
		return strList.toString();
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getDepartment() {
		return department;
	}
	public void setDepartment(int department) {
		this.department = department;
	}
	public int getPosition() {
		return position;
	}
	public void setPosition(int position) {
		this.position = position;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public String getDoc_image() {
		return doc_image;
	}
	public void setDoc_image(String doc_image) {
		this.doc_image = doc_image;
	}
	public String getDoc_image_org() {
		return doc_image_org;
	}
	public void setDoc_image_org(String doc_image_org) {
		this.doc_image_org = doc_image_org;
	}
	public String getDoc_imagename_chk() {
		return doc_imagename_chk;
	}
	public void setDoc_imagename_chk(String doc_imagename_chk) {
		this.doc_imagename_chk = doc_imagename_chk;
	}
	public Timestamp getRegistdate() {
		return registdate;
	}
	public void setRegistdate(Timestamp registdate) {
		this.registdate = registdate;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public SchedVO getSlist() {
		return slist;
	}
	public void setSlist(SchedVO slist) {
		this.slist = slist;
	}
	public ArrayList<ReserveVO> getTlist() {
		return tlist;
	}
	public void setTlist(ArrayList<ReserveVO> tlist) {
		this.tlist = tlist;
	}
	public int getIsDoctor() {
		return isDoctor;
	}
	public void setIsDoctor(int isDoctor) {
		this.isDoctor = isDoctor;
	}	

}