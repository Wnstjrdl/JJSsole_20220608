package com.its.jjs.controller;

import com.its.jjs.dto.MemberDTO;
import com.its.jjs.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("/member")
public class MemberController {
    @Autowired
    //회원가입화면
    private MemberService memberService;
    @GetMapping("/save")
   public String saveForm(){
        return "memberPages/save";
    }
    @PostMapping("/save")
    //회원가입 처리
    public String save(@ModelAttribute MemberDTO memberDTO) throws IOException {
        memberService.save(memberDTO);
        return "memberPages/login";
    }
    @GetMapping("/login")
    //로그인 화면
    public  String loginForm(){
        return "memberPages/login";
    }
    @PostMapping("/login")
    //로그인 처리
    public  String login(@ModelAttribute MemberDTO memberDTO, Model model, HttpSession session){
    MemberDTO loginMember=memberService.login(memberDTO);
    if(loginMember != null){
       model.addAttribute("loginMember",loginMember);
      session.setAttribute("loginMemberId",loginMember.getMemberId());
      session.setAttribute("loginId",loginMember.getId());
        return "redirect:/board/paging";
    }else {
        return  "memberPages/login";
    }
    }

}
