package pet;

import java.sql.Timestamp;

import util.Parameter;

public class PetVO extends Parameter{
	
	private int no;
	private int member_pk;
	private String name;
	private int gender;
	private int age;
	private String breed;
	private String vac;
	private String mypet_image;
	private String mypet_image_org;
	private String memo;
	private Timestamp registdate;
	
	public PetVO() {
		super.setPageRows(10);
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

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
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

	public int getMember_pk() {
		return member_pk;
	}

	public void setMember_pk(int member_pk) {
		this.member_pk = member_pk;
	}

	public String getMypet_image() {
		return mypet_image;
	}

	public void setMypet_image(String mypet_image) {
		this.mypet_image = mypet_image;
	}

	public String getMypet_image_org() {
		return mypet_image_org;
	}

	public void setMypet_image_org(String mypet_image_org) {
		this.mypet_image_org = mypet_image_org;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public Timestamp getRegistdate() {
		return registdate;
	}

	public void setRegistdate(Timestamp registdate) {
		this.registdate = registdate;
	}
	
}
