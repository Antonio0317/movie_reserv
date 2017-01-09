package jspbook;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SeatBeans {
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
	
	// 특정 좌석 삭제 메서드
	public boolean deleteDB(int id) {
		connect();
		
		String sql ="delete from seat_info where id_film=?";
		
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
	
	// 특정 좌석 삭제 메서드
		public boolean updateDB_M(int id, int no) {
			connect();
			
			String sql;
			switch (no) {
				case 1:
					sql ="update seat_info set s1=? where id_film=?";
					break;
				case 2:
					sql ="update seat_info set s2=? where id_film=?";
					break;
				case 3:
					sql ="update seat_info set s3=? where id_film=?";
					break;
				case 4:
					sql ="update seat_info set s4=? where id_film=?";
					break;
				case 5:
					sql ="update seat_info set s5=? where id_film=?";
					break;
				case 6:
					sql ="update seat_info set s6=? where id_film=?";
					break;
				case 7:
					sql ="update seat_info set s7=? where id_film=?";
					break;
				case 8:
					sql ="update seat_info set s8=? where id_film=?";
					break;
				case 9:
					sql ="update seat_info set s9=? where id_film=?";
					break;
				default:
					sql ="nothing";
					break;
			}
			try {
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,1);
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
	// 신규 주소록 메시지 추가 메서드
	public boolean insertDB(SeatInfo seatinfo) {
		connect();
		// sql 문자열 , gb_id 는 자동 등록 되므로 입력하지 않는다.
				
		String sql ="insert into seat_info values(?,?,?,?,?,?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seatinfo.getS_id());
			pstmt.setInt(2, seatinfo.getF_id());
			pstmt.setInt(3, seatinfo.getS1());
			pstmt.setInt(4, seatinfo.getS2());
			pstmt.setInt(5, seatinfo.getS3());
			pstmt.setInt(6, seatinfo.getS4());
			pstmt.setInt(7, seatinfo.getS5());
			pstmt.setInt(8, seatinfo.getS6());
			pstmt.setInt(9, seatinfo.getS7());
			pstmt.setInt(10, seatinfo.getS8());
			pstmt.setInt(11, seatinfo.getS9());
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

	// 특정 주소록 게시글 가져오는 메서드
	public SeatInfo getDB(int id) {
		connect();
		
		String sql = "select * from seat_info where id_film=?";
		SeatInfo seatinfo = new SeatInfo();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			// 데이터가 하나만 있으므로 rs.next()를 한번만 실행 한다.
			rs.next();
			seatinfo.setS_id(rs.getInt(1));
			seatinfo.setF_id(rs.getInt(2));
			seatinfo.setS1(rs.getInt(3));
			seatinfo.setS2(rs.getInt(4));
			seatinfo.setS3(rs.getInt(5));
			seatinfo.setS4(rs.getInt(6));
			seatinfo.setS5(rs.getInt(7));
			seatinfo.setS6(rs.getInt(8));
			seatinfo.setS7(rs.getInt(9));
			seatinfo.setS8(rs.getInt(10));
			seatinfo.setS9(rs.getInt(11));
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return seatinfo;
	}
	
	public boolean updateDB(int no, int s_id, int value) {
		connect();
		String sql;
		try {
			switch (no) {
				case 1:
					sql ="update seat_info set s1=? where id_seat=?";
					break;
				case 2:
					sql ="update seat_info set s2=? where id_seat=?";
					break;
				case 3:
					sql ="update seat_info set s3=? where id_seat=?";
					break;
				case 4:
					sql ="update seat_info set s4=? where id_seat=?";
					break;
				case 5:
					sql ="update seat_info set s5=? where id_seat=?";
					break;
				case 6:
					sql ="update seat_info set s6=? where id_seat=?";
					break;
				case 7:
					sql ="update seat_info set s7=? where id_seat=?";
					break;
				case 8:
					sql ="update seat_info set s8=? where id_seat=?";
					break;
				case 9:
					sql ="update seat_info set s9=? where id_seat=?";
					break;
				default:
					sql ="nothing";
			}		
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, value);
			pstmt.setInt(2, s_id);
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
	
	public int remain_seat(int id) {
		connect();
		
		int i =0;
		String sql = "select * from seat_info where id_film=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			// 데이터가 하나만 있으므로 rs.next()를 한번만 실행 한다.
			rs.next();
			if(rs.getInt(3) == 1) i++;
			if(rs.getInt(4) == 1) i++;
			if(rs.getInt(5) == 1) i++;
			if(rs.getInt(6) == 1) i++;
			if(rs.getInt(7) == 1) i++;
			if(rs.getInt(8) == 1) i++;
			if(rs.getInt(9) == 1) i++;
			if(rs.getInt(10) == 1) i++;
			if(rs.getInt(11) == 1) i++;
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return i;
	}
	// 전체 주소록 목록을 가져오는 메서드
/*	public ArrayList<SeatInfo> getDBList() {
		connect();
		ArrayList<SeatInfo> datas = new ArrayList<SeatInfo>();
		
		String sql = "select * from seat_info";
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				SeatInfo seatinfo = new SeatInfo();
				
				seatinfo.setId(rs.getString(1));
				seatinfo.setName(rs.getString(2));
				seatinfo.setAge(rs.getString(3));
				seatinfo.setSeat(rs.getString(4));
				seatinfo.setDate(rs.getString(5));
				datas.add(seatinfo);
			}
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return datas;
	}*/
}
