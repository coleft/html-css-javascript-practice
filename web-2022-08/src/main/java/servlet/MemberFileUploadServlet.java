package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.Date;

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

@MultipartConfig(
		location = "c:/temp",
		maxFileSize = -1,
		maxRequestSize = -1,
		fileSizeThreshold = 4096
)

@WebServlet(urlPatterns = "/memberUpload.do")
public class MemberFileUploadServlet extends HttpServlet{
	
	public static String path = "C:\\Users\\7E\\git\\html-css-javascript-practice\\web-2022-08\\src\\main\\webapp\\upload\\";	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		MemberVo vo = new MemberVo();
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
			}else {
				
				String tag = p.getName();
				String value = req.getParameter(tag);
				//req.setAttribute(tag, value);
				switch(tag) {
				case "id" : 
					vo.setId(value);
					break;
				case "name" :
					vo.setName(value);
					break;
				case "phone" :
					vo.setPhone(value);
					break;
				case "gender" :
					vo.setGender(value);
					break;
				
					
				}
				
			}
		}
		
		MemberDao dao = new MemberDao();
		String msg = dao.insert(vo);
		
		req.setAttribute("msg", msg);
		RequestDispatcher rd = req.getRequestDispatcher("member/member_insert_result.jsp");
		rd.include(req,  resp);
	
	}
	
	public void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberVo vo = new MemberVo();		
		
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
				
			}else {
				
				String tag = p.getName();
				String value = req.getParameter(tag);
				switch(tag) {
				case "id" : 
					vo.setId(value);
					break;
				case "name" :
					vo.setName(value);
					break;
				case "phone" :
					vo.setPhone(value);
					break;
				case "gender" :
					vo.setGender(value);
					break;
				case "delFile" :
					vo.setDelFile(value);
					break;
				}
				
			}
		}
		
		MemberDao dao = new MemberDao();
		String msg = dao.update(vo);
		
		PrintWriter out = resp.getWriter();
		out.print(msg);
	}
	
}
