package com.iruri.ex.security;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.iruri.ex.vo.IUserVO;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
public class AuthCheckController {

    @GetMapping("/auth/loginCheck")
    public String authLoginCheck(@RequestParam("userId") int userId, @CurrentUser IUserVO vo) {

        if(userId == vo.getUserId()) {
            String btns = "<button class=\"c_myCertify_modal_submit2\" onclick=\"certify_details_modal('modify')\">수정</button>\r\n"
                    + "                    <button class=\"c_myCertify_modal_submit3\" onclick=\"certify_details_modal('delete')\">삭제</button>";
            
            return btns;
        }
        
        return "";
    }
}
