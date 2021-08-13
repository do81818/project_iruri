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
                    + "<button class=\"c_myCertify_modal_submit3\" onclick=\"certify_details_modal('delete')\">삭제</button>";
            
            return btns;
        }
        
        return "";
    }
    
    
    
    @GetMapping("/auth/loginReplyCheck")
    public String authLoginReplyCheck(@RequestParam("userId") int userId, @CurrentUser IUserVO vo) {

        if(vo.getAuthList().get(0).getAuthId() == 0) {
            String replyBtns = "<td class=\"blind_button\"><button class=\"reply_blind\">감추기</button>";
            
            return replyBtns;
        }
        
        if(userId == vo.getUserId()) {
            //내 댓글엔 수정, 삭제 버튼 
            String replyBtns = "<td class=\"reply_button\"><button class=\"reply_modify\">수정</button>"
                    + "<button><a class=\"reply_delete\">삭제</a></button></td>";
            
            return replyBtns;
        }else {
            //남의 댓글엔 신고버튼
            String replyBtns = "<td class=\"complain_button\"><button class=\"reply_complain\">신고</button>";
            
            return replyBtns;
        }
        
        
    }
}




