// 챌린지 참여 확인 모달 //
$(function() {
    $(".c_join_button").click(function() {
        $("#c_parti_modal").fadeIn();
    });

    $(".c_parti_modal_cancle").click(function() {
        $("#c_parti_modal").fadeOut();
    });

});

// 챌린지 인증하기 모달 //
$(function() {
    $(".c_certify_button").click(function() {
        $("#c_certify_modal").fadeIn();
    });

    $("img").click(function() {
        $("#c_certify_modal").fadeOut();
    });

});


//댓글 신고하기 모달//
$(function() {
    $(".reply_complain").click(function() {
        $(".c_complain_modal").fadeIn();
    });

    $(".c_complain_modal_cancle").click(function() {
        $(".c_complain_modal").fadeOut();
    });

});

//챌린지 개설 경고 모달//
$(function() {


    $(".c_make_button").click(function() {
        $(".c_make_modal").fadeIn();
    });


    $(".c_make_modal_cancle").click(function() {
        $(".c_make_modal").fadeOut();
    });


    $("img").click(function() {
        $(".c_make_modal").fadeOut();

    });


    /*$(".c_make_modal_submit").click(function c_make_form() {
        window.open('http://localhost:8282/ex/iruri/challenge_make_form');
    });*/
    
    $(".c_make_modal_submit").click(function c_make_form() {
        location.href = 'http://localhost:8282/ex/iruri/challenge_make_form';
    });


});

/*X 누를경우 모달창 초기화(체크박스)*/
$(document).ready(function() {
    $(".c_modal_close").click(function() {
        $("form").each(function() {
            this.reset();
        });
    });
});

$(document).ready(function() {
    $(".c_make_modal_submit").click(function() {
        $("form").each(function() {
            this.reset();
        });
    });
});




//운동시작하기 모달//
$(function() {
    $(".ex_start_button").click(function() {
        $(".ex_start_modal").fadeIn();
    });

    $("img").click(function() {
        $(".ex_start_modal").fadeOut();
    });

});


//인증사진 상세 모달//
$(function() {
    $(".c_certify_img").click(function() {
        $(".c_myCertify_modal").fadeIn();
    });

    $(".c_myCertify_modal_submit").click(function() {
        $(".c_myCertify_modal").fadeOut();
    });

});


//댓글 삭제 확인 모달//
$(function() {
    $(".reply_delete").click(function() {
        $(".reply_delete_modal").fadeIn();
    });

    $(".reply_delete_modal_cancle").click(function() {
        $(".reply_delete_modal").fadeOut();
    });

});


//댓글 수정 모달//
$(function() {
    $(".reply_modify").click(function() {
        $(".reply_modify_modal").fadeIn();
    });

    $(".reply_modify_modal_cancle").click(function() {
        $(".reply_modify_modal").fadeOut();
    });

});
