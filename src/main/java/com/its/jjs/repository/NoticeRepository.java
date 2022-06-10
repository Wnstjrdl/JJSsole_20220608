package com.its.jjs.repository;

import com.its.jjs.dto.NoticeDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class NoticeRepository {
   @Autowired
    private SqlSessionTemplate sql;



    public void save(NoticeDTO noticeDTO) {sql.insert("Notice.save",noticeDTO);
   }

    public List<NoticeDTO> pagingList(Map<String, Integer> pagingParam) {
        return  sql.selectList("Notice.pagingList",pagingParam);
    }

    public int noticeCount() {
        return  sql.selectOne("Notice.count");
    }
}
