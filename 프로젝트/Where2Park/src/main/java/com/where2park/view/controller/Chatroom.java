package com.where2park.view.controller;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.where2park.biz.chat.ChatVO;

public class Chatroom {
	private Set<WebSocketSession> sessions = new HashSet<>();
	
	public static ChatVO createChatroom(int chatroom_id) {
		ChatVO chatroom = new ChatVO();
		chatroom.setChatroom_id(chatroom_id);
		return chatroom;
	} //채팅방이 열리면 채팅방 객체를 생성해서 리턴
	
	public void handleChatroom (WebSocketSession session, TextMessage message) throws IOException {
		sessions.add(session);
		System.out.println("세션추가.........");
		sendChat(message);
	}
	
	private void sendChat(TextMessage message) throws IOException {
		System.out.println("메세지를 세션에 뿌리는중.......");
		for(WebSocketSession sess : sessions) {
			sess.sendMessage(message);
		}
		
	}
}
