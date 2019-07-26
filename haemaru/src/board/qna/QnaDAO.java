package board.qna;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;
import board.qna.*;

@Repository
public class QnaDAO extends SqlMapClientDAOSupport {

	/**
	 * 총글수 구하기
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int count(QnaVO vo) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("qna.count", vo);
	}

	/**
	 * 목록 조회
	 * @param vo
	 * @return ArrayList
	 * @throws SQLException
	 */
	public ArrayList list(QnaVO vo) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("qna.list", vo);
	}

	/**
	 * 게시글 저장 [게시글 저장 후 게시글의 번호를 가져옴]
	 * @param vo ProductVO
	 * @return no Integer
	 * @throws SQLException
	 */
	public int insert(QnaVO vo) throws SQLException {
		return (Integer)getSqlMapClient().insert("qna.insert",vo);
	}

	/**
	 * 수정
	 * @param vo
	 * @throws SQLException
	 */
	public int update(QnaVO vo) throws SQLException {
		return getSqlMapClient().update("qna.update", vo);
	}
	

	/**
	 * 상세 (readno 수정을 위해 테이블명 필요)
	 * @param vo
	 * @param userCon(조회수)
	 * @return
	 * @throws SQLException
	 */
	public QnaVO read(QnaVO no) throws SQLException {
		return (QnaVO)getSqlMapClient().queryForObject("qna.read", no);
	}

	/**
	 * 삭제
	 * @param vo
	 * @throws SQLException
	 */
	public int delete(QnaVO vo) throws SQLException {
		return getSqlMapClient().delete("qna.delete", vo);
	}
	
	public ArrayList<QnaReplyVO> replylist(int qna_no) throws SQLException {
		return (ArrayList<QnaReplyVO>)getSqlMapClient().queryForList("qna.replylist", qna_no);
	}
	
	public void replyInsert(QnaReplyVO vo) throws Exception{
		getSqlMapClient().insert("qna.replyInsert", vo);
	}
	
	public void replyDelete(int no) throws SQLException {
		getSqlMapClient().delete("qna.replyDelete", no);
	}
	
	

	
	/**
	 * 메인목록 조회
	 * @param tablename 테이블명
	 * @param number 로우수
	 * @return ArrayList
	 * @throws SQLException
	 */
	public ArrayList mainList(QnaVO vo) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("qna.mainList", vo);
	}
	
	public static void main(String[] args) throws SQLException {
		QnaDAO dao = new QnaDAO();
		QnaVO vo = new QnaVO();
		
	}
}
