("use strict");

/*챌린지 개설 경고*/

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

function check_cancle_click(obj) {
    cancleButton = document.querySelector('.c_make_modal_submit');
    cancleButton.disabled = 'disabled';

    for (let item in agreements) {
        agreements[item] = false;
    }

}

function img_cancle_click(obj) {
    cancleButton = document.querySelector('.c_make_modal_submit');
    cancleButton.disabled = 'disabled';

    for (let item in agreements) {
        agreements[item] = false;
    }
}