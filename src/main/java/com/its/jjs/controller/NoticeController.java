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
    // 공지사항 페이징 처리
    public  String paging(@RequestParam(value = "page",required = false,defaultValue = "1")int page, Model model){
        List<NoticeDTO> noticeList= noticeService.pagingList(page);
        PageDTO paging=noticeService.paging(page);
        model.addAttribute("noticeList",noticeList);
        model.addAttribute("paging",paging);
          return "noticePages/pagingList";
    }
    //공지사항 상세정보출력
    @GetMapping("/detail")

    public  String detail(@RequestParam("id")Long id,Model model,
                          @RequestParam(value = "page",required = false,defaultValue = "1")int page){
        NoticeDTO noticeDTO=noticeService.findById(id);
        model.addAttribute("notice",noticeDTO);
        model.addAttribute("page",page);
        return "noticePages/detail";
    }
    //수정화면
    @GetMapping("/update")

    public String updateForm(@RequestParam("id")Long id,Model model){
        NoticeDTO noticeDTO=noticeService.findById(id);
        model.addAttribute("noticeUpdate",noticeDTO);
        return "noticePages/update";
    }




    //수정 처리
    @PostMapping("/update")
    public String update(@ModelAttribute NoticeDTO noticeDTO){
        noticeService.update(noticeDTO);
        return "redirect:/notice/detail?id="+noticeDTO.getId();
    }

    //삭제 처리
    @GetMapping("/delete")
    public String delete(@RequestParam("id")Long id){
        noticeService.delete(id);
        return "redirect:/notice/paging";
    }
    //검색 기능
    @GetMapping("/search")
    public String search(@RequestParam("searchType")String searchType,
                         @RequestParam("q") String q,Model model){
        List<NoticeDTO> searchList=noticeService.search(searchType,q);
        model.addAttribute("noticeList",searchList);
          return "noticePages/list";

    }


}
