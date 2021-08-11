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

    $(".c_certify_modal_submit").click(function() {
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
function certify_details_modal(boardId) {


    if (boardId === 'close') {
        $(".c_myCertify_modal").fadeOut();
        return false;
    }

    if (boardId === 'modify') {
        $(".c_myCertify_modal").fadeOut();
        $("#c_certify_modify_modal").fadeIn();
        return false;
    }
    
    if (boardId === 'delete') {
        $(".c_myCertify_modal").fadeOut();
        return false;
    }

    const boardList = JSON.parse(localStorage.getItem('boardList'));
    let board = boardList.filter((item) => {
        return item.boardId === boardId;
    });
    board = board[0];

    console.log("board", board);

	fetch('/ex/auth/loginCheck?userId=' + board.iuserVO.userId)
	.then(data => data.text())
	.then(html => console.log(html));
	
	fetch('/ex/auth/loginCheck?userId=' + board.iuserVO.userId)
	.then(data => data.text())
	.then(btns => {
		let template = `
    	<div class="c_myCertify_modal_start">
            <div>
            	<input type="hidden" name="boardId" value="${board.boardId}">
                <div class="myCertify_img">
                    <img src="display?fileName=${board.boardFile}" alt="">
                </div>
                <div class="myCertify_myInfo">
                    <span class="myCertify_date"> ${board.boardDate} </span> <span class="myCertify_nickname"> ${board.iuserVO.userNickname} </span>
                </div>
                <div class="myCertify_title">${board.boardTitle}</div>
                <div class="myCertify_content">${board.boardContent}</div>

                <div class="modal_button">`;
        template += btns
        template +=            `<button class="c_myCertify_modal_submit" onclick="certify_details_modal('close')">확인</button>
                </div>
            </div>
        </div>

        <div class="modal_layer"></div>`;
	
	    $(".c_myCertify_modal").html(template);
	});

	    $(".c_myCertify_modal").fadeIn();

}

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



//인증글 수정 모달//
$(function() {
    $(".c_modal_close img").click(function() {
        $("#c_certify_modify_modal").fadeOut();
    });

});