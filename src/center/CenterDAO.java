package center;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CenterDAO {
	
	private Connection con;
	public CenterDAO() {
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
	
	public void insert(CenterDTO dto) {
		PreparedStatement ps;
		String sql="INSERT INTO lol_center VALUES(lol_center_seq.nextval,?,?,?,?,?,?,?)";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getNickname());
			ps.setString(2, dto.getSubject());
			ps.setString(3, dto.getContent());
			ps.setString(4, dto.getWriteTime());
			ps.setString(5, dto.getFileName());
			ps.setInt(6, dto.getHit());
			ps.setString(7, dto.getEmail());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public CenterDTO selectNum(int num) {
		PreparedStatement ps;
		ResultSet rs;
		String sql = "SELECT * FROM lol_center WHERE num=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			if(rs.next()) {
				CenterDTO dto = new CenterDTO();
				dto.setNum(rs.getInt("num"));
				dto.setNickname(rs.getString("nickname"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setWriteTime(rs.getString("writeTime"));
				dto.setFileName(rs.getString("fileName"));
				dto.setHit(rs.getInt("hit"));
				dto.setEmail(rs.getString("email"));
				return dto;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	public void modify(CenterDTO dto) {
		PreparedStatement ps;
	
		String sql = "UPDATE lol_center set nickname=?, subject=?, content=?, fileName=?, hit=?  WHERE num=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getNickname());
			ps.setString(2, dto.getSubject());
			ps.setString(3, dto.getContent());
			ps.setString(4, dto.getFileName());
			ps.setInt(5, dto.getHit());
			ps.setInt(6, dto.getNum());
			ps.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	public void delete(CenterDTO dto) {
		PreparedStatement ps;
		String sql = "DELETE FROM lol_center WHERE num=?";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, dto.getNum());
			ps.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public  ArrayList<CenterDTO> selectAll() {
		PreparedStatement ps;
		ResultSet rs;
		String sql = "SELECT * FROM lol_center ORDER BY num DESC";
		ArrayList<CenterDTO> list = new ArrayList<CenterDTO>();
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				CenterDTO dto = new CenterDTO();
				dto.setNum(rs.getInt("num"));
				dto.setNickname(rs.getString("nickname"));
				dto.setSubject(rs.getString("subject"));
				dto.setWriteTime(rs.getString("writeTime"));
				dto.setHit(rs.getInt("hit"));
				dto.setEmail(rs.getString("email"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public  ArrayList<CenterDTO> search(String find, String data) {
		PreparedStatement ps;
		ResultSet rs;
		String sql = "";
		ArrayList<CenterDTO> list = new ArrayList<CenterDTO>();
		
		if(find.equals("subject"))
			sql = "SELECT * FROM lol_center WHERE subject LIKE ? ORDER BY num DESC";
		else if(find.equals("content"))
			sql = "SELECT * FROM lol_center WHERE content LIKE ? ORDER BY num DESC";
		else
			sql = "SELECT * FROM lol_center WHERE id LIKE ? ORDER BY num DESC";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, "%"+data+"%");
			rs = ps.executeQuery();
			while(rs.next()) {
				CenterDTO dto = new CenterDTO();
				dto.setNum(rs.getInt("num"));
				dto.setNickname(rs.getString("nickname"));
				dto.setSubject(rs.getString("subject"));
				dto.setWriteTime(rs.getString("writeTime"));
				dto.setHit(rs.getInt("hit"));
				dto.setEmail(rs.getString("email"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
