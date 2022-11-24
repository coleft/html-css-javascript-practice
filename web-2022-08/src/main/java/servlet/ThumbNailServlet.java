package servlet;

import java.awt.Graphics2D;	//Swing 따로 import함

import java.awt.image.renderable.ParameterBlock;
import java.io.File;
import java.io.IOException;
import java.util.Collection;

import javax.imageio.ImageIO;
import javax.media.jai.JAI;
import javax.media.jai.RenderedOp;

import java.awt.image.BufferedImage;

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

@WebServlet(urlPatterns = "/thumbnail.do")
public class ThumbNailServlet extends HttpServlet{
	String uploadPath = "c:/upload/";

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		StringBuffer info = new StringBuffer();
		Collection<Part> parts = req.getParts();
		if(parts == null) return;
		
		for(Part p : parts) {
			if(p.getHeader("Content-Disposition").contains("filename=")) {
				if(p.getSize()>0) {
					String uploadFile = p.getSubmittedFileName();
					
					info.append("<li>file size : " + p.getSize());
					info.append("<li>file name : " + uploadFile);
					p.write(uploadPath + uploadFile);
					p.delete();
					
					//thumbnail
					ParameterBlock pb = new ParameterBlock();
					pb.add(uploadPath + uploadFile);
					RenderedOp op = JAI.create("fileload",  pb); //상수
					
					BufferedImage bi = op.getAsBufferedImage();//원본 이미지 버퍼
					BufferedImage thumb = new BufferedImage(bi.getWidth()/3, bi.getHeight()/3, BufferedImage.TYPE_INT_ARGB);		
					
					Graphics2D g = thumb.createGraphics();
					g.drawImage(bi, 0, 0, bi.getWidth()/3, bi.getHeight()/3, null);		
					
					File file = new File(uploadPath + "thumb_" + uploadFile);
					ImageIO.write(thumb, "png", file);
					info.append("<li>thumb nail file : " + file.getName());
					info.append("<hr/>");
					
				}
			}
		}
		
		req.setAttribute("info", info);
		System.gc();//garbage collection : 파일 점유한 내용 모두 해제하기 위해 => 필수요건은 아님
		RequestDispatcher rd = req.getRequestDispatcher("thumbnail/thumbnail_result.jsp");
		rd.forward(req, resp);
		
	}
}




