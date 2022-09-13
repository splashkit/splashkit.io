//= require_tree ./vendor
//= require_tree .
$('#sticky').Stickyfill();


$(document).ready(function () {
    if (detectMobile()) {
        $('.os_mobile').show();
        return;
    }
    var OSName = "Unknown";
    if (navigator.platform.indexOf("Win") != -1) OSName = "Windows";
    else if (navigator.platform.indexOf("Mac") != -1) OSName = "MacOS";
    else if (navigator.platform.indexOf("X11") != -1) OSName = "MacOS";
    else if (navigator.platform.indexOf("Linux") != -1) OSName = "Linux";
    if (OSName == "MacOS") {
        $('.os_mac').show();
    } else if (OSName == "Linux") {
        $('.os_linux').show();
    } else {
        $('.os_windows').show();
    }

});
$('#btn_platforms').click(function (e) {
    $('.button_area').slideToggle(200);

});
$(".copy_code").click(function (e) {
    let code = $('.sk_cli_code').text();

    $('.copy_code').fadeOut(600);
    $('.sk_cli_area').css('overflow', 'scroll');
    if (navigator.clipboard) {
        navigator.clipboard.writeText(code);
        $(this).text("Copied")
    }
});
$('.sk_cli_area').mouseenter(function () {
    $('.copy_code').fadeIn(200);
    $(".copy_code").text("Click to copy");
    $('.sk_cli_area').css('overflow', 'hidden');
});
$('.sk_cli_area').mouseleave(function () {
    $('.copy_code').fadeOut(200);
});
$('.sk_btn_light').click(function (e) {
    e.preventDefault();
    let cid = this.id;
    if (cid == "windows") {
        $('.content_area').hide();
        $('.os_windows').show(300);
    }
    if (cid == "mac") {
        $('.content_area').hide();
        $('.os_mac').show(300);
    }
    if (cid == "linux") {
        $('.content_area').hide();
        $('.os_linux').show(300);
    }
    if (cid == "vm") {
        $('.content_area').hide();
        $('.os_vm').show(300);
    }

});

function detectMobile() {
    const toMatch = [
        /Android/i,
        /webOS/i,
        /iPhone/i,
        /iPad/i,
        /iPod/i,
        /BlackBerry/i,
        /Windows Phone/i,
    ];

    return toMatch.some((toMatchItem) => {
        return navigator.userAgent.match(toMatchItem);
    });
}