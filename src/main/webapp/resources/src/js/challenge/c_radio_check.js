/*라디오 체크박스  */
function radio_click(obj) {

    document.querySelector('.c_complain_modal_submit').removeAttribute('disabled');

}


function radio_cancle_click(obj) {
    cancleButton = document.querySelector('.c_complain_modal_submit');
    cancleButton.disabled = 'disabled';
}