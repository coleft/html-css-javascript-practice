package servlet;

import java.io.IOException;
import java.util.Collection;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@MultipartConfig(
		location = "c:/temp",
		maxFileSize = -1,
		maxRequestSize = -1,
		fileSizeThreshold = 4096
)

@WebServlet(urlPatterns = "/upload.do")
public class FileUploadServlet extends HttpServlet{
	
	String path = "C:\\Users\\7E\\git\\html-css-javascript-practice\\web-2022-08\\src\\main\\webapp\\upload\\";	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		StringBuffer info = new StringBuffer();
		info.append("<li>content type : " + req.getContentType());
		
		Collection<Part> parts = req.getParts();		
		
		for(Part p : parts) {
			
			info.append("<li> tag name : " + p.getName() );
			info.append("<li> part content type : " + p.getContentType());
			
			if(p.getHeader("Content-Disposition").contains("filename=")) {
				
				info.append("<li>file size : " + p.getSize());
				info.append("<li>file name : " + p.getSubmittedFileName());
				info.append("<hr/>");
				
				if(p.getSize()>0) {	//여기서 webApp 절대경로로 써야한다. 상대경로x. 저장은 절대경로로, 접근할 때는 상대경로로(위 필드 String)
					p.write(path + p.getSubmittedFileName());	//이게 가장 중요한 코드이다. 나머지는 곁다리다.
					p.delete();
				}
				
			}else {
				String msg = req.getParameter("msg");
				req.setAttribute("msg", msg);
			}
		}
		req.setAttribute("info", info.toString());
		
		RequestDispatcher rd = req.getRequestDispatcher("jsp/file_upload_result.jsp");
		rd.forward(req,  resp);
		
	}
	
}
