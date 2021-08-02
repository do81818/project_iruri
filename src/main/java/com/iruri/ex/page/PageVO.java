package com.iruri.ex.page;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageVO {
    private int startPage; //페이지 목록 시작 번호
    private int endPage; //페이지 목록 끝 번호
    private boolean prev, next; //페이지 목록 이전, 다음으로 이동 가능한 링크 표시
    
    private int total;
    private Criteria cri;

    
    public PageVO(Criteria cri, int total) {
        this.cri = cri;
        this.total = total;

        
        this.endPage = (int) (Math.ceil(cri.getPageNum() / 5.0)) * 5;
        this.startPage = this.endPage - 4; //5페이지 기준
        
        //total을 통한 endPage의 재 계산
        //페이지 목록을 9개씩 보여주는 경우
        //전체 데이터 수가 72개라고 가정하면 (9개 챌린지*8페이지)
        //페이지 목록의 끝 번호는 5가 아닌 3
        int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
        
        if(realEnd < this.endPage) {
            this.endPage = realEnd;
        }
        
        //시작 번호가 1보다 큰 경우에만 prev가 존재
        this.prev = this.startPage > 1;
        //realEnd가 끝번호(endPage)보다 큰 경우에만 존재
        this.next = this.endPage < realEnd;
    }
    
    //util
    public String makeQuery(int page) {
        UriComponents uriComponentsBuilder = UriComponentsBuilder.newInstance()
                //.queryParam("pageNum", page)
                .queryParam("pageNum", page) // pageNum=3
                .queryParam("amount", cri.getAmount()) // pageNum=3&amount=10 (URL에서 3페이지 눌렀을때)
                .queryParam("keyword", cri.getKeyword())
                .build(); // ?pageNum=3&amount=10
        
        return uriComponentsBuilder.toUriString(); // ?pageNum=3&amount=10 리턴
    }
    
}
