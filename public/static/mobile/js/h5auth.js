function inith5ready(userData) {
    var user_id = $('#User_id').val();
    var bbs_uid = $('#Bbs_uid').val();
    if (userData.id) {
        localStorage.setItem("H5userData", JSON.stringify(userData));
    }
    var H5userData = JSON.parse(localStorage.getItem("H5userData"));
    var pathname = window.location.pathname;
    if (pathname == "/Login" || pathname == "/Login/" || pathname == "/login/" || pathname == "/login") {
        localStorage.removeItem("H5userData");
        return false;
    }
    if (H5userData) {
        if (H5userData.is_weixin == '1') {
            $('.title').hide();
        }
        if (H5userData.id > 0) {
            if (!user_id) {
                var url = "/ajax/H5authlogin/";
                var param = {id: H5userData.id, mobile: H5userData.mobile, name: H5userData.name, bbs_uid: H5userData.bbs_uid, authcode: H5userData.authcode};
                var bool = jsfunc.publicAjax(url, param);
                if (bool) {
                    $('#User_id').val(H5userData.id);
                    $('#Bbs_uid').val(H5userData.bbs_uid);
                }
            }
        }
    }
}
