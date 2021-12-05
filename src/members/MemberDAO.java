package members;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDAO {
	
	private Connection con;
	public MemberDAO() {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "oracle";
		String password = "oracle";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public MemberDTO selectEmail(String email) {
		PreparedStatement ps;
		ResultSet rs;
		String sql = "SELECT * FROM lol_member WHERE email=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, email);
			rs = ps.executeQuery();
			if(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setEmail(rs.getString("email"));
				dto.setUsername(rs.getString("username"));
				dto.setNickname(rs.getString("nickname"));
				dto.setPass(rs.getString("pass"));
				return dto;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public MemberDTO selectNickname(String nickname) {
		PreparedStatement ps;
		ResultSet rs;
		String sql = "SELECT * FROM lol_member WHERE nickname=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, nickname);
			rs = ps.executeQuery();
			if(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setEmail(rs.getString("email"));
				dto.setUsername(rs.getString("username"));
				dto.setNickname(rs.getString("nickname"));
				dto.setPass(rs.getString("pass"));
				return dto;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void insert(MemberDTO dto) {
		PreparedStatement ps;
		String sql="INSERT INTO lol_member VALUES(?,?,?,?)";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getEmail());
			ps.setString(2, dto.getUsername());
			ps.setString(3, dto.getNickname());
			ps.setString(4, dto.getPass());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	public  ArrayList<MemberDTO> selectAll() {
		PreparedStatement ps;
		ResultSet rs;
		String sql = "SELECT * FROM lol_member";
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setEmail(rs.getString("email"));
				dto.setUsername(rs.getString("username"));
				dto.setNickname(rs.getString("nickname"));
				dto.setPass(rs.getString("pass"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public void update(MemberDTO news) {
		PreparedStatement ps;
	
		String sql = "UPDATE lol_member set username=?, nickname=?, pass=? WHERE email=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, news.getUsername());
			ps.setString(2, news.getNickname());
			ps.setString(3, news.getPass());
			ps.setString(4, news.getEmail());
			ps.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void delete(String email) {
		PreparedStatement ps;
		String sql = "DELETE FROM lol_member WHERE email=?";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ps.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
