package net.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import net.utility.DBClose;
import net.utility.DBOpen;

public class MemberDAO { //

	private DBOpen dbopen = null;
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuilder sql = null;

	public MemberDAO() {
		dbopen = new DBOpen();
	}// end
	

public String loginProc(MemberDTO dto) {
	String mlevel = null;
	
	try {
		con = dbopen.getconnection();

		sql = new StringBuilder();
		sql.append(" SELECT mlevel ");
		sql.append(" FROM member ");
		sql.append(" WHERE id=? AND passwd=? ");
		sql.append(" AND mlevel IN ('A1','B1','C1','D1') ");
	
		pstmt = con.prepareStatement(sql.toString());
		pstmt.setString(1, dto.getId());
		pstmt.setString(2, dto.getPasswd());
		
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			mlevel = rs.getString("mlevel");
		}//if end
		
	} catch (Exception e) {
		System.out.println("로그인 실패 : " + e);
	} finally {
		DBClose.close(con, pstmt, rs);
	} // end
	
	return mlevel;

}//loginProc() end
	
	
	

	
	
	
	
	
	
	
	
}//class end




















