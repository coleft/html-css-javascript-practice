package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import crypto.AES;


public class Login {
	
	DBConn Connection;
	
	public boolean login(String mId, String pwd) {
		boolean b = false;
		try {
			Connection conn = new DBConn("mydb").getConn();
			
			AES aes = new AES();
			
			String sql = "select * from student where id = ? and pwd = ? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, mId);
			ps.setString(2, aes.encrypt(pwd));
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				//if(mId.equals(rs.getString("id"))&&aes.encrypt(pwd).equals(rs.getString("pwd"))) {
					b = true;
				//}
			}
			ps.close();
			conn.close();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return b;
	}
}
