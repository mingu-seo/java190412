package board.qna;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;

@Repository
public class QnaDAO extends SqlMapClientDAOSupport {
	
	public int count(QnaVO vo) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("qna.count", vo);
	}

	public ArrayList list(QnaVO vo) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("qna.list", vo);
	}

	public int insert(QnaVO vo) throws SQLException {
		return (Integer)getSqlMapClient().insert("qna.insert",vo);
	}

	public int update(QnaVO vo) throws SQLException {
		return getSqlMapClient().update("qna.update", vo);
	}
	
	public int updateReadno(QnaVO vo) throws SQLException {
		return getSqlMapClient().update("qna.updateReadno", vo);
	}

	public QnaVO read(QnaVO vo) throws SQLException {
		return (QnaVO)getSqlMapClient().queryForObject("qna.read", vo);
	}

	public int delete(QnaVO vo) throws SQLException {
		return getSqlMapClient().delete("qna.delete", vo);
	}

	public int getMaxGno() throws SQLException{
		int maxgno = (Integer)getSqlMapClient().queryForObject("qna.getMaxGno");
		return maxgno;
	}
	
	public int getMaxOno(QnaVO vo) throws SQLException{
		return (Integer)getSqlMapClient().queryForObject("qna.getMaxOno", vo);
	}
	
	public int getMinOno(QnaVO vo) throws SQLException{
		return (Integer)getSqlMapClient().queryForObject("qna.getMinOno", vo);
	}
	
	public void UpdateOno(HashMap hm) throws SQLException{
		getSqlMapClient().update("qna.updateOno", hm);
	}
	
	public static void main(String[] args) throws SQLException{
		QnaDAO dao = new QnaDAO();
		QnaVO vo = new QnaVO();
//		vo.setStype("title");
//		vo.setSval("테스트");
//		dao.count(vo);
//		int maxgno = dao.getMaxGno();
//		System.out.println(maxgno);
		vo.setOno(1);
		System.out.println(dao.getMaxOno(vo));
		
		
	}
	
	
	
}
