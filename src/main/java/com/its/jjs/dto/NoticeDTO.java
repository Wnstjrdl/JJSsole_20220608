package com.its.jjs.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;

@Data
public class NoticeDTO {
   private Long id;
private String noticeTitle;
   private String noticeWriter;
  private String noticeContents;
      private  int noticeHits;
   private Timestamp noticeCreatedDate;
    private MultipartFile noticeFile;
    private String  noticeFileName;


}
