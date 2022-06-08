package com.its.jjs.controller;

import com.its.jjs.dto.MemberDTO;
import com.its.jjs.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.io.IOException;

@Controller
public class MemberController {
    @Autowired
    //회원가입화면
    private MemberService memberService;
    @GetMapping("/save")
    private String saveForm(){
        return "memberPages/save";
    }
    @PostMapping("/save")
    //회원가입 처리
    public String save(@ModelAttribute MemberDTO memberDTO) throws IOException {
        memberService.save(memberDTO);
        return "memberPages/login";
    }
}
