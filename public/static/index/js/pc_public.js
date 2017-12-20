var login_type;

$('.list-btn.jiekuan').click(function () {
    $('.mask').removeClass('none');
    var User_id = $('#User_id').val();
    if (!User_id) {
        boxshow(2);
    } else {
        $('.ld-twocode').removeClass('none');
    }
});
$('.pc-close').click(function () {
    $('.mask').addClass('none');
    $('.ld-twocode').addClass('none');
    $('.b-login').addClass('none');
});

//提交登录
$('.submit-blue.dianping').click(function () {
    var User_id = $('#User_id').val();
    var content = $('#dianping_text').val();
    var pro_id = $('#pro_id').val();
    content = $.trim(content);
    if (User_id==0) {
        if (content) {
            $.cookie('dianping_cookie_text', content, {expires: 1});
        }
        $('.mask').removeClass('none');
        login_type = 2;
        boxshow(2);
    } else {
        if (!content) {
            $('#dianping_text').focus();
            return false;
        }
        $.cookie('dianping_cookie_text', '');
        if (content && content.length < 3) {
            dialog.alert("ulasan terlalu singkat");
            // dialog.alert("点评内容太短！");
            return false;
        }
        var url = "/index/comment/add";
        var param = {pro_id: pro_id, content: content};
        $.post(url,param,function(msg){
            console.log(msg)
            dialog.alert(msg.msg);
            if (msg.code == 1) {
                window.location.href = "/detail/"+pro_id;
            }
        });
    }
});

//完善资料
$('.sel-list li').click(function () {
    $(this).addClass('cur').siblings().removeClass('cur');
});

function boxshow(type) {
    login_type = type;
    $('.mask').removeClass('none');
    switch (type) {
        case 1:
            $('.b-login').removeClass('none');
            $('#login_head_reg').addClass('none');
            $('#login_head_login').removeClass('none');
            $('#mima_login').addClass('none');
            $('#reg_login').addClass('none');
            $('#duanxin_login').removeClass('none');
            break;
        case 2:
            $('.b-login').removeClass('none');
            $('#login_head_reg').addClass('none');
            $('#login_head_login').removeClass('none');
            $('#mima_login').removeClass('none');
            $('#reg_login').addClass('none');
            $('#duanxin_login').addClass('none');
            break;
        case 3:
            $('.b-login').removeClass('none');
            $('#login_head_reg').removeClass('none');
            $('#login_head_login').addClass('none');
            $('#mima_login').addClass('none');
            $('#reg_login').removeClass('none');
            $('#duanxin_login').addClass('none');
            break;
    }
}

$(function () {
    $('.login_button_duanxin').click(function () {
        login_type = 1;
        boxshow(login_type);
    });
    $('.login_button_mima').click(function () {
        login_type = 2;
        boxshow(login_type);
    });
    $('.login_button_reg').click(function () {
        login_type = 3;
        boxshow(login_type);
    });

    $('.login_submit').click(function () {
        var type = login_type ? login_type : 2;
        var mobile = $('#guanjia_mobile_' + type).val();
        var code = $('#guanjia_code_' + type).val();
        var xieyi = $('#guanjia_xieyi_' + type).is(':checked');
        var password = $('#guanjia_password_' + type).val();
        var zhiye = $('#guanjia_zhiye').find('.cur').attr('data');
        var xyk = $('#guanjia_xyk').find('.cur').attr('data');
        var realname = $('#guanjia_realname').val();
        var idcard = $('#guanjia_idcard').val();
        var url, param;
        var nowurl = window.location.href;
        switch (type) {
            case 1:
                //短信登录
                if (!xieyi) {
                    dialog.alert('terima persetujuan dahulu');
                    // dialog.alert('请先接受服务协议！');
                    return false;
                }
                if (!mobile || !checkMobile(mobile)) {
                    dialog.alert('nomor ponsel error');
                    // dialog.alert('手机号码格式错误！');
                    return false;
                }
                if (!code || code.length < 6) {
                    dialog.alert('Kode verifikasi SMS salah');
                    // dialog.alert('短信验证码错误！');
                    return false;
                }
                url = "/ajax/UserCheck/";
                param = {mobile: mobile, code: code};
                $.ajax({
                    type: "POST",
                    url: url,
                    timeout: 3000, //超时时间设置，单位毫秒
                    dataType: 'json',
                    async: false,
                    data: param,
                    success: function (msg) {
                        var code = msg.code;
                        if (code == "2") {
                            $('.mask').removeClass('none');
                            boxshow(3);
                            $('#guanjia_mobile_3').val($('#guanjia_mobile_1').val());
                            login_type = 3;
                            return false;
                        }
                        if (code == "1") {
                            dialog.alert('login sukses');
                            // dialog.alert('登录成功！');
                            setTimeout("window.location.reload()", 500);
                        }
                        if (code == "0") {
                            dialog.alert(msg.msg);
                            return false;
                        }
                    },
                });
                break;
            case 2:
                //密码登录
                if (!mobile) {
                // if (!mobile || !checkMobile(mobile)) {
                    dialog.alert('nomor ponsel error');
                    // dialog.alert('手机号码格式错误！');
                    return false;
                }
                if (!password || password.length < 6 || !checkPassword(password)) {
                    dialog.alert('isi 6-20 digit kata sandi termasuk nomor dan huruf');
                    // dialog.alert('登录密码格式必须在6-20位！');
                    return false;
                }
                $.ajax({
                    url: "/index/login/doLogin",
                    type: "post",
                    dataType: "json",
                    data: {phone: mobile, password: password},
                    success: function (msg) {
                        if (msg.code == 1) {
                            dialog.alert('login berhasil');
                            // dialog.alert('登录成功！');
                            setTimeout("window.location.reload()", 500);
                            return false;
                        }else {
                            dialog.alert(msg.msg);
                            return false;
                        }
                    }
                });
                break;
            case 3:
                //注册       
                if (!xieyi) {
                    dialog.alert('terima persetujuan dahulu');
                    // dialog.alert('请先接受服务协议！');
                    return false;
                }
                if (!mobile || !checkMobile(mobile)) {
                    dialog.alert('nomor ponsel error');
                    // dialog.alert('手机号码格式错误！');
                    return false;
                }
                if (!password || password.length < 6 || !checkPassword(password)) {
                    dialog.alert('isi 6-20 digit kata sandi termasuk nomor dan huruf');
                    // dialog.alert('登录密码格式必须在6-20位！');
                    return false;
                }
                // if (!realname) {
                //     dialog.alert("masukan nama");
                //     return false;
                // }
                if (realname && !(/^[A-Za-z][A-Za-z\s]*[A-Za-z]$/i.test(realname))) {
                    dialog.alert("format nama error");
                    // dialog.alert("姓名必须是中文！");
                    return false;
                }

                // if (idcard) {
                //     if (idcard.length == 15 || idcard.length == 18) {
                //     } else {
                //         dialog.alert("format nomor ID error");
                //         // dialog.alert("身份证格式错错误！");
                //         return false;
                //     }
                // }
                url = "/index/login/reg";
                param = {phone: mobile, code: code, password: password, name: realname, idcard: idcard};
                $.ajax({
                    type: "POST",
                    url: url,
                    timeout: 3000, //超时时间设置，单位毫秒
                    dataType: 'json',
                    async: false,
                    data: param,
                    success: function (msg) {
                        var code = msg.code;
                        if (code == "1") {
                            dialog.alert('daftar sukses');
                            // dialog.alert('注册成功！');
                            setTimeout("window.location.reload()", 500);
                        }else{
                            dialog.alert(msg.msg);
                            return false;
                        }
                    },
                });
                break;
        }
    });
});

var handlerPopup = function (captchaObj) {
    // 成功的回调
    captchaObj.onSuccess(function () {
        var validate = captchaObj.getValidate();
        console.log(validate);
        getCode($('#guanjia_mobile_3').val(), validate.geetest_challenge, validate.geetest_validate, validate.geetest_seccode);
        // $.ajax({
        //     url: "/index/geetestVerifyLoginServlet/", 
        //     type: "post",
        //     dataType: "json",
        //     data: {
        //         type: "web",
        //         mod: "logging",
        //         geetest_challenge: validate.geetest_challenge,
        //         geetest_validate: validate.geetest_validate,
        //         geetest_seccode: validate.geetest_seccode
        //     },
        //     success: function (data) {
        //         if (data && (data.status === "success")) {
        //             getCode($('#guanjia_mobile_1').val(), validate.geetest_challenge, validate.geetest_validate, validate.geetest_seccode);
        //         } else {
        //             dialog.alert('服务器繁忙，获取验证码失败！');
        //             return false;
        //         }
        //     }
        // });
    });

    $("#get_reg_code").click(function () {
        var timeObj = $('#get_reg_code');
        if (timeObj.attr('is_send') == '1') {
            console.log('is_send')
            return false;
        }
        var mobile = $('#guanjia_mobile_3').val();
        if (!mobile || !checkMobile(mobile)) {
            dialog.alert("nomor ponsel error");
            // dialog.alert("手机号码格式错误");
            $('#guanjia_mobile_3').focus();
            return false;
        }
        captchaObj.verify();
        // $(".geetest_radar_tip").click();
    });
    // captchaObj.appendTo("#popup-captcha");
    captchaObj.bindForm("#popup-captcha");
};
// $.ajax({
//     url: "/index/login/startCaptchaServlet/?type=web&t=" + (new Date()).getTime(),
//     type: "get",
//     dataType: "json",
//     success: function (data) {
//         initGeetest({
//             gt: data.gt,
//             challenge: data.challenge,
//             product: "bind",
//             offline: !data.success
//         }, handlerPopup);
//     }
// });

function getCode(mobile, geetest_challenge, geetest_validate, geetest_seccode) {
    var timeObj = $('#get_reg_code');
    $.ajax({
        url: "/index/login/sendSms",
        type: "post",
        dataType: "json",
        data: {
            type: "web",
            phone: mobile,
            geetest_challenge: geetest_challenge,
            geetest_validate: geetest_validate,
            geetest_seccode: geetest_seccode
        },
        success: function (msg) {
            console.log(msg);
            if (msg && msg.code == "1") {
                dialog.alert("kode verifikasi dikirim", "1000");
                // dialog.alert("短信验证码发送成功", "1000");
                $('.yzm').focus();
                timeObj.attr('is_send', '1');
                addCookie("secondsremained", 180, 180); //添加cookie记录,有效时间60s
                var v = getCookieValue("secondsremained"); //获取cookie值
                if (v > 0) {
                    settime(timeObj);//开始倒计时
                }
                return false;
            } else {
                dialog.alert(msg.msg, "3000");
                return false;
            }
        }
    });
}
$(function () {
    $('#guanjia_login').on('click', '', function () {
        var mobile = $('#guanjia_mobile_1').val();
        var code = $('#guanjia_code_1').val();
        var pwd = $('#guanjia_pwd_1').val();
        var xieyi = $('#guanjia_xieyi_1').is(':checked');
        var nowurl = window.location.href;
        if (!xieyi) {
            dialog.alert('terima persetujuan dahulu');
            // dialog.alert('请先接受服务协议！');
            return false;
        }
        if (!mobile || !checkMobile(mobile)) {
            $('#guanjia_mobile_1').focus();
            dialog.alert('masukan nomor ponsel yang benar');
            // dialog.alert('请输入正确的手机号码');
            return false;
        }
        if (!pwd) {
            $('#guanjia_pwd_1').focus();
            dialog.alert('masukan kata sandi');
            // dialog.alert('请输入密码');
            return false;
        }

        // pwd登陆
        $.ajax({
            url: "/index/login/doLogin",
            type: "post",
            dataType: "json",
            data: {phone: mobile, password: pwd},
            success: function (msg) {
                if (msg.code == 1) {
                    dialog.alert('login sukses');
                    // dialog.alert('登录成功！');
                    setTimeout("window.location.href = '" + nowurl + "'", 500);
                    return false;
                }else {
                    dialog.alert(msg.msg);
                    return false;
                }
            }
        });
        // code登陆
        /*if (code.length < 6) {
            $('#guanjia_code_1').focus();
            dialog.alert('手机验证码错误！');
            return false;
        }
        $.ajax({
            url: "/ajax/UserCheck/",
            type: "post",
            dataType: "json",
            data: {mobile: mobile, code: code},
            success: function (msg) {
                if (msg.code == 1) {
                    dialog.alert('登录成功！');
                    setTimeout("window.location.href = '" + nowurl + "'", 500);
                    return false;
                }
                if (msg.code == 2) {
                    $('.mask').removeClass('none');
                    boxshow(3);
                    $('#guanjia_mobile_3').val($('#guanjia_mobile_1').val());
                    $('#guanjia_code_3').val($('#guanjia_code_1').val());
                    login_type = 3;
                    return false;
                }
                if (msg.code == 0) {
                    dialog.alert(msg.msg);
                    return false;
                }
            }
        });*/
    });
});

function setCountsJump(url, type, belong_id) {
    var param = {type: type, belong_id: belong_id}
    jsfunc.publicAjax("/ajax/setCounts/", param);
    if (url) {
        window.location.href = url;
    }
}

//短信验证码倒计时
var countdown;
var cookie_name = "";
function settime(obj) {
    countdown = getCookieValue("secondsremained");
    if (isNaN(countdown)) {
        obj.attr("is_send", '');
        obj.text("dapatkan kode verifikasi");
        // obj.text("获取验证码");
        return;
    }
    if (countdown == 0) {
        obj.attr("is_send", '');
        obj.text("dapatkan kode verifikasi");
        // obj.text("获取验证码");
        return;
    } else {
        obj.attr("is_send", '1');
        obj.text(countdown + "s");
        countdown--;
        editCookie("secondsremained", countdown, countdown + 1);
    }
    setTimeout(function () {
        settime(obj);
    }, 1000) //每1000毫秒执行一次
}
function getCookieValue(name) {
    var cookie_arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
    if (cookie_arr = document.cookie.match(reg)) {
        return unescape(cookie_arr[2]);
    }
}
function addCookie(name, value, expiresHours) {
    var cookieString = name + "=" + escape(value);
    //判断是否设置过期时间,0代表关闭浏览器时失效
    if (expiresHours > 0) {
        var date = new Date();
        date.setTime(date.getTime() + expiresHours * 1000);
        cookieString = cookieString + ";expires=" + date.toUTCString();
    }
    cookie_name = cookieString;
    document.cookie = cookieString;
}
function editCookie(name, value, expiresHours) {
    var cookieString = name + "=" + escape(value);
    if (expiresHours > 0) {
        var date = new Date();
        date.setTime(date.getTime() + expiresHours * 1000); //单位是毫秒
        cookieString = cookieString + ";expires=" + date.toGMTString();
    }
    cookie_name = cookieString;
    document.cookie = cookieString;
}