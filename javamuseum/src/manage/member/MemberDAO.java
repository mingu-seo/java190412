package manage.member;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;

@Repository
public class MemberDAO extends SqlMapClientDAOSupport {

	public int count(MemberVO param) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("member.count", param);
	}
	
	public ArrayList list(MemberVO param) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("member.list", param);
	}

	public int insert(MemberVO vo) throws SQLException {
		return (Integer) getSqlMapClient().insert("member.insert", vo);
	}

	public int update(MemberVO vo) throws SQLException {
		return getSqlMapClient().update("member.update", vo);
	}

	public int delete(int no) throws SQLException {
	return getSqlMapClient().delete("member.delete", no);
	}

	public MemberVO read(int no) throws SQLException {
		return (MemberVO)getSqlMapClient().queryForObject("member.read", no);
	}
	
	public int idcheck(MemberVO param) throws SQLException {
		return (Integer) getSqlMapClient().queryForObject("member.idcheck", param);
	}

	// 포인트관련
	public int pointcount(PointVO param) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("member.pointcount", param);
	}
	public ArrayList pointlist(PointVO param) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("member.pointlist", param);
	} 
	public int pointinsert(PointVO vo) throws SQLException {
		return (Integer) getSqlMapClient().insert("member.pointinsert", vo);
	}
	public void pointupdate(PointVO vo) throws SQLException {
		getSqlMapClient().update("member.pointupdate", vo);
	}
	public void pointuse(PointVO vo) throws SQLException {
		getSqlMapClient().update("member.pointuse", vo);
	}
}