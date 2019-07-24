package pkg.dining;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import board.notice.NoticeVO;
import board.qna.QnaDAO;
import board.qna.QnaVO;
import db.SqlMapClientDAOSupport;

@Repository
public class PkgDiningDAO extends SqlMapClientDAOSupport{
	
	/**
	 * 총글수 구하기
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int count(PkgDiningVO vo) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("pkg_dining.count", vo);
	}
	
	/**
	 * 목록 조회
	 * @param vo
	 * @return ArrayList
	 * @throws SQLException
	 */
	public ArrayList list(PkgDiningVO vo) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("pkg_dining.list", vo);
	}

	/**
	 * 게시글 저장 [게시글 저장 후 게시글의 번호를 가져옴]
	 * @param vo NoticeVO
	 * @return no Integer
	 * @throws SQLException
	 */
	public int insert(PkgDiningVO vo) throws SQLException {
		return (Integer)getSqlMapClient().insert("pkg_dining.insert",vo);
	}
	
	public static void main(String[] args) throws Exception {
		PkgDiningDAO ad = new PkgDiningDAO();
		PkgDiningVO av = new PkgDiningVO();
	
		
	}
}
