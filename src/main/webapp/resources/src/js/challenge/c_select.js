/* 셀렉트박스 보이게 하기 */
$("body").on("click", "#select", function() {
    $("#ul").toggle();
});

/* 셀렉트 박스 옵션 선택 */
$("body").on("click", "#ul li", function() {
    var text = $(this).html();
    $("#select").html(text);
    $("#ul").toggle();
});

/* 셀렉트 박스 이외 선택시 보이지 않게 하기 */
$("body").on("click", function(e) {
    if ($(".select_ul").css("display") == "block") {
        if ($("#select_wrap").has(e.target).length == 0) {
            $(".select_ul").hide()
        }
    }

});