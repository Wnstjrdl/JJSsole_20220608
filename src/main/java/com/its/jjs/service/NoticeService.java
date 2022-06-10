package com.its.jjs.service;

import com.its.jjs.dto.NoticeDTO;
import com.its.jjs.dto.PageDTO;
import com.its.jjs.repository.NoticeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class NoticeService {
    @Autowired
    private NoticeRepository noticeRepository;
    private static final int PAGE_LIMIT = 5;

    private static final int BLOCK_LIMIT = 3;

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


    public List<NoticeDTO> pagingList(int page) {
        int pagingStart = (page-1) * PAGE_LIMIT;
        Map<String, Integer> pagingParam = new HashMap<>();
        pagingParam.put("start", pagingStart);
        pagingParam.put("limit", PAGE_LIMIT);
        List<NoticeDTO> pagingList=noticeRepository.pagingList(pagingParam);
        return pagingList;
    }

    public PageDTO paging(int page) {
        int noticeCount= noticeRepository.noticeCount();

        int maxPage=(int)(Math.ceil((double)noticeCount/PAGE_LIMIT));
        int startPage=(((int)(Math.ceil((double)page/BLOCK_LIMIT)))-1)*BLOCK_LIMIT+1;
        int endPage=startPage+BLOCK_LIMIT-1;
        if(endPage>maxPage)
            endPage=maxPage;

            PageDTO paging= new PageDTO();
            paging.setPage(page);
            paging.setStartPage(startPage);
            paging.setEndPage(endPage);
            paging.setMaxPage(maxPage);
            return  paging;



    }
}
