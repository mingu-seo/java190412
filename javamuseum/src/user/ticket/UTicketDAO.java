package user.ticket;

import java.sql.SQLException;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;

@Repository
public class UTicketDAO extends SqlMapClientDAOSupport {

	public int insert(UTicketVO param) throws SQLException {
		return (Integer)getSqlMapClient().insert("uticket.insert", param);
	}
}
