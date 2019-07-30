package manage.rental;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;
import manage.member.MemberVO;

@Repository
public class RentalDAO extends SqlMapClientDAOSupport {
	public int count(RentalVO param) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("rental.count", param);
	}

	public ArrayList list(RentalVO vo) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("rental.list", vo);
	}
	
	public RentalVO read(int no) throws SQLException {
		return (RentalVO)getSqlMapClient().queryForObject("rental.read", no);
	}
	
	public int insert(RentalVO vo) throws SQLException {
		return (Integer)getSqlMapClient().insert("rental.rentalinsert", vo);
	}
	
	public int update(RentalVO vo) throws SQLException {
		return getSqlMapClient().update("rental.sendMail", vo);
	}
	

}
