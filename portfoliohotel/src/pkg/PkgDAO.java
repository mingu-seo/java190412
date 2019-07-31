package pkg;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import board.notice.NoticeVO;
import db.SqlMapClientDAOSupport;
import manage.admin.AdminDAO;
import manage.admin.AdminVO;

@Repository
public class PkgDAO extends SqlMapClientDAOSupport{
	
	/**
	 * 총글수 구하기
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int count(PkgVO vo) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("pkg.count", vo);
	}
	
	/**
	 * 목록 조회
	 * @param vo
	 * @return ArrayList
	 * @throws SQLException
	 */
	public ArrayList list(PkgVO vo) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("pkg.list", vo);
	}
	
	/**
	 * 게시글 저장 [게시글 저장 후 게시글의 번호를 가져옴]
	 * @param vo NoticeVO
	 * @return no Integer
	 * @throws SQLException
	 */
	public int insert(PkgVO vo) throws SQLException {
		return (Integer)getSqlMapClient().insert("pkg.insert",vo);
	}
	
	public PkgVO read(int no) throws SQLException {
		return (PkgVO)getSqlMapClient().queryForObject("pkg.read", no);
	}
	
	/**
	 * 관리자 수정
	 * @param vo
	 * @throws SQLException
	 */
	public int update(PkgVO vo) throws SQLException {
		return getSqlMapClient().update("pkg.update", vo);
	}
	
	/**
	 * 관리자 삭제
	 * @param no
	 * @throws SQLException
	 */
	public int delete(int no) throws SQLException {
		return getSqlMapClient().delete("pkg.delete", no);
	}
	
	public static void main(String[] args) throws Exception {
		AdminDAO ad = new AdminDAO();
		AdminVO av = new AdminVO(10);
		av.setId("test");
		int a = ad.idcheck(av);
		System.out.println(a);
	}	

}
