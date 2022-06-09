package com.its.jjs.controller;

import com.its.jjs.dto.BoardDTO;
import com.its.jjs.dto.PageDTO;
import com.its.jjs.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired
    private BoardService boardService;
    //게시글 작성화면
    @GetMapping("/save")
    public  String saveForm(){
        return "boardPages/save";
    }

    //게시글 작성 화면
    @PostMapping("/save")
    public  String save(@ModelAttribute BoardDTO boardDTO) throws IOException {
        boardService.save(boardDTO);
        return "redirect:/board/paging";
    }
    //페이징 리스트
    @GetMapping("/paging")
    public  String paging(@RequestParam(value = "page",required = false,defaultValue ="1")int page, Model model){
        List<BoardDTO> boardDTOList=boardService.pagingList(page);
        PageDTO paging=boardService.paging(page);
        model.addAttribute("boardDTOList",boardDTOList);
        model.addAttribute("paging",paging);
        return "boardPages/pagingList";
    }
}
