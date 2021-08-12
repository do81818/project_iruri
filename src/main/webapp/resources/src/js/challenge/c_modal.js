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

// 인증사진 수정 함수//
function certify_modify_modal(boardId) {
    $(".c_myCertify_modal").fadeOut();
    $("#c_certify_modify_modal").fadeIn();
}

// 인증사진 삭제 함수//
function certify_delete_modal(boardId) {
    top.window.location.reload(true);

    console.log("deleteId", boardId);
    
    $.ajax({
        url: 'http://localhost:8282/ex/ajax/deleteCertifyImgList',
        type: 'GET',
        cache: false,
        dataType: 'json',
        data: {
            boardId: boardId,
        },
        success: function(data) {
            if (data == "success") {
                console.log(data);
            }
        }
    });

    $(".c_myCertify_modal").fadeOut();
    window.opener.parent.location.reload(); // 부모창 새로고침 
    window.self.close(); // 현재 팝업 닫기 
}

//인증사진 상세 모달//
let modalBoardId;

function certify_details_modal(boardId) {

    if (boardId === 'close') {
        $(".c_myCertify_modal").fadeOut();
        return;
    }

    if (boardId === 'modify') {
        certify_modify_modal();
        return;
    }

    if (boardId === 'delete') {
        certify_delete_modal(modalBoardId);
        return;
    }

    const boardList = JSON.parse(localStorage.getItem('boardList'));

    let board = boardList.filter((item) => {
        return item.boardId === boardId;
    })[0];

    console.log(board);

    modalBoardId = board.boardId;

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
            template += `<button class="c_myCertify_modal_submit" onclick="certify_details_modal('close')">확인</button>
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
function reply_modify_func(boardId, classId) {

     $(".reply_modify_modal").fadeIn();
	
		// 댓글 수정하기 
       $('.reply_form').submit(function(e) {
           e.preventDefault();
       });
       
       $('.reply_modify_modal_submit').on('click', function(e) {
        	top.window.location.reload(true);
        	
           var boardContent2 = document.querySelector('textarea[name="reply_modify_content"]');	
			
           var formData2 = {
       		  boardId: boardId,
       		  boardContent: boardContent2.value,
       		  boardGroupId: classId
           }

           const header = $('meta[name="_csrf_header"]').attr('th:content');
           const token = $('meta[name="_csrf"]').attr('th:content');

           $.ajax({
           	url: '/ex/ajax/modifyReply',
           	type: 'POST',
           	beforeSend: function(xhr) {
           		xhr.setRequestHeader(header, token);
           	},
           	data: formData2,
           	dataType: 'json',
           	success: function(result) {
		     	getlist(1);
             }
           });
           
           window.opener.parent.location.reload(); // 부모창 새로고침 
           window.self.close(); // 현재 팝업 닫기  
           $(".reply_modify_modal").fadeOut();
           
          });                                            

	                           
    $(".reply_modify_modal_cancle").click(function() {
        $(".reply_modify_modal").fadeOut();
    });
}




//인증글 수정 모달 X 버튼//
$(function() {
    $(".c_modal_close img").click(function() {
        $("#c_certify_modify_modal").fadeOut();
    });
});