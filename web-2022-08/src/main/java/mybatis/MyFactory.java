package mybatis;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyFactory {

   private static SqlSessionFactory factory; //접근제한 static으로 선언한건 static블럭안에서만 처리 
   
   static {

      try {
	      Reader r = Resources.getResourceAsReader("mybatis/config.xml");//경로지정안하면 web안에 강제로(?)classis폴더 만들어서 저장해야됨
	      factory = new SqlSessionFactoryBuilder().build(r); //외워..ㅎ
      
      }catch(Exception e) {
         e.printStackTrace();
      }
      
   }
   
   public static SqlSessionFactory getFactory() { //getter만 만들어주자
      return factory;
   }
   
   public static void main(String[] args) {
	   
      //session 객체를 통해 CRUD를 실제 실행함
      SqlSession session =  MyFactory.getFactory().openSession();	//DBConn("mydb").getConn()이랑 비슷
      
      if(session==null) {
         System.out.println("환경설정을 확인해주세요");
      }else {
         System.out.println("factory가 생성되었습니다.");
      }
   }
   
   
}