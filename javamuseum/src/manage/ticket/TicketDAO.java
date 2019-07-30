package manage.ticket;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;
import manage.member.PointVO;

@Repository
public class TicketDAO extends SqlMapClientDAOSupport {

	public ArrayList list(TicketVO param) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("ticket.ticketList", param);
	}
	
	public int count(TicketVO param) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("ticket.count", param);
	}
	
	public int insert(TicketVO param) throws SQLException {
		return (Integer)getSqlMapClient().insert("ticket.insert", param);
	}
	
	public TicketVO read(int no) throws SQLException {
		return (TicketVO)getSqlMapClient().queryForObject("ticket.read", no);
	}
	
	public int update(TicketVO param) throws SQLException {
		return getSqlMapClient().update("ticket.update", param);
	}
	
	public int reserveUpdate(TicketVO param) throws SQLException {
		return getSqlMapClient().update("ticket.reserveUpdate", param);
	}
	
	public int delete(int no) throws SQLException {
		return getSqlMapClient().delete("ticket.delete", no);
	}
	
	public int memberPoint(int member_pk) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("ticket.memberpoint", member_pk);
	}
	
	public void storePoint(TicketVO param) throws SQLException {
		getSqlMapClient().update("ticket.storepoint", param);
	}
	
	public void pointComment(PointVO param) throws SQLException {
		getSqlMapClient().insert("ticket.pointcomment", param);
	}
	
	public void commentUpdate(PointVO param) throws SQLException {
		getSqlMapClient().update("ticket.commentupdate", param);
	}
	
	public ArrayList pointRead(int display_pk) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("ticket.pointread", display_pk);
	}
	
	public static void main(String[] args) throws Exception {
		TicketDAO dao = new TicketDAO();
		TicketVO vo = new TicketVO();
		
//		vo.setMember_pk(1);
//		vo.
//		dao.insert(vo);
	}
}
