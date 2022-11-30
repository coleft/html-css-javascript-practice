package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@MultipartConfig(
		
		location = "c:/temp",
		maxFileSize = 1024*1024*50, /* 50Mb */
		maxRequestSize = -1,
		fileSizeThreshold = 1024*1024*1 /* 1Mb가 넘어가면 메모리에 저장하지 않고 임시 디렉토리에 저장하시오*/

)

@WebServlet(urlPatterns = "/jquery/ajaxFileUpload.do")//혹은 form에서 ../추가
public class AjaxFileUploadServlet extends HttpServlet{
	
	String path = "C:\\Users\\7E\\git\\html-css-javascript-practice\\web-2022-08\\src\\main\\webapp\\upload\\";
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		PrintWriter out = resp.getWriter(); // JSON type이기 때문에
		JSONObject obj = new JSONObject();
		JSONArray array = new JSONArray();
		
		//일반태그의 값
		String id = req.getParameter("id");
		
		//파일 업로드
		Collection<Part> parts = req.getParts();	//@MultipartConif가 지는 내용 즉 file태그에 관한 정보를 저장하겠다.
		for(Part p : parts) {
			if(p.getHeader("Content-Disposition").contains("filename=")) {
				
					
				String oriFile = p.getSubmittedFileName();
				p.write(path + oriFile);
				p.delete();
				array.add(oriFile);
					
				
			}
		}
		
		//결과물을 JSON으로 반환
		
		obj.put("att", array);	//첨부파일명
		obj.put("id", id);
		obj.put("msg", "서버가 잘 작동되고 있음");	
		out.print(obj.toJSONString());
		
	}
}












