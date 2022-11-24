package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class FindPwd {
	
	
	
	public String findPwd(String mId, String email) {
		String pwdR = "";
		try {
			
			Connection conn;
			
			conn = new DBConn("mydb").getConn();
			
			
			String sql = "select pwd from student where id = ? and email = ? ";
			PreparedStatement ps = conn.prepareStatement(sql);
						
			ps.setString(1, mId);
			ps.setString(2, email);
			
			ResultSet rs = ps.executeQuery();		
			
			if(rs.next()) {				
				
				pwdR = rs.getString("pwd");
				
			}
			ps.close();
			conn.close();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return pwdR;
		
	}
}
