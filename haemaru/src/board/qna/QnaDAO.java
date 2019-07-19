package board.qna;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;

@Repository
public class QnaDAO extends SqlMapClientDAOSupport {

	/**
	 * 총글수 구하기
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int count(QnaVO vo) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("product.count", vo);
	}

	/**
	 * 목록 조회
	 * @param vo
	 * @return ArrayList
	 * @throws SQLException
	 */
	public ArrayList list(QnaVO vo) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("product.list", vo);
	}

	/**
	 * 게시글 저장 [게시글 저장 후 게시글의 번호를 가져옴]
	 * @param vo ProductVO
	 * @return no Integer
	 * @throws SQLException
	 */
	public int insert(QnaVO vo) throws SQLException {
		return (Integer)getSqlMapClient().insert("product.insert",vo);
	}

	/**
	 * 수정
	 * @param vo
	 * @throws SQLException
	 */
	public int update(QnaVO vo) throws SQLException {
		return getSqlMapClient().update("product.update", vo);
	}
	

	/**
	 * 상세 (readno 수정을 위해 테이블명 필요)
	 * @param vo
	 * @param userCon(조회수)
	 * @return
	 * @throws SQLException
	 */
	public QnaVO read(QnaVO no) throws SQLException {
		return (QnaVO)getSqlMapClient().queryForObject("product.read", no);
	}

	/**
	 * 삭제
	 * @param vo
	 * @throws SQLException
	 */
	public int delete(QnaVO vo) throws SQLException {
		return getSqlMapClient().delete("product.delete", vo);
	}

	public void insertOption(HashMap map) throws SQLException {
		getSqlMapClient().insert("product.insertOption",map);
	}
	
	public ArrayList<HashMap> listOption(int product_pk) throws SQLException {
		return (ArrayList<HashMap>)getSqlMapClient().queryForList("product.listOption", product_pk);
	}
	
	public void deleteOption(int product_pk) throws SQLException{
		getSqlMapClient().delete("product.deleteOption", product_pk);
	}
	
	public ArrayList<QnaReplyVO> reviewlist(int product_pk) throws SQLException {
		return (ArrayList<QnaReplyVO>)getSqlMapClient().queryForList("product.reviewList", product_pk);
	}
	
	public void reviewInsert(QnaReplyVO vo) throws Exception{
		getSqlMapClient().insert("product.reviewInsert", vo);
	}
	
	public void reviewDelete(int no) throws SQLException {
		getSqlMapClient().delete("product.reviewDelete", no);
	}
	
	

	
	/**
	 * 메인목록 조회
	 * @param tablename 테이블명
	 * @param number 로우수
	 * @return ArrayList
	 * @throws SQLException
	 */
	public ArrayList mainList(QnaVO vo) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("product.mainList", vo);
	}
	
	public static void main(String[] args) throws SQLException {
		QnaDAO dao = new QnaDAO();
		QnaVO vo = new QnaVO();
		
//		HashMap m = new HashMap();
//		m.put("product_pk", 268);
//		m.put("title", "옵션넣기");
//		m.put("price", 999999);
//		dao.insertOption(m);

//		ArrayList<HashMap> list = dao.listOption(268);
//		for(int i=0; i<list.size(); i++) {
//			System.out.println("상품명:"+list.get(i).get("title")+" 추가금액:"+list.get(i).get("price"));
//		}
//		
//		dao.reviewlist(1);
	}
}
