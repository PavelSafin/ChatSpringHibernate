package com.toster.chat.service;

import com.toster.chat.domain.ChatMessage;

import java.util.List;

public interface MessageService {
    public ChatMessage getMessage(Long messageId);

    public List<ChatMessage> getRecentMessages(int limit, String nick1, String nick2);

    public void addMessage(ChatMessage message);

    public StringBuilder fetchChatHistory(int limit, String email1, String email2);
}
