("use strict");

/*챌린지 개설 경고*/
//필수체크 다 체크해야 submit버튼 활성화 시키기 
const form = document.querySelector("#form_wrap");
const checkBoxes = document.querySelectorAll(".input_check input");
const submitButton = document.querySelector(".c_make_modal_submit");


let agreements = {
    check1: false,
    check2: false,
    check3: false
};

form.addEventListener("submit", (e) => e.preventDefault());

checkBoxes.forEach((item) => item.addEventListener("input", toggleCheckbox));

function toggleCheckbox(e) {
    const { checked, id } = e.target;
    agreements[id] = checked;
    this.parentNode.classList.toggle("active");

    toggleSubmitButton();
}


function toggleSubmitButton() {
    const { check1, check2, check3 } = agreements;
    if (check1 && check2 && check3) {
        submitButton.disabled = false;
    } else {
        submitButton.disabled = true;
    }
}

//취소 선택->모달창 나갔다 들어오면 버튼 비활성화 + 내용 초기화
function check_cancle_click(obj) {
    cancleButton = document.querySelector('.c_make_modal_submit');
    cancleButton.disabled = 'disabled';

    for (let item in agreements) {
        agreements[item] = false;
    }

}

//이미지 X 선택->모달창 나갔다 들어오면 버튼 비활성화 + 내용 초기화
function img_cancle_click(obj) {
    cancleButton = document.querySelector('.c_make_modal_submit');
    cancleButton.disabled = 'disabled';

    for (let item in agreements) {
        agreements[item] = false;
    }
}


//챌린지 개설 폼-모집인원 체크박스 선택시 텍스트박스 비활성화
function c_person_limit(form) {
    if (form.querySelector('#cb6').checked == true) {
        form.querySelector('#c_text').disabled = 'disabled';
    } else {
        form.querySelector('#c_text').disabled = false;
    }
}
