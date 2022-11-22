package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import org.json.simple.JSONArray;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import member.MemberDao;

@WebServlet(urlPatterns = "/memberServlet.do")
public class MemberServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String job = req.getParameter("job");
		
		select(req, resp);
		//view(req,resp);
		//delete(req, resp);
		
	}
	
	protected void select(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String findStr = req.getParameter("findStr");
		MemberDao dao = new MemberDao();
		JSONArray array = dao.select(findStr);
		
		PrintWriter out = resp.getWriter();	//스크립틀릿의 out이 이거야
		out.print(array.toJSONString());//포워딩 안하고 바로 날려
				
	}	
}




