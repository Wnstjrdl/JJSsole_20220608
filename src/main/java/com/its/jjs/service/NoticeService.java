package com.its.jjs.service;

import com.its.jjs.dto.NoticeDTO;
import com.its.jjs.repository.NoticeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;


@Service
public class NoticeService {
    @Autowired
    private NoticeRepository noticeRepository;

    public void save(NoticeDTO noticeDTO) throws IOException {
        MultipartFile noticeFile= noticeDTO.getNoticeFile();
        String noticeFileName= noticeFile.getOriginalFilename();
        noticeFileName=System.currentTimeMillis()+""+noticeFileName;
        noticeDTO.setNoticeFileName(noticeFileName);
        String savePath =  "D:\\spring_img\\"+noticeFileName;

        if(!noticeFile.isEmpty()){
            noticeFile.transferTo(new File(savePath));
        }
        noticeRepository.save(noticeDTO);
    }
}
