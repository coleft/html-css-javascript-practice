package chatt;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import jakarta.websocket.OnClose;
import jakarta.websocket.OnMessage;
import jakarta.websocket.OnOpen;
import jakarta.websocket.Session;
import jakarta.websocket.server.ServerEndpoint;

@ServerEndpoint("/chatting") //메타데이터 chatting 웹소켓 첨 만들 때 마지막 단어랑 같아야한다.
public class WebSocketServer {
	
	private static Set<Session> clients =
		Collections.synchronizedSet(new HashSet<Session>());	//동기화에는 두가지 있다. 1 상호배타적동기화(동시에 두개접속x):여기서나오는 코드 => 순차적으로 처리하겠다.
																// vs 2 ???동기화
	
	
	//private이 붙으면 이 클래스 안에서만 사용 가능하다. 보안! 아래 public 아무나 씀
	//static은 초기화가 안 돼. 딱 한 번만 초기화 돼. 그리고 모든 클래스에서 사용하는 공통변수이다.
	//<Session> Set에 저장하는 데이터 형식을 Session으로 고정하겠다. = 제네릭
	
	@OnOpen
	public void onOpen(Session s) {
		System.out.println("session open......");	//out:모니터 in:키보드
		clients.add(s);
	}
	
	@OnClose
	public void onClose(Session s) {
		System.out.println("session close......");
		clients.remove(s);
	}
	
	@OnMessage
	public void onMessage(String msg, Session s) throws IOException {	//void는 return이라 써도 return 안 해
		System.out.println("message : " + msg);
		for(Session ss : clients) {
			ss.getBasicRemote().sendText(msg);
		}
	}	//Session으로부터 메세지가 타고 들어온다.
		//자바는 보안 뛰어나다. 처음부터 웹, 통신을 위해 만들어짐.
}


