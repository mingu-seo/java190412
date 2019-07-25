package manage.doctor.sched;

import java.sql.Timestamp;
import util.Parameter;

public class SchedVO extends Parameter {
	
	private int no;
	private int doctor_pk;
	private String name;
	private int mon_start;
	private int mon_end;
	private int tue_start;
	private int tue_end;
	private int wed_start;
	private int wed_end;
	private int thu_start;
	private int thu_end;
	private int fri_start;
	private int fri_end;
	private int sat_start;
	private int sat_end;
	private int sun_start;
	private int sun_end;
	private int hol_start;
	private int hol_end;
	private int time; // 시간 선택
	private Timestamp registdate;
	private int mon_res;
	private int tue_res;
	private int wed_res;
	private int thu_res;
	private int fri_res;
	private int sat_res;
	private int sun_res;
	
	private int yoil;
	private String date;
	private int start_time;
	private int end_time;
	
	public SchedVO() {
		super.setPageRows(10);
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getDoctor_pk() {
		return doctor_pk;
	}

	public void setDoctor_pk(int doctor_pk) {
		this.doctor_pk = doctor_pk;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getMon_start() {
		return mon_start;
	}

	public void setMon_start(int mon_start) {
		this.mon_start = mon_start;
	}

	public int getMon_end() {
		return mon_end;
	}

	public void setMon_end(int mon_end) {
		this.mon_end = mon_end;
	}

	public int getTue_start() {
		return tue_start;
	}

	public void setTue_start(int tue_start) {
		this.tue_start = tue_start;
	}

	public int getTue_end() {
		return tue_end;
	}

	public void setTue_end(int tue_end) {
		this.tue_end = tue_end;
	}

	public int getWed_start() {
		return wed_start;
	}

	public void setWed_start(int wed_start) {
		this.wed_start = wed_start;
	}

	public int getWed_end() {
		return wed_end;
	}

	public void setWed_end(int wed_end) {
		this.wed_end = wed_end;
	}

	public int getThu_start() {
		return thu_start;
	}

	public void setThu_start(int thu_start) {
		this.thu_start = thu_start;
	}

	public int getThu_end() {
		return thu_end;
	}

	public void setThu_end(int thu_end) {
		this.thu_end = thu_end;
	}

	public int getFri_start() {
		return fri_start;
	}

	public void setFri_start(int fri_start) {
		this.fri_start = fri_start;
	}

	public int getFri_end() {
		return fri_end;
	}

	public void setFri_end(int fri_end) {
		this.fri_end = fri_end;
	}

	public int getSat_start() {
		return sat_start;
	}

	public void setSat_start(int sat_start) {
		this.sat_start = sat_start;
	}

	public int getSat_end() {
		return sat_end;
	}

	public void setSat_end(int sat_end) {
		this.sat_end = sat_end;
	}

	public int getSun_start() {
		return sun_start;
	}

	public void setSun_start(int sun_start) {
		this.sun_start = sun_start;
	}

	public int getSun_end() {
		return sun_end;
	}

	public void setSun_end(int sun_end) {
		this.sun_end = sun_end;
	}

	public int getHol_start() {
		return hol_start;
	}

	public void setHol_start(int hol_start) {
		this.hol_start = hol_start;
	}

	public int getHol_end() {
		return hol_end;
	}

	public void setHol_end(int hol_end) {
		this.hol_end = hol_end;
	}	
	
	public int getTime() {
		return time;
	}

	public void setTime(int time) {
		this.time = time;
	}

	public Timestamp getRegistdate() {
		return registdate;
	}

	public void setRegistdate(Timestamp registdate) {
		this.registdate = registdate;
	}

	public int getMon_res() {
		return mon_res;
	}

	public void setMon_res(int mon_res) {
		this.mon_res = mon_res;
	}

	public int getTue_res() {
		return tue_res;
	}

	public void setTue_res(int tue_res) {
		this.tue_res = tue_res;
	}

	public int getWed_res() {
		return wed_res;
	}

	public void setWed_res(int wed_res) {
		this.wed_res = wed_res;
	}

	public int getThu_res() {
		return thu_res;
	}

	public void setThu_res(int thu_res) {
		this.thu_res = thu_res;
	}

	public int getFri_res() {
		return fri_res;
	}

	public void setFri_res(int fri_res) {
		this.fri_res = fri_res;
	}

	public int getSat_res() {
		return sat_res;
	}

	public void setSat_res(int sat_res) {
		this.sat_res = sat_res;
	}

	public int getSun_res() {
		return sun_res;
	}

	public void setSun_res(int sun_res) {
		this.sun_res = sun_res;
	}

	public int getYoil() {
		return yoil;
	}

	public void setYoil(int yoil) {
		this.yoil = yoil;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getStart_time() {
		return start_time;
	}

	public void setStart_time(int start_time) {
		this.start_time = start_time;
	}

	public int getEnd_time() {
		return end_time;
	}

	public void setEnd_time(int end_time) {
		this.end_time = end_time;
	}
	
	

}
