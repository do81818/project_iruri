/*라디오 체크박스*/
//하나 선택해야 버튼 활성화 
function radio_click(obj) {

    document.querySelector('.c_complain_modal_submit').removeAttribute('disabled');

}

//submit하고 나갔다 들어오면 버튼 비활성화 되어있기
function radio_cancle_click(obj) {
    cancleButton = document.querySelector('.c_complain_modal_submit');
    cancleButton.disabled = 'disabled';
}