var APPCommon = {
    iphoneSchema: 'yongqianguanjia://',
    iphoneDownUrl: 'https://itunes.apple.com/cn/app/id1270613439',
    androidSchema: 'yongqianguanjiaapp://',
    androidDownUrl: 'https://a.app.qq.com/o/simple.jsp?pkgname=com.jiafenqi.loanmanager',
    weixinDownUrl: 'https://a.app.qq.com/o/simple.jsp?pkgname=com.jiafenqi.loanmanager',
    openApp: function () {
        var this_ = this;
        //微信
        if (this_.isWeixin()) {
            window.location.href = this_.weixinDownUrl;
        } else {
            //apple
            if (navigator.userAgent.match(/(iPhone|iPod|iPad);?/i)) {
                var loadDateTime = new Date();
                window.setTimeout(function () {
                    var timeOutDateTime = new Date();
                    if (timeOutDateTime - loadDateTime < 5000) {
                        window.location.href = this_.iphoneDownUrl;
                    } else {
                        window.close();
                    }
                }, 200);
                window.location.href = this_.iphoneSchema;
            }
            //android
            else if (navigator.userAgent.match(/android/i)) {
                try {
                    var startTime = Date.now();
                    var ifr = document.createElement('iframe');
                    ifr.src = this_.androidSchema;
                    ifr.style.display = 'none';
                    document.body.appendChild(ifr);
                    setTimeout(function () {
                        window.location = this_.androidDownUrl;
                    }, 200);
                } catch (e) {
                    console.log('error?');
                }
            }
        }
    },
    //判断是否是微信
    isWeixin: function () {
        var ua = navigator.userAgent.toLowerCase();
        if (ua.match(/MicroMessenger/i) == "micromessenger") {
            return true;
        } else {
            return false;
        }
    }
};