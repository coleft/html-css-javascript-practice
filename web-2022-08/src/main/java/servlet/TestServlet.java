package servlet;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/servlet/sbs.kr","/servlet/mbc.kr"})	// 3
public class TestServlet extends HttpServlet{	// 1

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	//2	//request와 response임.
		String id = req.getParameter("id");
		String phone = req.getParameter("phone");
		
		System.out.println("get으로 호출됨");
		System.out.println("id : " + id);
		System.out.println("phone : " + phone);
		
		// 결과 전송
		// 만약 다른 페이지로 가려면 경로를 다른 페이지로 설정해주면 된다.
		RequestDispatcher rd = req.getRequestDispatcher("test_servlet.jsp"); //Dispatcher는 많은 설명이 필요
		rd.include(req, resp);	//spa(single)는 include로... 지금은 forward나 include 모두 괜찮다. 
		//싱글페이지로 만들면 include와 forward가 다르다. 지금은 같네.
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	//2
		String id = req.getParameter("id");
		String phone = req.getParameter("phone");
		
		System.out.println("post로 호출됨");
		System.out.println("id : " + id);
		System.out.println("phone : " + phone);
		
		RequestDispatcher rd = req.getRequestDispatcher("../index.jsp");
		rd.include(req, resp);	//url 살펴보세요. 
	}
	
}
