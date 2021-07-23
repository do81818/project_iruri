$(document).ready(function() {

    $(window).scroll(function() {
        var now_position = $(document).scrollTop();
        var view_position = $('.c_main_info').position().top;

        if (now_position >= view_position) {
            $('.c_menu').addClass('sticky');
            $('.c_menu_hover').addClass('sticky');
        } else {
            $('.c_menu').removeClass('sticky');
            $('.c_menu_hover').removeClass('sticky');
            $('.first').addClass('on');
        }

        $(document).on("scroll", onScroll);

        $('.c_menu a[href^="#"]').on('click', function(e) {
            e.preventDefault();
            $(document).off("scroll");

            var target = this.hash,
                menu = target;
            $target = $(target);
            $('html, body').stop().animate({
                'scrollTop': $target.offset().top,
            }, 600, 'swing', function() {
                window.location.hash = target;
                $(document).scrollTop($(document).scrollTop());
                $(document).on("scroll", onScroll);
            });
        });

    });

});

// function onScroll(event) {
//     var scrollPos = $(document).scrollTop();

//     // $('.product_view_area .c_menu ul>li a').each(function () {
//     $('.c_menu ul>li a').each(function() {
//         var currLink = $(this);
//         var refElement = $(currLink.attr("href"));

//         if (refElement.position().top <= scrollPos && refElement.position().top + refElement.height() > scrollPos) {
//             $('.c_menu ul>li').removeClass("on");
//             currLink.parent().addClass("on");
//         } else {
//             currLink.parent().removeClass("on");
//         }
//     });
// }