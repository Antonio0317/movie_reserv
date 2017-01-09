package jspbook;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class ReservBeans {
	private final String ID = "root";
	private final String PW = "1234";
	
	Connection conn = null;
	PreparedStatement pstmt = null;

	/* MySQL 연결정보 */
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost/film_booking?useUnicode-true&characterEncoding=utf-8";
	
	// DB연결 메서드
	void connect() {
		try {
			Class.forName(jdbc_driver);

			conn = DriverManager.getConnection(url,ID,PW);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	void disconnect() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	// 특정 영화 삭제 메서드
	public boolean deleteDB(int id) {
		connect();
		
		String sql ="delete from reserv_info where id_film=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
		return true;
	}
	
	public boolean deleteDB_R(int id) {
		connect();
		
		String sql ="delete from reserv_info where id_resv=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
		return true;
	}
	
	public boolean deleteDB_M(String id) {
		connect();
		
		String sql ="delete from reserv_info where id_mem=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
		return true;
	}
	
	// 신규 주소록 메시지 추가 메서드
	public boolean insertDB(int p1, String p2, int p3, String p4, String p5, int p6) {
		connect();
		// sql 문자열 , gb_id 는 자동 등록 되므로 입력하지 않는다.
		Date now = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String date = format.format(now);
		
		String sql ="insert into reserv_info (id_resv, id_mem, id_film, film_name, Date, resv_date, seat_no, status) values(?,?,?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p1);
			pstmt.setString(2, p2);
			pstmt.setInt(3, p3);
			pstmt.setString(4, p4);
			pstmt.setString(5, p5);
			pstmt.setString(6, date);
			pstmt.setInt(7, p6);
			pstmt.setString(8, "-");
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
		return true;
	}
	
	// 전체 예매 목록을 가져오는 메서드
	public ArrayList<ReservInfo> getDBList(String id) {
		connect();
		ArrayList<ReservInfo> datas = new ArrayList<ReservInfo>();
		
		String sql = "select * from reserv_info where id_mem =?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				ReservInfo ri = new ReservInfo();
				
				ri.setR_id(rs.getInt(1));
				ri.setM_id(rs.getString(2));
				ri.setF_id(rs.getInt(3));
				ri.setF_name(rs.getString(4));
				ri.setF_date(rs.getString(5));
				ri.setR_date(rs.getString(6));
				ri.setSeatno(rs.getInt(7));
				ri.setStatus(rs.getString(8));
				datas.add(ri);
			}
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return datas;
	}
	
	public int Calc_resv_id () {
		connect();
		
		String sql ="select * from reserv_info";
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			int tmp=0;
			while(rs.next()) {
				if(tmp<rs.getInt(1)) {
					tmp = rs.getInt(1);
				}
			}
			return tmp+1;
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}
		finally {
			disconnect();
		}
	}
	
	public boolean updateDB(int id) {
		connect();
		String sql ="update reserv_info set status=? where id_resv=?";		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "OK");
			pstmt.setInt(2, id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
		return true;
	}
	
	public ReservInfo getDB(int id) {
		connect();
		ReservInfo ri = new ReservInfo();
		String sql = "select * from reserv_info where id_resv =?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			ri.setR_id(rs.getInt(1));
			ri.setM_id(rs.getString(2));
			ri.setF_id(rs.getInt(3));
			ri.setF_name(rs.getString(4));
			ri.setF_date(rs.getString(5));
			ri.setR_date(rs.getString(6));
			ri.setSeatno(rs.getInt(7));
			ri.setStatus(rs.getString(8));
			
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return ri;
	}
}
