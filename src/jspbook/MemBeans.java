package jspbook;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class MemBeans {
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
	
	// 수정된 회원 내용 갱신을 위한 메서드
	public boolean updateDB(String id, MemList memlist) {
		connect();
		String sql ="update mem_info set password=?, name_mem=?, age_mem=? where id_mem =?";		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memlist.getPw1());
			pstmt.setString(2, memlist.getName());
			pstmt.setInt(3, memlist.getAge());
			pstmt.setString(4, id);
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
	
	// 특정 회원 삭제 메서드
	public boolean deleteDB(String id) {
		connect();
		
		String sql ="delete from mem_info where id_mem=?";
		
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
	
	// 신규회원 가입 메시지 추가 메서드
	public boolean insertDB(MemList memlist) {
		connect();
		// sql 문자열 , gb_id 는 자동 등록 되므로 입력하지 않는다.
		String sql ="insert into mem_info(id_mem, password, name_mem, age_mem, register_date) values(?,?,?,?,?)";
		Date now = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String date = format.format(now);
		
		try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,memlist.getId());
				pstmt.setString(2,memlist.getPw1());
				pstmt.setString(3, memlist.getName());
				pstmt.setInt(4,memlist.getAge());
				pstmt.setString(5,date);
				pstmt.executeUpdate();
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
	}

	// 특정 회원을 가져오는 메서드
	public MemList getDB(String id) {
		connect();
		
		String sql = "select * from mem_info where id_mem=?";
		MemList memlist = new MemList();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			// 데이터가 하나만 있으므로 rs.next()를 한번만 실행 한다.
			rs.next();
			memlist.setId(rs.getString(1));
			memlist.setPw1(rs.getString(2));
			memlist.setName(rs.getString(3));
			memlist.setAge(rs.getInt(4));
			memlist.setDate(rs.getString(5));
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return memlist;
	}
	
	// 전체 회원 목록을 가져오는 메서드
	public ArrayList<MemList> getDBList() {
		connect();
		ArrayList<MemList> datas = new ArrayList<MemList>();
		
		String sql = "select * from mem_info order by name_mem desc";
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				MemList memlist = new MemList();
				
				memlist.setId(rs.getString(1));
				memlist.setPw1(rs.getString(2));
				memlist.setName(rs.getString(3));
				memlist.setAge(rs.getInt(4));
				memlist.setDate(rs.getString(5));
				datas.add(memlist);
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
	
	public boolean CheckUser(MemList memlist) {
		connect();
		String sql = "select * from mem_info where id_mem=?";		
		try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memlist.getId());
				ResultSet rs = pstmt.executeQuery();;
				// 데이터가 하나만 있으므로 rs.next()를 한번만 실행 한다.
				rs.next();
				if(memlist.getId().equals(rs.getString(1))) {
					if(memlist.getPw1().equals(rs.getString(2))) {
						rs.close();
						return true;
					}
					else {
						rs.close();
						return false;
					}
				}
				else{
					rs.close();
					return false;
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return true;
	}
	
	public boolean CheckId (String id) {
		connect();
		String sql = "select * from mem_info where id_mem=?";		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			// 데이터가 하나만 있으므로 rs.next()를 한번만 실행 한다.
			rs.next();
			if(id.equals(rs.getString(1))) {
				return true;
			}
			else {
				return false;
			}
		}catch (Exception e) {
			e.printStackTrace();
			disconnect();
			return false;
		}
		finally {
			disconnect();
		}
	}
	
	public boolean CheckPw (String pw1, String pw2) {
		if(pw1.equals(pw2)) {
			return true;
		}
		else {
			return false;
		}
	}
}
