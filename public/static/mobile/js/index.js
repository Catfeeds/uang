loadtime = 500;

var timer, text;
text = $('.gundong1').text();
$('.gundong2').text(text);
timer = setInterval(mar, 30);
function mar() {
    var left = $('.gundong').scrollLeft();
    var width = $('.gundong1').outerWidth();
    if (width <= left) {
        left -= width;
    } else {
        left++;
    }
    $('.gundong').scrollLeft(left);
}

//第一次申请
function FirstClick(obj) {
    var user_id = $('#User_id').val();
    if (user_id==0) {
        dialog.alert("Mohon login");
        // dialog.alert("请先登录再操作！");
        // var nowurl = window.location.href;
        setTimeout("window.location.href = '/login'", 1000);
        return false;
    }
    var protype = $('#protype').val();
    console.log(protype)
    var obj = $(obj);
    var pro_id = obj.attr('pro_id');
    var status = obj.attr('get_status');
    obj.parent().parent().find('.layout').removeClass('none');
    $('.mask').removeClass('none');
    // var text = obj.parents('.info').find('a.fl').text();
    // $('.layout.index-apply span').text(text);
    var yes = obj.parent().parent().find('.yes');
    var no = obj.parent().parent().find('.no');
    $(yes).click(function () {
        var url = "/mobile/apply/add";
        var param = {status: 1, pro_id: pro_id};
        $.ajax({
            type: "POST",
            url: url,
            dataType: 'json',
            async: false,
            data: param,
            success: function (msg) {
                console.log(msg);
                dialog.alert(msg.msg);
                if (msg.status == '1') {
                    // $('#weishenqing_count').text("(" + msg.msg.weishenqing_count + ")");
                    // $('#weishenqing_num').html(msg.msg.weishenqing_count + "个口子未申请，预计可借<span class='red pd0'>" + (msg.msg.weishenqing_count * 1500) + "</span>元");
                    // $('#yishenqing_count').text("(" + msg.msg.yishenqing_count + ")");
                    obj.parents('.i-apply.on').addClass('').siblings().removeClass('none');
                    $('.layout').addClass('none');
                    obj.parents('body').find('.mask').addClass('none');
                    obj.addClass('none');
                    obj.parents('.info').find('.i-apply i').attr('class', "apply");
                    obj.parents('.info').find('.i-apply.on .gray').removeClass('none');
                    if (protype == "2" || protype == "3") {
                        obj.parents('.info').addClass('none');
                    }
                }
            }
        });
    });
    $(no).click(function () {
        obj.parent().parent().find('.layout').addClass('none');
        obj.parents('body').find('.mask').addClass('none');
    });
}

//load more
$(function () {
    $('#hide_is_data').val('0');
//    $('#hide_is_apply_data').val('0');
    $('#hide_page').val('2');
    $('#hide_apply_page').val('1');
    $('.list-refresh-msg').click(function () {
        var protype = $('#protype').val();
        var page = $('#hide_page').val();
        var apply_page = $('#hide_apply_page').val();
        var hide_is_data = $('#hide_is_data').val();
        var hide_is_apply_data = $('#hide_is_apply_data').val();
        var main = $(".loadingmore"); //主体元素  
        if (hide_is_data != '1') {
            $.ajax({
                type: "get",
                url: "/",
                dataType: 'json',
                async: false,
                data: {'page': page, 'type': protype},
                success: function (msg) {
                    if (msg.status == '1') {
                        if (msg.msg == '') {
                            $('#hide_is_data').val('1');
                            return;
                        }
                        $('#hide_page').val(page - (-1));
                        var $html = msg.msg;
                        main.append($html);
                        hide_is_apply_data = 1;
                    } else {
                        $('#hide_is_data').val('1');
                        $('#hide_is_apply_data').val('2');
                        hide_is_apply_data = 2;
                        return false;
                    }
                }
            });
        }

        /*if (hide_is_apply_data == '2') {
            $.ajax({
                type: "POST",
                url: "/ajax/getMoreApplyPro/",
                dataType: 'json',
                async: false,
                data: {'page': apply_page, 'protype': protype},
                success: function (msg) {
                    loadButton();
                    if (msg.code == '1') {
                        $('#hide_is_apply_data').val('1');
                        setTimeout(function () {
                            $('#loading').addClass('none');
                            $('#hide_apply_page').val(apply_page - (-1));
                            var $html2 = msg.msg;
                            main.append($html2);
                            $('#hide_is_apply_data').val('2');
                        }, loadtime);
                    } else {
                        $('#hide_is_apply_data').val('1');
                        $('#loading').addClass('none');
                        return false;
                    }
                }
            });
        }*/
    });
});

$(window).scroll(function () {
    var $this = $(this),
      viewH = $this.height(), //可见高度  
      contentH = document.documentElement.scrollHeight, //内容高度  
      scrollTop = $this.scrollTop(); //滚动高度  
    if (scrollTop / (contentH - viewH) >= '0.99') {
        $('.list-refresh-msg').trigger('click');
    }
});
function loadButton(time) {
    if (!time) {
        time = loadtime;
    }
    document.body.style.overflow = 'hidden';
    window.addEventListener('touchmove', _preventDefault);
    function _preventDefault(e) {
        e.preventDefault();
    }
    var backdrop = $('.mask');
    var showloading = $('#loading');
    clearTimeout(timer);
//    backdrop.removeClass('none');
    showloading.removeClass('none');
    var timer = setTimeout(function () {
//        backdrop.addClass('none');
        showloading.addClass('none');
        document.body.style.overflow = 'auto';
        window.removeEventListener('touchmove', _preventDefault);
    }, time);
}
