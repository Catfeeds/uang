function Jiekuan(id, url, time) {
    if (!id) {
        return false;
    }
    if (!time) {
        time = "100";
    }
    var user_id = $("#User_id").val();
    var jumpurl;
    if (user_id==0) {
        var H5userData = JSON.parse(localStorage.getItem("H5userData"));
        if (H5userData) {
            user_id = H5userData.id;
        }
    }

    if (user_id==0) {
        jumpurl = "/login";
        setTimeout("window.location.href = '" + jumpurl + "' ", time);
        return false;
    } else {
        jumpurl = "/mobile/jump/topro";
        $.post(jumpurl,{id:id},function(msg){
            if (msg.status == 1 && msg.url) {
                window.location.href = msg.url;
            }else{
                
            }
        })
    }
}

function jumpUrl(url, channel_id, pro_id, time) {
    if (!url || !channel_id) {
        return false;
    }
    if (!time) {
        time = '100';
    }
    var jumpurl;
    var user_id = $("#User_id").val();
    if (url.indexOf('?') > 0) {
        jumpurl = url + "&user_id=" + user_id + "&pro_id=" + pro_id + "&channel_id=" + channel_id;
    } else {
        jumpurl = url + "?user_id=" + user_id + "&pro_id=" + pro_id + "&channel_id=" + channel_id;
    }
    setTimeout("window.location.href = '" + jumpurl + "' ", time);
}

function setCountsJump(url, type, belong_id) {
    var param = {type: type, belong_id: belong_id}
    jsfunc.publicAjax("/ajax/setCounts/", param);
    if (url) {
        window.location.href = url;
    }
}