//搜索
function search() {
    var searchKey = $("#searchKey").val();
    $.ajax({
        url: "/Admin/AdminLogList",
        dataType: "html",
        data: { "searchKey": searchKey },
        success: function (data) {
            $("#adminLog").html(data);
        },
        error: function () {
            alert("请求出错处理");
        }
    });
}

//分页
function to_first() {
    var page;
    var searchKey = $("#searchKey").val();
    searchKey = searchKey;
    page = 1;
    $.ajax({
        url: "/Admin/AdminLogList",
        dataType: "html",
        data: { "searchKey": searchKey, "page": page },
        success: function (data) {
            $("#adminLog").html(data);
        },
        error: function () {
            alert("请求出错处理");
        }
    });
}
function to_next() {
    var page;
    var totle_page = parseInt($("#page_totle_count").val());
    var current_page = parseInt($("#current_page").val());
    var searchKey = $("#searchKey").val();
    page = current_page + 1;
    if (page > totle_page) {
        return;
    }
    $.ajax({
        url: "/Admin/AdminLogList",
        dataType: "html",
        data: { "searchKey": searchKey, "page": page },
        success: function (data) {
            $("#adminLog").html(data);
        },
        error: function () {
            alert("请求出错处理");
        }
    });
}
function to_pre() {
    var page;
    var totle_page = parseInt($("#page_totle_count").val());
    var current_page = parseInt($("#current_page").val());
    var searchKey = $("#searchKey").val();
    searchKey = searchKey;
    page = current_page - 1;
    if (page < 1) {
        return;
    }
    $.ajax({
        url: "/Admin/AdminLogList",
        dataType: "html",
        data: { "searchKey": searchKey, "page": page },
        success: function (data) {
            $("#adminLog").html(data);
        },
        error: function () {
            alert("请求出错处理");
        }
    });
}
function to_last() {
    var page;
    var totle_page = parseInt($("#page_totle_count").val());
    if (totle_page == 0) {
        return;
    }
    var searchKey = $("#searchKey").val();
    searchKey = searchKey;
    page = totle_page;
    $.ajax({
        url: "/Admin/AdminLogList",
        dataType: "html",
        data: { "searchKey": searchKey, "page": page },
        success: function (data) {
            $("#adminLog").html(data);
        },
        error: function () {
            alert("请求出错处理");
        }
    });
}
function go_to() {
    var page;
    var totle_page = parseInt($("#page_totle_count").val());
    var current_page = parseInt($("#current_page").val());
    var searchKey = $("#searchKey").val();
    var inputbox_page_number = parseInt($("#inputbox_page_number").val());
    page = inputbox_page_number;
    if (page >= 1 && page <= totle_page) {
        $.ajax({
            url: "/Admin/AdminLogList",
            dataType: "html",
            data: { "searchKey": searchKey, "page": page },
            success: function (data) {
                $("#adminLog").html(data);
            },
            error: function () {
                alert("请求出错处理");
            }
        });
    } else {
        page = current_page;
        $.ajax({
            url: "/Admin/AdminLogList",
            dataType: "html",
            data: { "searchKey": searchKey, "page": page },
            success: function (data) {
                $("#adminLog").html(data);
            },
            error: function () {
                alert("请求出错处理");
            }
        });
    }
}