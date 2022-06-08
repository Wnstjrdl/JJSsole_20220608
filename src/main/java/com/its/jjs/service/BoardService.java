package com.its.jjs.service;

import com.its.jjs.dto.BoardDTO;
import com.its.jjs.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Service
public class BoardService {
    @Autowired
private BoardRepository boardRepository;

    public void save(BoardDTO boardDTO) throws IOException {
        MultipartFile boardFile=boardDTO.getBoardFile();
        String boardFileName=boardFile.getOriginalFilename();
        boardFileName=System.currentTimeMillis()+""+boardFileName;
        boardDTO.setBoardFileName(boardFileName);
        String savePath="D:\\spring_img\\"+ boardFileName;

        if(!boardFile.isEmpty()){
            boardFile.transferTo(new File(savePath));
        }
        boardRepository.save(boardDTO);
    }
}
