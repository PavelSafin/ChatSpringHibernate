package com.toster.chat.domain;

import javax.persistence.*;
import java.util.Date;

@NamedQueries({
        @NamedQuery(
                name = "fetchRecentMessages",
                query = "from ChatMessage m where (m.sender = :email1 and " +
                        "m.recipient = :email2) or (m.sender = :email2 and m.recipient = :email1) order by m.timestamp desc"
        )
})
@Entity
@Table(name = "messages")
public class ChatMessage {
    @Id
    @GeneratedValue
    @Column(name = "id")
    private Long id;

    @Column(name = "message", nullable = false)
    private String message;

    @Column(name = "timestamp", nullable = false)
    private Date timestamp;

    @ManyToOne
    @JoinColumn(name = "author_id")
    private User author;

    @Column(name = "sender")
    private String sender;

    @Column(name = "recipient")
    private String recipient;

    public ChatMessage() {
    }

    public ChatMessage(String message, User author, String email) {

        this.message = message;
        this.timestamp = new Date();
        this.author = author;
        this.recipient = email;
        this.sender = author.getEmail();
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Date getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Date timestamp) {
        this.timestamp = timestamp;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public String getRecipient() {
        return recipient;
    }

    public void setRecipient(String recipient) {
        this.recipient = recipient;
    }

    @Override
    public String toString() {
        return String.format("id:%d message:%s timestamp:%s author:%s",
                id, message, timestamp, author);
    }
}
