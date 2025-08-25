package com.fastcampus.ch2.controller.login;

import com.fastcampus.ch2.dto.UserDto;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/signup")
@Controller
public class SignUpCon {

    // getSignUp
    @GetMapping
    public String getSignUp() {

        System.out.println("[Get] SignUpCon");

        return "signupForm";
    }

    // PostSignUp
    @PostMapping
    public String postSignUp(String id, String pwd, String name, UserDto userDto, Model model) {

        System.out.println("[Post] SignUpCon");

        // userDto가 null인지 검사
        if (userDto == null) {

            System.out.println("[Post] UserDto is null");
            return "redirect:/login";
        }

        System.out.println("[Post] SignUpCon: 회원가입 완료!!!");
        System.out.println("회원가입 아이디 : " + id);
        System.out.println("회원가입 비밀번호 : " + pwd);
        System.out.println("회원가입 유저이름: " + name);

        // model에 담아서 전송
        model.addAttribute("id", userDto.getId());
        model.addAttribute("pwd", userDto.getPwd());
        model.addAttribute("name", userDto.getName());


        System.out.println("[Post] SignUpCon: 회원가입 완료!!!");
        System.out.println("회원가입 정보 : " + userDto.getUserId());
        System.out.println("회원가입 아이디 : " + userDto.getId());
        System.out.println("회원가입 비밀번호 : " + userDto.getPwd());
        System.out.println("회원가입 유저이름: " + userDto.getName());

        return "redirect:/board";
    }
}
