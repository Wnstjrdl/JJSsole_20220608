package com.its.jjs.controller;

import com.its.jjs.dto.NoticeDTO;
import com.its.jjs.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;


@Controller
@RequestMapping("/notice")
public class NoticeController {
    @Autowired
    private NoticeService noticeService;
   // 공지 사항작성화면
    @GetMapping("/save")
    public  String saveForm() {
        return "noticePages/save";
    }
    //공지 사항 작성처리
    @PostMapping("/save")
    public  String save(@ModelAttribute NoticeDTO noticeDTO) throws IOException{
        noticeService.save(noticeDTO);
        return "redirect:/notice/paging";
    }

}
