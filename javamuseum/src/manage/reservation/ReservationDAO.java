package manage.reservation;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;


@Repository
public class ReservationDAO extends SqlMapClientDAOSupport {

   public int count(ReservationVO param) throws SQLException {
      return (Integer)getSqlMapClient().queryForObject("reservation.count", param);
   }
   
   public ArrayList list(ReservationVO param) throws SQLException {
      return (ArrayList)getSqlMapClient().queryForList("reservation.list", param);
   }

   public int insert(ReservationVO vo) throws SQLException {
      return (Integer) getSqlMapClient().insert("reservation.insert", vo);
      
   }

   public int update(ReservationVO vo) throws SQLException {
      return getSqlMapClient().update("reservation.update", vo);
   }

   public int delete(int no) throws SQLException {
      return getSqlMapClient().delete("reservation.delete", no);
   }

   public ReservationVO read(int i) throws SQLException {
      return (ReservationVO)getSqlMapClient().queryForObject("reservation.read", i);
   }
   
   public static void main(String[] args) throws SQLException {
      ReservationDAO pd = new ReservationDAO();
      ReservationVO pv = new ReservationVO();
      	
      	pv.setMember_pk(1);
      	pv.setProgram_pk(174);
      	pv.setDate("2017-07-31");
      	pv.setTime(6);
        pd.insert(pv);
      	
//      pv.setMember_pk(1);
//      av.setName("dayeong");
//      int cnt = ad.idcheck("dayeong1234");
//      System.out.println(cnt);
      
//      HashMap m = new HashMap();
//      m.put("product_pk",1);
//      m.put("title", "테스트옵션");
//      m.put("price", 99119);
//      pd.insertOption(m);
//      ArrayList<HashMap> list = pd.listOption(99);
//      
//      for(int i=0; i<list.size(); i++) {
//         System.out.println("상품명 : " + list.get(i).get("time")+"상품명 : " + list.get(i).get("date"));
//      }
//     pd.deleteOption(9999);
      
//      pd.reviewDelete(159);
      
   }






}