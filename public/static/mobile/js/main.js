window.addEventListener("load", function () {
    FastClick.attach(document.body);
}, false);
$(function () {
    $('.tab td').click(function () {
        $(this).addClass('cur').siblings().removeClass('cur');
    });
});
//借款攻略
$(function () {
    $('.r-list .r-choose span').click(function () {
        $(this).addClass('cur').siblings().removeClass('cur');
    });
    $(window).scroll(function () {
        var top = $(window).scrollTop();
        if (top > 45) {
            $('.tab.strategy').addClass('fix');
        } else {
            $('.tab.strategy').removeClass('fix');
        }
    });
    //tab悬浮
//    $(window).scroll(function () {
//        var top = $(window).scrollTop();
//        if (top > 180) {
//            $('.banner').addClass('mb50');
//            $('.tab.t-index').addClass('fix');
//        } else {
//            $('.banner').removeClass('mb50');
//            $('.tab.t-index').removeClass('fix');
//        }
//    });
});
//登录
$(function () {
    $('.r-info').on('focus', 'input', function () {
//        var height = $(this).offset().top;
//        $('.main').addClass('mb180');
//        setTimeout(function () {
//            $('body').prop('scrollTop', height - 60);
//            if (height < 50) {
//                $('body').css('padding-top', '40px');
//                setTimeout(function () {
//                    $('body').css('padding-top', '0');
//                }, 3000);
//            }
//        }, 50);
    });
    $('.r-info input').blur(function () {
        $('.main').removeClass('mb180');
    });
});

$(function () {
    $('.layout .close').click(function () {
        $('.layout').addClass('none');
        $('.mask').addClass('none');
    });
});

//index
$(function () {
    $('.g-bg .g-close').click(function () {
        $('.g-bg').addClass('none');
    });
//    Kwidth();
    //口子说明长度控制
//    function Kwidth() {
//        $('.info').each(function () {
//            var info = $('.info'), i;
////            for (i = 0; i < info.length; i++) {
////                var hdwidth = $(this).find('.hd').width() - 15,
////                        awidth = $(this).find('.hd a').width();
////                $(this).find('.hd .gray').width(hdwidth - awidth);
////            }
//        });
//    }

});

//channel
$(function () {
    $('.t-choose div').click(function () {
        $(this).addClass('cur').siblings().removeClass('cur').find('span').addClass('red');
        $(this).find('span').removeClass('red');
        var choseType = $(this).attr('choseType');
        if ($('.t-detail').hasClass('cur')) {
            $('.t-details').removeClass('none');
            $('.t-comments').addClass('none');
        } else {
            $('.t-details').addClass('none');
            $('.t-comments').removeClass('none');
        }
        if (choseType == '2') {
            $('.c-editor').removeClass('none');
            $('.fix-s-btn').addClass('none');
        } else {
            $('.c-editor').addClass('none');
            $('.fix-s-btn').removeClass('none');
        }
    });
    $('.star-show li').click(function () {
        if ($(this).parents('.star-show').attr('noselect') == 1) {
            return false;
        }
        var i = $(this).index() + 1;
        var width = i / 5 * 100;
        $(this).parents('.star-show').find('.s-show').css("width", width + "%");
        $(this).parents('.star-show').find('.s-show').attr("data", i);
    });
});

//dianping
$(function () {
    $('.textarea-text textarea').bind('input propertychange', function () {
        var _length = $(this).val().length;
        $('.cur-count').html(_length);
        if (_length > "140") {
            $('.cur-count').html('140');
        }
    });
    $('.c-editor textarea').bind('input propertychange', function () {
        var _length = $(this).val().length;
        $('.c-editor .cur-count').html(_length);
        if (_length > "140") {
            $('.c-editor .cur-count').html('140');
        }
    });
    $('textarea').on('keyup', function () {
        var _length = $(this).val().length;
        if (_length > "140") {
            $(this).val($(this).val().substring(0, 140));
        }
    });
});

//new_post
$(function () {
    $('.np-textarea textarea').bind('input propertychange', function () {
        var _length = $(this).val().length;
        $('.cur-count').html(_length);
        if (_length > "1000") {
            $('.cur-count').html('1000');
        }
    });
    $('.np-textarea textarea').on('keyup', function () {
        var _length = $(this).val().length;
        if (_length > "1000") {
            $(this).val($(this).val().substring(0, 1000));
        }
    });
    $('.np-list.quyu').click(function () {
        $('.mask').removeClass('none');
        $('.layout').removeClass('none');
    });
    $('.layout .lay-list').click(function () {
        var text = $(this).text();
        $(this).parents('.main').find('.np-list .qu').text(text);
        $('.mask').addClass('none');
        $('.layout').addClass('none');
    });
});

function AndroidTab() {
    $('.nav').addClass('none');
}

//hole
$(function () {
    $('.search-center input').focus(function () {
        $(this).bind('input propertychange', function () {
            var text = $(this).val();
            if (text == '') {
                $(this).removeClass('bg-white');
            } else {
                $(this).addClass('bg-white');
            }
        });
    });
//    $('.search-center input').bind('input propertychange', function () {
//        var itext = $(this).val();
//        console.log(itext);
//        if (!itext == '' && itext.length < 2) {
//            $('.' + itext + '1').parent().siblings('.j-list').addClass('none');
//        }
//        if(itext == ''){
//            $('.j-list').removeClass('none');
//        }
//    });
    $('.search-point li').click(function () {
        var letter = $(this).text().toUpperCase(),i;
//        console.log(letter);
        var searchletter = $('.j-list.hole .letter-title').text().replace(/\s/g, "");
        if (searchletter.indexOf(letter)!=-1) {
            var num = searchletter.indexOf(letter)
//            console.log(searchletter.indexOf(letter));
            $(window).scrollTop($('.j-list').eq(num).offset().top);
        }
    });
});


