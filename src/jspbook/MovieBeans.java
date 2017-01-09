package jspbook;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MovieBeans {
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
		
		String sql ="delete from movie_info where id_film=?";
		
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
	
	// 신규 주소록 메시지 추가 메서드
	public boolean insertDB(MovieList movielist) {
		connect();
		// sql 문자열 , gb_id 는 자동 등록 되므로 입력하지 않는다.
				
		String sql ="insert into movie_info(id_film, name_film, age_phase, seat_num, Date) values(?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, movielist.getId());
			pstmt.setString(2, movielist.getName());
			pstmt.setInt(3, movielist.getAge());
			pstmt.setInt(4, movielist.getSeat());
			pstmt.setString(5, movielist.getDate());
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
	public MovieList getDB(String id) {
		connect();
		
		String sql = "select * from movie_info where id_film=?";
		MovieList movielist = new MovieList();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			// 데이터가 하나만 있으므로 rs.next()를 한번만 실행 한다.
			rs.next();
			movielist.setId(rs.getInt(1));
			movielist.setName(rs.getString(2));
			movielist.setAge(rs.getInt(3));
			movielist.setSeat(rs.getInt(4));
			movielist.setDate(rs.getString(5));
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return movielist;
	}
	
	// 전체 주소록 목록을 가져오는 메서드
	public ArrayList<MovieList> getDBList() {
		connect();
		ArrayList<MovieList> datas = new ArrayList<MovieList>();
		
		String sql = "select * from movie_info";
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				MovieList movielist = new MovieList();
				
				movielist.setId(rs.getInt(1));
				movielist.setName(rs.getString(2));
				movielist.setAge(rs.getInt(3));
				movielist.setSeat(rs.getInt(4));
				movielist.setDate(rs.getString(5));
				datas.add(movielist);
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
	
	public int Calc_movie_id () {
		connect();
		
		String sql ="select * from movie_info";
		
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
}
