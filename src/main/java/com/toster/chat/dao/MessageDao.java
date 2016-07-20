package com.toster.chat.dao;

import com.toster.chat.domain.ChatMessage;

import java.util.List;

public interface MessageDao {
    public ChatMessage getMessage(Long messageId);

    public void addMessage(ChatMessage message);

    public List<ChatMessage> getRecentMessages(int limit, String email1, String email2);
}
