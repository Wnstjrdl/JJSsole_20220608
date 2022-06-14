package com.its.jjs.service;

import com.its.jjs.dto.MemberDTO;
import com.its.jjs.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class MemberService {

    @Autowired
    private MemberRepository memberRepository;

    public void save(MemberDTO memberDTO) throws IOException {
        MultipartFile memberFile=memberDTO.getMemberFile();
        String memberFileName= memberFile.getOriginalFilename();
        memberFileName=System.currentTimeMillis()+""+memberFileName;
        memberDTO.setMemberFileName(memberFileName);
        String savePath= "D:\\spring_img\\"+memberFileName;

        if(!memberFile.isEmpty()){
            memberFile.transferTo(new File(savePath));
        }
        memberRepository.save(memberDTO);
    }

    public MemberDTO login(MemberDTO memberDTO) {
    MemberDTO loginMember=memberRepository.login(memberDTO);
    return loginMember;
    }

    public List<MemberDTO> findAll() {return memberRepository.findAll();
    }

    public void delete(Long id) {memberRepository.delete(id);
    }

    public MemberDTO findById(Long id) {
        return memberRepository.findById(id);
    }

    public void update(MemberDTO memberDTO) {memberRepository.update(memberDTO);
    }

    public String duplicateCheck(String memberId) {
        String checkResult= memberRepository.duplicateCheck(memberId);
        if(checkResult == null){
            return "ok";
        }else{
            return  "no";
        }
    }
}
