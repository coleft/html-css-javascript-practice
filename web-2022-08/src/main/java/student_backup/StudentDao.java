package student_backup;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jdbc.DBConn;

public class StudentDao {
	Connection conn;
	
	public StudentDao() {
		try {
			conn = new DBConn("mydb").getConn();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public boolean insert(StudentVo vo) {
		boolean b = false;
		String sql = "insert into student(id, name, phone, pwd, address, gender, zipcode, address2, email)"
					+"values(?,?,?,?,?,?,?,?,?)";
		try {
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getName());
			ps.setString(3, vo.getPhone());
			ps.setString(4, vo.getPwd());
			ps.setString(5, vo.getAddress());
			ps.setString(6, vo.getGender());
			ps.setString(7, vo.getZipcode());
			ps.setString(8, vo.getAddress2());
			ps.setString(9, vo.getEmail());	
			
			int cnt = ps.executeUpdate();
			if(cnt>0) {
				conn.commit();
				b=true;
			}
						
			ps.close();
			conn.close();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return b;
	}
	
	public List<StudentVo> select(Page pageVo){
		List<StudentVo> list = new ArrayList<StudentVo>();
		String sql = "";
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		//검색된 전체 건수
		try {
			sql = " select count(id) totSize from student "	//select에서의 검색 조건과 같아야 한다.
					+ " where id like ? "
					+ " or 	  name like ? "
					+ " or    phone like ? "
					+ " or    address like ? "
					+ " or    address2 like ? "
					+ " or    email like ? ";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + pageVo.getFindStr() + "%");
			ps.setString(2, "%" + pageVo.getFindStr() + "%");
			ps.setString(3, "%" + pageVo.getFindStr() + "%");
			ps.setString(4, "%" + pageVo.getFindStr() + "%");
			ps.setString(5, "%" + pageVo.getFindStr() + "%");
			ps.setString(6, "%" + pageVo.getFindStr() + "%");
			
			rs = ps.executeQuery();
			rs.next();
			int totSize = rs.getInt("totSize");
			pageVo.setTotSize(totSize);
			pageVo.compute();
			
			sql = " select * from student "
					+ " where id like ? "
					+ " or 	  name like ? "
					+ " or    phone like ? "
					+ " or    address like ? "
					+ " or    address2 like ? "
					+ " or    email like ? "
					+ " order by name asc "
					+ " limit ? , ? ";
		
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + pageVo.getFindStr() + "%");
			ps.setString(2, "%" + pageVo.getFindStr() + "%");
			ps.setString(3, "%" + pageVo.getFindStr() + "%");
			ps.setString(4, "%" + pageVo.getFindStr() + "%");
			ps.setString(5, "%" + pageVo.getFindStr() + "%");
			ps.setString(6, "%" + pageVo.getFindStr() + "%");
			ps.setInt(7, pageVo.getStartNo());
			ps.setInt(8, pageVo.getListSize());
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				StudentVo vo = new StudentVo();
				vo.setId(rs.getString("id"));
				vo.setName(rs.getString("name"));
				vo.setPhone(rs.getString("phone"));
				vo.setAddress(rs.getString("address"));
				vo.setAddress2(rs.getString("address2"));
				vo.setZipcode(rs.getString("zipcode"));
				vo.setGender(rs.getString("gender"));
				vo.setEmail(rs.getString("email"));
				list.add(vo);
			}
			
			ps.close();
			conn.close();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return list;
	}
	
	public StudentVo view(String id) {
		StudentVo vo = new StudentVo();
		String sql = "select * from student where id = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				vo.setId(rs.getString("id"));
				vo.setName(rs.getString("name"));
				vo.setPhone(rs.getString("phone"));
				vo.setAddress(rs.getString("address"));
				vo.setAddress2(rs.getString("address2"));
				vo.setZipcode(rs.getString("zipcode"));
				vo.setGender(rs.getString("gender"));
				vo.setEmail(rs.getString("email"));
			}
			
			ps.close();
			conn.close();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}		
		return vo;
	}
	
	public boolean modify(StudentVo vo) {
		boolean b = false;
		String sql = " update student set name = ?, gender = ?, phone = ?, "
				+ " zipcode = ?, address = ?, address2 = ?, email = ? "
				+ " where id = ? and pwd = ? ";
		
		try {
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getGender());
			ps.setString(3, vo.getPhone());
			ps.setString(4, vo.getZipcode());
			ps.setString(5, vo.getAddress());
			ps.setString(6, vo.getAddress2());
			ps.setString(7, vo.getEmail());
			ps.setString(8, vo.getId());
			ps.setString(9, vo.getPwd());
			
			int cnt = ps.executeUpdate();
			
			if(cnt>0) {
				b = true;
				conn.commit();
			}else {
				conn.rollback();
			}
			
			ps.close();
			conn.close();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return b;
	}
	
	public boolean delete(StudentVo vo) {
		boolean b = false;
		String sql = "delete from student where id = ? and pwd = ? ";
		try {
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,  vo.getId());
			ps.setString(2,  vo.getPwd());
			
			int cnt = ps.executeUpdate();
			if(cnt>0) {
				b = true;
				conn.commit();
			}else {
				conn.rollback();
			}
			
			ps.close();
			conn.close();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return b;
		
	}
	
	
}
