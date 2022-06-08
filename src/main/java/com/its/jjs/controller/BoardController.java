package com.its.jjs.controller;

import com.its.jjs.dto.BoardDTO;
import com.its.jjs.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;

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

}
