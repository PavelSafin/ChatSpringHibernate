package com.toster.chat.service;

import com.toster.chat.domain.User;
import com.toster.chat.util.OpResult;

import java.util.List;

public interface UserService {
    public OpResult addUser(User user);

    public User getUser(Long userId);

    public OpResult saveUser(User user);

    public OpResult saveUser(User user, boolean newUser);

    public List<User> getAllUsers();

    public OpResult deleteUser(Long userId);

    public User findUserByEmail(String email);
}