package servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import member.MemberDao;
import member.MemberVo;
import member.MybatisMemberDao;
import member.MybatisPageVo;

@MultipartConfig(
		location = "c:/temp",
		maxFileSize = -1,
		maxRequestSize = -1,
		fileSizeThreshold = 4096
)

@WebServlet(urlPatterns = "/mybatis/mmfs.do")
public class MybatisMemberFileUploadServlet extends HttpServlet{
	
	public static String path = "C:\\Users\\7E\\git\\html-css-javascript-practice\\web-2022-08\\src\\main\\webapp\\upload\\";	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		MemberVo vo = new MemberVo();
		MybatisPageVo pVo = new MybatisPageVo();
		
		String job = req.getParameter("job");
		
		if(job==null) job="";
		
		if(job.equals("update")) {
			update(req, resp);
			return;//밑으로 흘러내리지 않도록!!
		}
		
		Collection<Part> parts = req.getParts();		
		for(Part p : parts) {			
			
			if(p.getHeader("Content-Disposition").contains("filename=")) {				
				if(p.getSize()>0) {	//여기서 webApp 절대경로로 써야한다. 상대경로x. 저장은 절대경로로, 접근할 때는 상대경로로(위 필드 String)
					
					String sysFile = new Date().getTime() + "-" + p.getSubmittedFileName();
					String oriFile = p.getSubmittedFileName();
					
					vo.setSysFile(sysFile);
					vo.setOriFile(oriFile);
					
					p.write(path + sysFile);	//이게 가장 중요한 코드이다. 나머지는 곁다리다.
					p.delete();

				}
			}
		}

		vo.setId(req.getParameter("id"));
		vo.setName(req.getParameter("name"));
		vo.setPhone(req.getParameter("phone"));
		vo.setGender(req.getParameter("gender"));
		vo.setMdate(req.getParameter("mdate"));
		
		pVo.setNowPage( Integer.parseInt(req.getParameter("nowPage")));
		pVo.setFindStr(req.getParameter("findStr"));
		
		
		MybatisMemberDao dao = new MybatisMemberDao();
		String msg = dao.insert(vo);
		
		List<MemberVo> list = dao.select(pVo);
		
		req.setAttribute("msg", msg);
		req.setAttribute("list", list);
		req.setAttribute("pVo", pVo);
		
		RequestDispatcher rd = req.getRequestDispatcher("member_select.jsp");
		rd.include(req,  resp);
	
	}
	
	public void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberVo vo = new MemberVo();	
		MybatisPageVo pVo = new MybatisPageVo();
		
		Collection<Part> parts = req.getParts();		
		for(Part p : parts) {			
			
			if(p.getHeader("Content-Disposition").contains("filename=")) {				
				if(p.getSize()>0) {	//여기서 webApp 절대경로로 써야한다. 상대경로x. 저장은 절대경로로, 접근할 때는 상대경로로(위 필드 String)
					
					String sysFile = new Date().getTime() + "-" + p.getSubmittedFileName();
					String oriFile = p.getSubmittedFileName();					
					vo.setSysFile(sysFile);
					vo.setOriFile(oriFile);
					
					p.write(path + sysFile);	//이게 가장 중요한 코드이다. 나머지는 곁다리다.
					p.delete();
					
					//기존 프로필 사진 파일을 삭제
					String delFile = req.getParameter("delFile");
					File file = new File(path + delFile);
					if(file.exists()) file.delete();
					
				}
				
			}
		}

		vo.setId(req.getParameter("id"));
		vo.setName(req.getParameter("name"));
		vo.setPhone(req.getParameter("phone"));
		vo.setGender(req.getParameter("gender"));
		vo.setMdate(req.getParameter("mdate"));
		
		pVo.setNowPage( Integer.parseInt(req.getParameter("nowPage")));
		pVo.setFindStr(req.getParameter("findStr"));		
		
		MybatisMemberDao dao = new MybatisMemberDao();
		String msg = dao.update(vo);
		
		if( !msg.equals("") ) {
			PrintWriter out = resp.getWriter();
			out.print("<script>");
			out.print("  alert('" + msg + "')");
			out.print("</script>");
		}
		
		List<MemberVo> list = dao.select(pVo);
		
		req.setAttribute("msg", msg);
		req.setAttribute("list", list);
		req.setAttribute("pVo", pVo);
		
		RequestDispatcher rd = req.getRequestDispatcher("member_select.jsp");
		rd.include(req,  resp);
		
	}
	
}
