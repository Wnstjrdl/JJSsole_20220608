package com.its.jjs.controller;

import com.its.jjs.dto.MemberDTO;
import com.its.jjs.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

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

    //관리자 전용 화면
    @GetMapping("/admin")
    public  String adminForm(){
        return "memberPages/admin";
    }
    //회원목록 조회
    @GetMapping("/findAll")
    public  String findAll(Model model){
        List<MemberDTO> memberDTOList=memberService.findAll();
        model.addAttribute("memberList",memberDTOList);
        return  "memberPages/findAll";
    }
    //회원삭제
    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id){
        memberService.delete(id);
        return  "redirect:/member/findAll";
    }
    @GetMapping("/update")
    //회원수정 화면
    public String updateForm(@RequestParam("id") Long id, Model model){
        MemberDTO memberDTO= memberService.findById(id);
        model.addAttribute("memberUpdate",memberDTO);
        return  "memberPages/update";
    }
    //회원수정 처리
@PostMapping("/update")
    public String update(@ModelAttribute MemberDTO memberDTO){
        memberService.update(memberDTO);
    return  "redirect:/member/detail?id="+memberDTO.getId();
}
    //마이페이지
    @GetMapping("/detail")
    public  String findById(@RequestParam("id")Long id,Model model){
           MemberDTO memberDTO= memberService.findById(id);
           model.addAttribute("member",memberDTO);
                   return "memberPages/myPage";
    }
    //로그아웃
    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "index";
    }
    // 비밀번호 체크
    @GetMapping("/passwordCheck")
    public String passwordCheck(@RequestParam("id") Long id,Model model){
        MemberDTO memberDTO=memberService.findById(id);
        model.addAttribute("member",memberDTO);
        return  "memberPages/passwordCheck";
    }
    //비밀번호체크 (회원탈퇴용)
    @GetMapping("/passwordCheckDelete")
    public String passwordCheckDelete(@RequestParam("id") Long id,Model model){
        MemberDTO memberDTO=memberService.findById(id);
        model.addAttribute("member",memberDTO);
        return  "memberPages/passwordCheckDelete";
    }
    //아이디 중복체크
    @PostMapping("/duplicate-check")
    public @ResponseBody String duplicateCheck(@RequestParam("memberId") String memberId) {
        String checkResult = memberService.duplicateCheck(memberId);
        return checkResult;
    }

}
