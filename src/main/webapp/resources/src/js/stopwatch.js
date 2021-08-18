var timeleft = 5;
var starFlag = true;
$(document).ready(function() {
    buttonEvt();
});

function init() {
    document.getElementById("time").innerHTML = "5";
}

function buttonEvt() {

    var sec = 0;
    var timer;

    // start btn
    $("#startbtn").click(function() {

        if (starFlag) {
            $(".fa").css("color", "#185abd")
            this.style.color = "#0a1931";
            starFlag = false;

            timer = setInterval(function() {

                if (timeleft == -1) {
                    document.getElementById("time").innerHTML = timeleft;
                    clearInterval(timer);
                    starFlag = true;
                    timeleft = 5;
                    init();
                    return;
                } else {
                    document.getElementById("time").innerHTML = timeleft;
                }
                timeleft -= 1;


            }, 1000);


        }
    });

    // pause btn
    $("#pausebtn").click(function() {
        if (timeleft != 0) {
            $(".fa").css("color", "#185abd")
            this.style.color = "#0a1931";
            clearInterval(timer);
            starFlag = true;
        }
    });

    // stop btn
    $("#stopbtn").click(function() {
        if (timeleft != 5) {
            $(".fa").css("color", "#185abd")
            this.style.color = "#0a1931";
            clearInterval(timer);
            starFlag = true;
            timeleft = 5;
            init();
        }
    });
}


/*
var timeleft = 5;
var downloadTimer = setInterval(function() {

    if (timeleft <= 0) {
        clearInterval(downloadTimer);
        document.getElementById("time").innerHTML = "5";
    } else {
        document.getElementById("time").innerHTML = timeleft;
    }
    timeleft -= 1;


}, 1000);*/