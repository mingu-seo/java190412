package manage.doctor.sched;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;
import manage.admin.AdminVO;
import member.MemberVO;


@Repository
public class SchedDAO extends SqlMapClientDAOSupport {

	public int count(SchedVO param) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("sched.count", param);
	}	

	/**
	 * 회원 목록 조회
	 * @param param
	 * @return ArrayList<AdminVO>
	 * @throws SQLException
	 */
	
	public ArrayList list(SchedVO param) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("sched.list", param);
	}

	/**
	 * 관리자 등록
	 * @param vo
	 * @return no 마지막 등록된 no
	 * @throws SQLException
	 */
	public int insert(SchedVO vo) throws SQLException {
		return (Integer) getSqlMapClient().insert("sched.insert", vo);
		
	}

	/**
	 * 관리자 수정
	 * @param vo
	 * @throws SQLException
	 */
	public int update(SchedVO vo) throws SQLException {
		return getSqlMapClient().update("sched.update", vo);
	}

	/**
	 * 관리자 삭제
	 * @param no
	 * @throws SQLException
	 */
	public int delete(int no) throws SQLException {
		return getSqlMapClient().delete("sched.delete", no);
	}

	/**
	 * 관리자 상세
	 * @param i
	 * @return
	 * @throws SQLException
	 */
	public SchedVO read(int i) throws SQLException {
		return (SchedVO)getSqlMapClient().queryForObject("sched.read", i);
		 		
		
	}
	
	
	public static void main(String[] args) throws SQLException {
		SchedDAO dao = new SchedDAO();
		SchedVO vo = new SchedVO();
//		ad.count(av);
//		ad.list(av);
//		av.setId("dayeong");
//		av.setPassword("1234");
//		av.setName("dayeong");
//		int no = ad.insert(av);
//		int cnt = ad.idcheck("dayeong1234");
//		System.out.println(cnt);
		
//		HashMap m = new HashMap();
//		m.put("product_pk",1);
//		m.put("title", "테스트옵션");
//		m.put("price", 99119);
//		pd.insertOption(m);
		
//		ArrayList<HashMap> list = pd.listOption(268);
//		
//		for(int i=0; i<list.size(); i++) {
//			System.out.println("상품명 : " + list.get(i).get("title")+"상품명 : " + list.get(i).get("price"));
//		}
		
		/* pd.reviewList(1); */
		
	}
}
