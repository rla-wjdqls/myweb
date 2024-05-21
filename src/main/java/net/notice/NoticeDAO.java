package net.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import net.bbs.BbsDTO;
import net.utility.DBClose;
import net.utility.DBOpen;

public class NoticeDAO { // Data Access Object 
						 //데이터베이스 비지니스 로직 구현
	
	private DBOpen dbopen = null;
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuilder sql = null;
	
	
	public NoticeDAO() {
		dbopen = new DBOpen();
	}//end

	public int create(NoticeDTO dto) {
		int cnt =0;
		try {
			con = dbopen.getconnection(); // 오라클 데이터베이스 연결

			sql = new StringBuilder();
			sql.append(" INSERT INTO tb_notice(noticeno, subject, content) ");
			sql.append(" VALUES(noticeno_seq.nextval, ?, ?) ");

			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getContent());

			cnt = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("행 추가 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt);
		} // end
		return cnt;
	}//create() end
	
	public ArrayList<NoticeDTO> list() {
		ArrayList<NoticeDTO> list = null;

		try {
			con = dbopen.getconnection();

			sql = new StringBuilder();
			sql.append(" SELECT noticeno, subject, regdt ");
			sql.append(" FROM tb_notice ");
			sql.append(" ORDER BY noticeno DESC ");

			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				list = new ArrayList<NoticeDTO>();
				do {
					// rs 커서가 가리키는 한 줄을 dto에 저장
					NoticeDTO dto = new NoticeDTO();
					
					dto.setNoticeno(rs.getInt("noticeno"));
					dto.setSubject(rs.getString("subject"));
					dto.setRegdt(rs.getString("regdt"));
							
					list.add(dto); // list에 저장
				} while (rs.next());
			} else {
				list = null;
			} // if end
		} catch (Exception e) {
			System.out.println("목록실패: " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		} // end

		return list;

	}// list() end
	
	
	
	public NoticeDTO read(int noticeno) {
		NoticeDTO dto = null;

		try {
			con = dbopen.getconnection();

			sql = new StringBuilder();
			sql.append(" SELECT noticeno, subject, content, regdt ");
			sql.append(" FROM tb_notice ");
			sql.append(" WHERE noticeno=? ");

			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, noticeno);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new NoticeDTO();

				dto.setNoticeno(rs.getInt("noticeno"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setRegdt(rs.getString("regdt"));
			} // if end

		} catch (Exception e) {
			System.out.println("상세보기 실패: " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		} // end
		return dto;

	}// read() end
	
	
	
	public int delete(NoticeDTO dto) {
		int cnt = 0;
		try {
			con = dbopen.getconnection();

			sql = new StringBuilder();
			sql.append(" DELETE FROM tb_notice ");
			sql.append(" WHERE noticeno=? ");

			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, dto.getNoticeno());

			cnt = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("삭제실패:" + e);
		} finally {
			DBClose.close(con, pstmt);
		} // end

		return cnt;

	}// delete() end
	
	
	public int updateProc(NoticeDTO dto) {
		int cnt = 0;
		try {
			con = dbopen.getconnection();

			sql = new StringBuilder();
			sql.append(" UPDATE tb_notice ");
			sql.append(" SET subject=? ");
			sql.append(" , content=? ");
			sql.append(" WHERE noticeno=? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getNoticeno());
			
			cnt = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("수정실패:" + e);
		} finally {
			DBClose.close(con, pstmt);
		} // end

		return cnt;

	}// updateProc() end
	
	
	
	
	
	
	
	
	
}//class end
