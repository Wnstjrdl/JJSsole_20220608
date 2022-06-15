package com.its.jjs.controller;

import com.its.jjs.dto.BoardDTO;
import com.its.jjs.dto.CommentDTO;
import com.its.jjs.dto.PageDTO;
import com.its.jjs.service.BoardService;
import com.its.jjs.service.CommentService;
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
    @Autowired
    private CommentService commentService;
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
    public String paging(@RequestParam(value = "page", required = false, defaultValue = "1") int page, Model model) {
        List<BoardDTO> boardList = boardService.pagingList(page);
        PageDTO paging = boardService.paging(page);
        model.addAttribute("boardList", boardList);
        model.addAttribute("paging", paging);
        return "boardPages/pagingList";
    }
    // 상세 조회
    @GetMapping("/detail")
    public  String findById(@RequestParam("id") Long id ,Model model,
                             @RequestParam(value ="page",required = false, defaultValue = "1") int page){

                 BoardDTO boardDTO=boardService.findById(id);

                 model.addAttribute("board",boardDTO);
                 model.addAttribute("paging",page);

        List<CommentDTO> commentDTOList= commentService.findAll(id);
        model.addAttribute("commentList",commentDTOList);
        return "boardPages/detail";



    }
    // 글삭제
    @GetMapping("/delete")
    public  String delete(@RequestParam("id") Long id){
        boardService.delete(id);
        return "redirect:/board/paging";

    }
    //글수정 화면
    @GetMapping("/update")
    public String updateForm(@RequestParam("id") Long id,Model model){
        BoardDTO boardDTO =boardService.findById(id);
        model.addAttribute("boardUpdate",boardDTO);
        return  "boardPages/update";
    }


    // 글 수정 처리
    @PostMapping("/update")
    public String update(@ModelAttribute BoardDTO boardDTO){
        boardService.update(boardDTO);
        return  "redirect:/board/detail?id="+boardDTO.getId();
    }
    // 검색 기능
    @GetMapping("/search")
   public  String search(@RequestParam("searchType")String searchType,
                          @RequestParam("q") String q,Model model){
      List<BoardDTO> searchList=boardService.search(searchType,q);
       model.addAttribute("boardList",searchList);
      return  "boardPages/list";
    }





}
