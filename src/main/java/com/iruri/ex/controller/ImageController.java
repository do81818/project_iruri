package com.iruri.ex.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class ImageController {

    public boolean checkImageType(File file) {
        
        try {
            String contentType = Files.probeContentType(file.toPath());
            
            return contentType.startsWith("image");
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        return false;
    }
    
    // http://localhost:8282/ex/iruri/display?fileName=파일이름
    @GetMapping("/iruri/display")
    @ResponseBody
    public ResponseEntity<byte[]> getFile(String fileName) {
        log.info("fileName: " + fileName);
        
        File file = new File("C:\\upload\\" + fileName);
        
        log.info("file: " + file);
        
        ResponseEntity<byte[]> result = null;
        
        try {
            HttpHeaders header = new HttpHeaders();
            
            header.add("Content-Type", Files.probeContentType(file.toPath()));
            result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return result;
    }
}










