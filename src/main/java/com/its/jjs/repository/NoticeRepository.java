package com.its.jjs.repository;

import com.its.jjs.dto.NoticeDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public void save(NoticeDTO noticeDTO) {sql.insert("Notice.save",noticeDTO);
    }
}
