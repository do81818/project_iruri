package com.iruri.ex.security;

import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.iruri.ex.mapper.IUserMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class UserRegService {

        @Autowired
        IUserMapper iUserMapper;
        @Autowired
        private JavaMailSender mailSender;
    
        public int userEmailCheck(String userEmail) {
            String pattern = "^[0-9a-zA-Z]([_]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$";
            Boolean regex = Pattern.matches(pattern, userEmail);
            
            if(regex == false) {
                return -1;
            }
            
            return iUserMapper.checkOverEmail(userEmail);
        }

        public int mailSend(String userEmail) {
            Random random = new Random();
            int checkNum = random.nextInt(8888) + 1111;
            
            String setForm = "do81818@naver.com";
            String toMail = "do81818@naver.com"; // 원래대로라면 Ajax를 통해 클라이언트에서 넘겨받은 유저 이메일 입력
            String title = "이루리 회원가입 인증 이메일 입니다.";
            String content = "<p>인증 번호는 " + checkNum + " 입니다</p>";
            
            try {
                MimeMessage message = mailSender.createMimeMessage();
                MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
                helper.setFrom(setForm);
                helper.setTo(toMail);
                helper.setSubject(title);
                helper.setText(content, true);
                mailSender.send(message);
                
            } catch(Exception e) {
                e.printStackTrace();
            }
            
            return checkNum;
        }
        
        public int userPasswordCheck(String userPassword) {
            Pattern numPattern = Pattern.compile("[0-9]");
            Pattern engPattern = Pattern.compile("[a-z]");
            Pattern spePattern = Pattern.compile("[`~!@@#$%^&*|₩₩₩'₩\";:₩/?]");
            
            Matcher numMatch = numPattern.matcher(userPassword);
            Matcher engMatch = engPattern.matcher(userPassword);
            Matcher speMatch = spePattern.matcher(userPassword);
            Matcher spaceMatch = Pattern.compile("\s").matcher(userPassword);
            
            int numCount = 0;
            int engCount = 0;
            int speCount = 0;
            
            while(numMatch.find()) {
                numCount++;
            }
            while(engMatch.find()) {
                engCount++;
            }
            while(speMatch.find()) {
                speCount++;
            }
            
            if(userPassword.length() == 0) { // 값이 없을때
                return 0; 
            } else if(userPassword.length() < 8 || userPassword.length() > 16) { // 문자 길이
                return 1; 
            } else if (spaceMatch.find()) { // 공백 포함
                return 2; 
            } else if ( (numCount == 0 && engCount == 0) || (engCount == 0 && speCount == 0) || (speCount == 0 && numCount == 0)) { // 문자 혼합
                return 3; 
            }
            
            return 4; // 올바른 값
        }
        
        public int userNicknameCheck(String userNickname) {
            String pattern = "^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|]{0,10}$";
            Boolean regex = Pattern.matches(pattern, userNickname);
            
            if(userNickname == "") { // 공백
                return 3;
            } else if(regex == false) { // 문자열 초과 및 양식 오류
                return 2;
            } else if(iUserMapper.checkOverNickname(userNickname) == 1) { // 중복체크
                return 1;
            } else {
                return 0;
            }            
        }

        public int userPhoneCheck(String userPhone) {
            String pattern = "[-_.`~!@@#$%^&*|₩₩₩'₩\\\";:₩/?]*";
            Boolean regex = Pattern.matches(pattern, userPhone);
            
            if(userPhone == "") {
                return 2;
            } else if(regex == true) {
                return 1;                
            } else {
                return 0;                
            }
            
        }
}
