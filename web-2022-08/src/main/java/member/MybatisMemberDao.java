package member;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import jdbc.DBConn;
import mybatis.MyFactory;
import servlet.FileUploadServlet;
import servlet.MemberFileUploadServlet;
import servlet.MybatisMemberFileUploadServlet;
	
public class MybatisMemberDao {
	SqlSession sqlSession;
	MybatisPageVo pVo;
	
	public MybatisMemberDao() {
		sqlSession = MyFactory.getFactory().openSession();	//DBConn만드는 거랑 똑같은 작업
	}
	
	public String insert(MemberVo vo) {
		String msg = "화이팅~~~";
		int cnt = 0;		
		try {
			cnt = sqlSession.insert("member.insert", vo);
			
			if(cnt>0) {
				
				msg = "저장 성공!!!";
				sqlSession.commit();
				
			}else {
				
				msg = "저장중 오류 발생!!!";
				sqlSession.rollback();
				
			}
			
		}catch(Exception ex) {
			
			ex.printStackTrace();
		}		
		
		return msg;
	}
	
	public List<MemberVo> select(MybatisPageVo pVo) {
		List<MemberVo> list = null;
		
		// 1) 검색어에 해당하는 데이터 개수(totSize)
		int totSize = sqlSession.selectOne("member.tot_size", pVo.getFindStr());
		
		// 2) page계산
		pVo.setTotSize(totSize);
		pVo.compute();
		this.pVo = pVo;
		
		// 3) select
		list = sqlSession.selectList("member.select", pVo);
		
		sqlSession.close();
		return list;
	}
	
	public MemberVo view(String id) {
		MemberVo bVo = null;	
		bVo = sqlSession.selectOne("member.view", id);
	
		sqlSession.close();
		return bVo;
	}
	
	public String update(MemberVo vo) {
		String msg = "";	
		int cnt = sqlSession.update("member.update", vo);
		if(cnt>0) {
			sqlSession.commit();
		}else {	//Exception에 관한 처리 여러분이 하세요
			msg = "수정중 오류발생";
			sqlSession.rollback();
		}
		return msg;
	}

	public String delete(String id, String delFile) {
		String msg = "삭제됨...";
		int cnt = sqlSession.delete("member.delete", id);
		if(cnt>0) {
			sqlSession.commit();
			File file = new File(MybatisMemberFileUploadServlet.path+delFile);
			if(file.exists()) file.delete();
		}else {
			sqlSession.rollback();
		}
		return msg;
	}

	public MybatisPageVo getpVo() {
		return pVo;
	}	
	
}
