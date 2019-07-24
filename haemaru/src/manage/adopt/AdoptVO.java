package manage.adopt;

import java.sql.Timestamp;

import manage.admin.AdminVO;
import util.Parameter;

public class AdoptVO extends Parameter  {

	private int no;
	private int animal_category;
	private String animal_image;
	private String animal_image_org;
	private String name;
	private int gender;
	private String age;
	private String charr;
	private String breed;
	private String vac;
	private int state;
	private Timestamp registdate;
	
	
	public AdoptVO() {
		super.setPageRows(10);
	}
	/**
	 * 생성자 페이지로우수 세팅
	 * @param pageRows 페이지 로우수
	 */
	public AdoptVO(int pageRows) {
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
	public String getTargetURLParam(String pageUrl, AdminVO param, int index) {

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
	public int getAnimal_category() {
		return animal_category;
	}
	public void setAnimal_category(int animal_category) {
		this.animal_category = animal_category;
	}
	public String getAnimal_image() {
		return animal_image;
	}
	public void setAnimal_image(String animal_image) {
		this.animal_image = animal_image;
	}
	public String getAnimal_image_org() {
		return animal_image_org;
	}
	public void setAnimal_image_org(String animal_image_org) {
		this.animal_image_org = animal_image_org;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getCharr() {
		return charr;
	}
	public void setCharr(String charr) {
		this.charr = charr;
	}
	public String getBreed() {
		return breed;
	}
	public void setBreed(String breed) {
		this.breed = breed;
	}
	public String getVac() {
		return vac;
	}
	public void setVac(String vac) {
		this.vac = vac;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public Timestamp getRegistdate() {
		return registdate;
	}
	public void setRegistdate(Timestamp registdate) {
		this.registdate = registdate;
	}
	
	
	
	
}
