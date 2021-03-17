package com.where2park.view.handler;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class WebSocketHandler extends TextWebSocketHandler {
	private List<WebSocketSession> sessions = new ArrayList<>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessions.add(session);
		System.out.println("====>웹소켓 연결");
		
	}//연결되어 있을 때 
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		for(WebSocketSession sess : sessions) {
			TextMessage msg = new TextMessage(message.getPayload());
			sess.sendMessage(msg);
		}
		System.out.println("====>메세지 전송 :" + message);
	}//메서지 전송 (접속한 모든 세션들에게 메세지를 뿌려줌)
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessions.remove(session);
		System.out.println("====>연결 종료");
	}//연결이 끊어졌을 때 
}
