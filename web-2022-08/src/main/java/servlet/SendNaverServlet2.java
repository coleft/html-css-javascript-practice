package servlet;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import crypto.AES;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/SendNaverServlet2.do")
public class SendNaverServlet2 extends HttpServlet{
 // 메일과 연관된 변수
 String host = "smtp.naver.com"; 
 String uploadPath = "c:/upload/";
 
 @Override
 protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
   	 
	 String foundPwd = req.getAttribute("foundPwd").toString();
	 String email = req.getAttribute("email").toString();
	 AES aes = new AES();
	 foundPwd = aes.decrypt(foundPwd);
	 System.out.println(foundPwd);
	 System.out.println(email);
	 
  String sender = "statictemp9210@naver.com";
  String receiver = email;
  String subject = "비밀번호입니다.";
  String content = foundPwd;
    
  try{
   // 이메일과 관련된 자료를 캡슐화
   Properties prop = new Properties();
   prop.put("mail.smtp.starttls.enable", "true");
   prop.put("mail.smtp.host", host);
   prop.put("mail.smtp.auth","true");
   prop.put("mail.smtp.port","587");	//안되면 465로 587
   prop.put("mail.smtp.ssl.protocols", "TLSv1.2");
   
   // 메일 서버 사용자의 권한 체크(보안상 필요)
   Session pass = Session.getInstance(prop, new Authenticator() {

    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
    return new PasswordAuthentication("statictemp9210@naver.com","");
    }
   });
   
   // 보내는 메시지 켑슐화
   MimeMessage message = new MimeMessage(pass);
   message.setFrom(new InternetAddress(sender));
   message.addRecipient(Message.RecipientType.TO,new InternetAddress(receiver));
   message.setSubject(subject);
   message.setSentDate(new Date());
   message.setContent(content, "text/html;charset=utf-8");
   
   // 메일 전송
   Transport.send(message);

   
  }catch(Exception ex){

   ex.printStackTrace();
  }
  resp.sendRedirect("index.jsp?inc=member/login.jsp");   
 }
}
