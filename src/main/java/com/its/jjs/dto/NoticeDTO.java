package com.its.jjs.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;

@Data
public class NoticeDTO {
    Long id;
    String noticeTitle;
    String noticeWriter;
    String noticeContents;
    String noticeHits;
    Timestamp noticeCreatedDate;
    private MultipartFile noticeFile;
    private String noticeFileName;
}
