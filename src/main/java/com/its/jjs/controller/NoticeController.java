package com.its.jjs.controller;

import com.its.jjs.dto.NoticeDTO;
import com.its.jjs.dto.PageDTO;
import com.its.jjs.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;


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
    @GetMapping("/paging")
    public  String paging(@RequestParam(value = "page",required = false,defaultValue = "1")int page, Model model){
        List<NoticeDTO> noticeList= noticeService.pagingList(page);
        PageDTO paging=noticeService.paging(page);
        model.addAttribute("noticeList",noticeList);
        model.addAttribute("paging",paging);
          return "noticePages/pagingList";
    }
}
