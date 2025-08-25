package com.fastcampus.ch2.controller.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/board")
@Controller
public class BoardCon {

    // getBoard View
    @GetMapping
    public String getBoard() {

        System.out.println("=== [Get] Board View ===");
        return "board";
    }

    // getBoardDetail
    @GetMapping("/detail")
    public String getBoardDetail() {

        System.out.println("=== [Get] Board Detail ===");
        return "boardDetail";
    }
}
