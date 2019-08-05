package user.ticket;

import java.sql.SQLException;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;

@Repository
public class UTicketDAO extends SqlMapClientDAOSupport {

	public int insert(UTicketVO param) throws SQLException {
		return (Integer)getSqlMapClient().insert("uticket.insert", param);
	}
	
	public UTicketVO read(int no) throws SQLException {
		return (UTicketVO)getSqlMapClient().queryForObject("uticket.read", no);
	}
	
	public int cancel(UTicketVO param) throws SQLException {
		return (Integer)getSqlMapClient().update("uticket.cancel", param);
	}
	
	public void storePoint(UTicketVO param) throws SQLException {
		getSqlMapClient().update("uticket.storepoint", param);
	}
}
