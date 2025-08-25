package com.fastcampus.ch2.controller.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/login")
@Controller
public class LoginCon {

    // getLogin view
    @GetMapping
    public String getLogin() {

        System.out.println("=== [Get] Login ===");
        return "loginForm";
    }

    // postLogout
    @PostMapping
    public String getLogOut() {

        System.out.println("=== [Get] LogOut ===");
        return "";
    }
}
