package com.fastcampus.ch2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping
@Controller
public class MainController {

    // getIndex
    @GetMapping("/index")
    public String getIndex() {

        System.out.println("[Get] 메인 화면으로 이동한다.");
        return "index";
    }

    @GetMapping("/userInfo")
    public String getUserInfo() {

        System.out.println("[Get] 유저 화면으로 이동한다.");
        return "userInfo";
    }
}
