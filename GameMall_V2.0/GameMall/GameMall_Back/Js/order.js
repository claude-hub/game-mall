$(function () {
    //订单导航
    $("#order_title a").click(function () {
        $("#order_title a").removeClass("actived");
        $(this).addClass("actived");
        var orderStatu = parseInt($(this).attr("id"));
        $.ajax({
            url: "/Order/SelectOrders",
            dataType: "html",
            data: { "orderStatu": orderStatu,"searchKey":"","page": 1},
            success: function (data) {
                $("#order_list").html(data);
            },
            error: function () {
                alert("请求出错处理");
            }
        });
    });
    //搜索订单
    $("#search").click(function () {
        var searchKey = $("#searchKey").val();
        $.ajax({
            url: "/Order/SelectOrders",
            dataType: "html",
            data: { "orderStatu": 0, "searchKey": searchKey, "page": 1 },
            success: function (data) {
                $("#order_list").html(data);
            },
            error: function () {
                alert("请求出错处理");
            }
        });
    });
});
//分页
function to_first(){
    var searchKey = $("#searchKey").val();
    var orderStatu = parseInt($("#order_title .actived").attr("id"));
    $.ajax({
        url: "/Order/SelectOrders",
        type: "POST",
        dataType: "html",
        data: { "orderStatu": orderStatu, "searchKey": searchKey, "page": 1 },
        success: function (data) {
            $("#order_list").html(data);
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
    var orderStatu = parseInt($("#order_title .actived").attr("id"));
    page = current_page - 1;
    if (page < 1) {
        return;
    }
    $.ajax({
        url: "/Order/SelectOrders",
        type: "POST",
        dataType: "html",
        data: { "orderStatu": orderStatu, "searchKey": searchKey, "page": page },
        success: function (data) {
            $("#order_list").html(data);
        },
        error: function () {
            alert("请求出错处理");
        }
    });
}
function to_next(){
    var page;
    var totle_page = parseInt($("#page_totle_count").val());
    var current_page = parseInt($("#current_page").val());
    var searchKey = $("#searchKey").val();
    var orderStatu = parseInt($("#order_title .actived").attr("id"));
    page = current_page + 1;
    if (page > totle_page) {
        return;
    }
    $.ajax({
        url: "/Order/SelectOrders",
        type: "POST",
        dataType: "html",
        data: { "orderStatu": orderStatu, "searchKey": searchKey, "page": page },
        success: function (data) {
            $("#order_list").html(data);
        },
        error: function () {
            alert("请求出错处理");
        }
    });
}
function to_last(){
    var page;
    var totle_page = parseInt($("#page_totle_count").val());
    if (totle_page == 0) {
        return;
    }
    var current_page = parseInt($("#current_page").val());
    var searchKey = $("#searchKey").val();
    var orderStatu = parseInt($("#order_title .actived").attr("id"));
    page = totle_page;
    $.ajax({
        url: "/Order/SelectOrders",
        type: "POST",
        dataType: "html",
        data: { "orderStatu": orderStatu, "searchKey": searchKey, "page": page },
        success: function (data) {
            $("#order_list").html(data);
        },
        error: function () {
            alert("请求出错处理");
        }
    });
}
function go_to() {
    var page;
    var totle_page = parseInt($("#page_totle_count").val());
    var searchKey = $("#searchKey").val();
    var current_page = parseInt($("#current_page").val());
    var orderStatu = parseInt($("#order_title .actived").attr("id"));
    var inputbox_page_number = parseInt($("#inputbox_page_number").val());
    page = inputbox_page_number;
    if (page >= 1 && page <= totle_page) {
        $.ajax({
            url: "/Order/SelectOrders",
            type: "POST",
            dataType: "html",
            data: { "orderStatu": orderStatu, "searchKey": searchKey, "page": page },
            success: function (data) {
                $("#order_list").html(data);
            },
            error: function () {
                alert("请求出错处理");
            }
        });
    } else {
        page = current_page;
        $.ajax({
            url: "/Order/SelectOrders",
            type: "POST",
            dataType: "html",
            data: { "orderStatu": orderStatu, "searchKey": searchKey, "page": page },
            success: function (data) {
                $("#order_list").html(data);
            },
            error: function () {
                alert("请求出错处理");
            }
        });
    }
}