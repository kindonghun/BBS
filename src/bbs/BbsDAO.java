package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BbsDAO {
	private Connection conn;
	private ResultSet rs;
	public  BbsDAO() { //데이터 접근객체 (데이터를 넣고,데이터를 가져오는곳)
		try {
			String dbURL= "jdbc:mysql://localhost:3306/BBS";
			String dbID= "root";
			String dbPassword ="4556";
			Class.forName("com.mysql.jdbc.Driver");
			conn= DriverManager.getConnection(dbURL,dbID,dbPassword);
			System.out.println("Connection Success!");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate() {
		String SQL= "SELECT NEW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; //데이터베이스오류
	}
	public int getNext() {
		String SQL= "SELECT bbsID FROM BBS ORDER BY bbsID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1; // 첫번째 게시물인경우
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스오류
	}
	public int write(String bbsTitle,String userID , String bbsContent) {
		String SQL= "INSERT INTO BBS VALUES(?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1);
		
			return pstmt.executeUpdate();
			}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스오류
	}
}

