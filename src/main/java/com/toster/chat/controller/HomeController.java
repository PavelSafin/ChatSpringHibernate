package com.toster.chat.controller;

import com.toster.chat.domain.ChatMessage;
import com.toster.chat.service.MessageService;
import com.toster.chat.service.UserService;
import com.toster.chat.util.ForbiddenException;
import com.toster.chat.util.OpResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.toster.chat.domain.User;

import java.util.*;

/**
 * Handles requests for the application home page.
 */
@Controller
@Scope("session")
public class HomeController {

    private static final Logger log = LoggerFactory.getLogger(HomeController.class);
    HashMap<String, String> activeUser;

    @Autowired
    private UserService userService;

    @Autowired
    private MessageService messageService;

    @RequestMapping(value = {"/"}, method = RequestMethod.GET)
    public String index(Map<String, Object> model) {
        User user = getCurrentUser();
        activeUser = new HashMap<String, String>();
        if (user == null)
            return "redirect:/login";

        List<User> users = userService.getAllUsers();
        String friendList = "";

        for (User u : users) {
            if (!u.getEmail().equals(user.getEmail())) {
                friendList +=

                        "<div class=\"media conversation\">" +
                                "<a class=\"pull-left\" href=\"#\" onclick=\"updateChatHistory('" + u.getEmail() + "');\">" +
                                "<div class=\"media-body\">" +
                                "<h5 class=\"media-heading\">" + u.getFirstName() + " " + u.getLastName() + "</h5>" +
                                "<small>" + u.getEmail() + "</small>" +
                                "</div>" +
                                "</a>" +
                                "</div>";

            }
        }

        model.put("page", "home");
        model.put("authenticated", true);
        model.put("user", user);
        model.put("friendList", friendList);

        return "home";
    }

    @RequestMapping(value = {"home"}, method = RequestMethod.GET)
    public String home(Map<String, Object> model) {
        return "redirect:/";
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register(Model model) {
        model.addAttribute(new User());
        return "redirect:/profile/new";
    }


    @RequestMapping(value = "/postMessageAJAX.json", method = RequestMethod.POST)
    @Secured("ROLE_USER")
    public
    @ResponseBody
    OpResult postChatMessage(@RequestParam(value = "text") String text) {
        User user = getCurrentUser();
        if (user == null) {
            throw new ForbiddenException();
        }

        ChatMessage chatMessage = new ChatMessage(text, user, activeUser.get(getCurrentUser().getEmail()));
        messageService.addMessage(chatMessage);
        return new OpResult(OpResult.Status.SUCCESS);
    }

    @RequestMapping(value = "/loadChatHistoryAJAX.json", method = RequestMethod.GET)
    public
    @ResponseBody
    OpResult loadChatHistory(@RequestParam(value = "sender") String email) {

        if (!email.equals("nope"))
            activeUser.put(getCurrentUser().getEmail(), email);

        StringBuilder chatHistory = messageService.fetchChatHistory(0, getCurrentUser().getEmail(), activeUser.get(getCurrentUser().getEmail()));

        OpResult result = new OpResult(OpResult.Status.SUCCESS, "", chatHistory.toString());
        return result;
    }


    private User getCurrentUser() {
        String currentUser = SecurityContextHolder.getContext().getAuthentication().getName();
        return userService.findUserByEmail(currentUser);

    }
}
