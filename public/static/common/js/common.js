$(function () {
    $('.main .back').on('click', function () {
        var url = $(this).attr('url');
        if (url) {
            window.location.href = url;
        } else {
            window.history.go(-1);
        }
    });
});

function cache() {
    return new Date().getTime();
}
function checkMobile(s) {   //判断手机号码
    // return true;
    // var regu = /^(13[0-9]|14[0-9]|15[0-9]|16[6]|17[0-9]|18[0-9]|19[0-9])\d{8}$/;
    var regu = /^0?8\d{8,10}$/;
    var re = new RegExp(regu);
    if (re.test(s)) {
        return true;
    } else {
        return false;
    }
}
function checkPassword(yx) {    //验证Password
    var reyx = /^(.){6,20}$/;
    return(reyx.test(yx));
}
function checkEmail(yx) {   //验证Emal
    //var reyx= /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
    var reyx = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9_\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    return(reyx.test(yx));
}
function checkIdentity(num) {   //验证身份证号码
    num = num.toUpperCase();
    if (!(/(^\d{15}$)|(^\d{17}([0-9]|X)$)/.test(num))) {
        return false;
    }
    var len, re;
    len = num.length;
    if (len == 15) {
        re = new RegExp(/^(\d{6})(\d{2})(\d{2})(\d{2})(\d{3})$/);
        var arrSplit = num.match(re);
        var dtmBirth = new Date('19' + arrSplit[2] + '/' + arrSplit[3] + '/' + arrSplit[4]);
        var bGoodDay;
        bGoodDay = (dtmBirth.getYear() == Number(arrSplit[2])) && ((dtmBirth.getMonth() + 1) == Number(arrSplit[3])) && (dtmBirth.getDate() == Number(arrSplit[4]));
        if (!bGoodDay) {
            return false;
        } else {
            var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2);
            var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2');
            var nTemp = 0, i;
            num = num.substr(0, 6) + '19' + num.substr(6, num.length - 6);
            for (i = 0; i < 17; i++) {
                nTemp += num.substr(i, 1) * arrInt[i];
            }
            num += arrCh[nTemp % 11];
            return true;
        }
    }
    if (len == 18) {
        re = new RegExp(/^(\d{6})(\d{4})(\d{2})(\d{2})(\d{3})([0-9]|X)$/);
        var arrSplit = num.match(re);
        var dtmBirth = new Date(arrSplit[2] + "/" + arrSplit[3] + "/" + arrSplit[4]);
        var bGoodDay;
        bGoodDay = (dtmBirth.getFullYear() == Number(arrSplit[2])) && ((dtmBirth.getMonth() + 1) == Number(arrSplit[3])) && (dtmBirth.getDate() == Number(arrSplit[4]));
        if (!bGoodDay) {
            return false;
        } else {
            var valnum;
            var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2);
            var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2');
            var nTemp = 0, i;
            for (i = 0; i < 17; i++) {
                nTemp += num.substr(i, 1) * arrInt[i];
            }
            valnum = arrCh[nTemp % 11];
            if (valnum != num.substr(17, 1)) {
                return false;
            }
            return true;
        }
    }
    return false;
}

var jsfunc = {
    ajax: function (url, data, time) {
        var bool = false;
        $('#showloading,.mask').removeClass('none');
        $('#showloading').css({"left": ($(window).width() - $('#showloading').outerWidth(true)) / 2 + "px"});
        data = (data == null || data == "" || typeof (data) == "undefined") ? {} : data;
        if (!time) {
            time = 200;
        }
        setTimeout(function () {
            $.ajax({
                type: "POST",
                url: url,
                timeout: 3000, //超时时间设置，单位毫秒
                dataType: 'json',
                async: false,
                data: data,
                success: function (msg) {
                    if (!msg) {
                        dialog.alert("waktu habis, coba lagi nanti");
                        // dialog.alert("请求超时，请稍候再试！");
                        return false;
                    }
                    if (msg.msg == "false") {
                        if (msg.url) {
                            setTimeout("window.location.href ='" + msg.url + "'", 100);
                            return false;
                        }
                        return false;
                    }
                    if (msg.code == '1') {
                        if (msg.msg == "true") {
                            if (msg.url) {
                                setTimeout("window.location.href ='" + msg.url + "'", 100);
                                return false;
                            }
                            return true;
                        }
                        if (msg.msg) {
                            dialog.alert(msg.msg);
                        }
                        if (msg.url) {
                            setTimeout("window.location.href ='" + msg.url + "'", 100);
                            return false;
                        }
                        bool = true;
                    } else {
                        if (msg.msg) {
                            dialog.alert(msg.msg);
                            if (msg.url) {
                                setTimeout("window.location.href ='" + msg.url + "'", 800);
                                return false;
                            }
                        } else {
                            dialog.alert("server error");
                            // dialog.alert("服务器连接失败，请重试！");
                        }
                        return false;
                    }
                },
                error: function (XMLHttpRequest) {
                    console.log(XMLHttpRequest);
                    dialog.alert("waktu habis, coba lagi nanti");
                    // dialog.alert("请求超时，请稍候再试！");
                    bool = false;
                    return bool;
                },
                complete: function (XMLHttpRequest, status) {
                    $('#showloading,.mask').addClass('none');
                    if (XMLHttpRequest.status == '404') {
                        dialog.alert("Halaman error");
                        // dialog.alert("请求页面错误！");
                        bool = false;
                    }
                    if (status == 'timeout') {
                        dialog.alert("waktu habis, coba lagi nanti");
                        // dialog.alert("请求超时，请稍候再试！");
                        bool = false;
                    }
                    return bool;
                }
            });
        }, time);
    },
    publicAjax: function (url, data) {
        var bool = false;
        if (!url) {
            return false;
        }
        data = (data == null || data == "" || typeof (data) == "undefined") ? {} : data;
        $.ajax({
            type: "POST",
            url: url,
            timeout: 3000, //超时时间设置，单位毫秒
            dataType: 'json',
            async: false,
            data: data,
            success: function (msg) {
                if (!msg) {
                    dialog.alert("waktu habis, coba lagi nanti");
                    // dialog.alert("请求超时，请稍候再试！");
                    return false;
                }
                if (msg.msg == "false") {
                    if (msg.url) {
                        setTimeout("window.location.href ='" + msg.url + "'", 100);
                        return false;
                    }
                    bool = false;
                    return bool;
                }
                if (msg.code == '1') {
                    if (msg.msg == "true") {
                        if (msg.url) {
                            setTimeout("window.location.href ='" + msg.url + "'", 100);
                            return false;
                        }
                        bool = true;
                        return true;
                    }
                    if (msg.msg) {
                        dialog.alert(msg.msg);
                    }
                    if (msg.url) {
                        setTimeout("window.location.href ='" + msg.url + "'", 100);
                        return false;
                    }
                    bool = true;
                } else {
                    if (msg.msg) {
                        dialog.alert(msg.msg);
                    } else {
                        dialog.alert("server error");
                        // dialog.alert("服务器连接失败，请重试！");
                    }
                    bool = false;
                }
            },
            error: function (XMLHttpRequest) {
                dialog.alert("waktu habis, coba lagi nanti");
                // dialog.alert("请求超时，请稍候再试！");
                bool = false;
            },
            complete: function (XMLHttpRequest, status) {
                $('#showloading,.mask').addClass('none');
                if (XMLHttpRequest.status == '404') {
                    dialog.alert("Halaman error");
                    // dialog.alert("请求页面错误！");
                    bool = false;
                }
                if (status == 'timeout') {
                    dialog.alert("waktu habis, coba lagi nanti");
                    // dialog.alert("请求超时，请稍候再试！");
                    bool = false;
                }
            }
        });
        return  bool;
    },
    dump: function (data) {
        if (!data) {
            data = "数据为空";
        }
        console.log(data);
    }
};

var dialog = {
    //对话框，cont是提示内容（可以是html标签等），time是停留时间
    alert: function (cont, time) {
        if (typeof time == "undefined") {
            time = 1200;
        }
        var html = '<div id="pub_alert" style="background-color: rgba(42, 42, 42, 0.9);color:#FFF; min-width: 50px;_width:50px; padding:0 20px;height: 50px; line-height: 50px; position: fixed; left:0%;top:35%; z-index: 1000000; text-align: center; display:none; box-shadow: 0px 0px 10px rgba(0,0,0,0.3);border-radius: 3px;"></div>';
        if (cont == 'loading') {
            $('#showloading,.mask').removeClass('none');
            $('#showloading').css({"left": ($(window).width() - $('#showloading').outerWidth(true)) / 2 + "px"});
            setTimeout(function () {
                $('#showloading,.mask').addClass('none');
            }, time);
        } else {
            if ($("#pub_alert").length == 0) {
                $("body").append(html);
            }
        }
        var pub_alert = $("#pub_alert");
        pub_alert.html(cont).css({"left": ($(window).width() - pub_alert.outerWidth(true)) / 2 + "px"}).stop(true, true).fadeIn();
        clearTimeout(timer);
        var timer = setTimeout(function () {
            //pub_alert.html("");
            pub_alert.stop(true, true).fadeOut();
        }, time);
    },
    //确认框，cont是显示内容（可以是html标签等）,callback是确定后的操作,options是初始化框架参数：宽,高,内边距,距离顶部位置,是否有遮罩背景,随窗口滚动
    confirm: function (cont, callback, options) {
        //设置默认值
        if (options == undefined) {
            options = {};
        }
        opt = {
            width: options.width ? options.width : "440px", //宽
            height: options.height ? options.height : "170px", //高
            padding: options.padding ? options.padding : "10px", //内边距            
            top: options.top ? options.top : "5%", //,距离顶部位置
            ismask: options.ismask ? options.ismask : false, //是否有遮罩背景
            isscroll: options.isscroll ? options.isscroll : false//随窗口滚动,随窗口滚动
        };
        var html = '<div id="pub_confirm" style="position:' + (opt.isscroll ? "absolute" : "fixed") + '; left: 0;top:0;width: 100%;height: ' + $(document).outerHeight(true) + 'px;background-color:transparent;background-color:' + (opt.ismask ? "rgba(0,0,0,0.5)" : "transparent") + '; z-index:99999;">'
          + '<div style=" position:relative; margin:0 auto; text-align:center;font-size:20px; top:' + opt.top + '; width:' + opt.width + '; height:' + opt.height + ';overflow:hidden; padding:' + opt.padding + '; background-color:#fff;' + (!opt.ismask ? "box-shadow: 0 0 10px rgba(0,0,0,0.3); boder:1px solid #d5d5d5;" : "") + '">'
          + '<div class="pub_confirm_cont" style="margin:40px auto;"></div>'
          + '<div class="pub_confirm_btn" style="font-size:16px;"><a href="#" style="width: 188px;height: 40px;line-height: 40px;color:#fff;background-color:#3a84ae;margin-right:25px; border-radius:3px; display:inline-block;*display:inline;*zoom:1;">konfirmasi</a><a href="#" style="width: 188px;height: 40px;line-height: 40px;color:#fff;background-color:#c1c1c1; border-radius:3px; display:inline-block;*display:inline;*zoom:1;">batal</a></div>'
          + '</div>'
          + '</div>';
          // 确定 konfirmasi
          // 取消 batal
        $("body").append(html);//body添加框架
        $(".pub_confirm_cont").html(cont);//写入内容
        //移除框架
        $(".pub_confirm_btn a").on("click", function () {
            $("#pub_confirm").remove();
            return false;
        })
        //确定
        $(".pub_confirm_btn a:eq(0)").on("click", function () {
            if (typeof callback != "undefined") {
                callback(true);
            }
        });
        $(".pub_confirm_btn a:eq(1)").on("click", function () {
            if (typeof callback != "undefined") {
                callback(false);
            }
        });

    }
}

