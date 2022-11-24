package servlet;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jdbc.FindPwd;
import student.StudentDao;

@WebServlet(urlPatterns = "/FindPwd.do" )
public class FindPwdServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mId = req.getParameter("mId");
		String email = req.getParameter("email");
		
		System.out.println(mId);
		System.out.println(email);
		
		FindPwd fp = new FindPwd();
		
		String foundPwd = fp.findPwd(mId, email);		
		System.out.println(foundPwd);
		
		String url = "./SendNaverServlet2.do";
		RequestDispatcher rd = req.getRequestDispatcher(url);
		req.setAttribute("foundPwd", foundPwd);
		req.setAttribute("email", email);
		
		
		rd.forward(req, resp);
		
	}

}
