package com.toster.chat.dao;

import com.toster.chat.domain.User;

import java.util.List;

public interface UserDao {
    public User getUser(Long userId);
    public User save(User user);
    public List<User> getAllUsers();
    public void delete(Long userId);
    public User findUserByEmail(String email);
}
