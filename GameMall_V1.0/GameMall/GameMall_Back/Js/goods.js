function ChangeSell(id) {
    var versionId = id;
    $.ajax({
        url: "/Goods/ChangeSell",
        dataType: "html",
        data: { "versionId": versionId },
        success: function (data) {
            var a = document.getElementById(id);
            $(a).parent().html(data);
        },
        error: function () {
            alert("请求出错处理");
        }
    });
}
//删除商品
function delete_goods(id) {
    var goodsId = id;
    $.ajax({
        url: "/Goods/DeleteGoods",
        dataType: "html",
        data: { "goodsId": goodsId },
        success: function (data) {
            $("#tip_delect_goods").html(data);
        },
        error: function () {
            alert("请求出错处理");
        }
    });
};
//商品搜索
$(function () {
    $("#search").click(function () {
        var searchKey = $("#searchKey").val();
        $.ajax({
            url: "/Goods/SearchGoods",
            type: "POST",
            dataType: "html",
            data: { "searchKey": searchKey },
            success: function (data) {
                $("#list").html(data);
            },
            error: function () {
                alert("请求出错处理");
            }
        });
    });
});

//分页
function to_first() {
    var page;
    var searchKey = $("#searchKey").val();
    searchKey = searchKey;
    page = 1;
    $.ajax({
        url: "/Goods/SearchGoods",
        type: "POST",
        dataType: "html",
        data: { "searchKey": searchKey, "page": page },
        success: function (data) {
            $("#list").html(data);
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
        url: "/Goods/SearchGoods",
        type: "POST",
        dataType: "html",
        data: { "searchKey": searchKey, "page": page },
        success: function (data) {
            $("#list").html(data);
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
        url: "/Goods/SearchGoods",
        type: "POST",
        dataType: "html",
        data: { "searchKey": searchKey, "page": page },
        success: function (data) {
            $("#list").html(data);
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
        url: "/Goods/SearchGoods",
        type: "POST",
        dataType: "html",
        data: { "searchKey": searchKey, "page": page },
        success: function (data) {
            $("#list").html(data);
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
            url: "/Goods/SearchGoods",
            type: "POST",
            dataType: "html",
            data: { "searchKey": searchKey, "page": page },
            success: function (data) {
                $("#list").html(data);
            },
            error: function () {
                alert("请求出错处理");
            }
        });
    } else {
        page = current_page;
        $.ajax({
            url: "/Goods/SearchGoods",
            type: "POST",
            dataType: "html",
            data: { "searchKey": searchKey, "page": page },
            success: function (data) {
                $("#list").html(data);
            },
            error: function () {
                alert("请求出错处理");
            }
        });
    }
}

////分页
//$(function () {
//    var page;
//    var totle_page = parseInt($("#page_totle_count").val());
//    var current_page = parseInt($("#current_page").val());
//    var searchKey = $("#searchKey").val();
//    $("#to_first_page").click(function () {
//        searchKey = searchKey;
//        page = 1;
//        $.ajax({
//            url: "/Goods/SearchGoods",
//            type: "POST",
//            dataType: "html",
//            data: { "searchKey": searchKey, "page": page },
//            success: function (data) {
//                $("#list").html(data);
//            },
//            error: function () {
//                alert("请求出错处理");
//            }
//        });
//    });
//    $("#to_next_page").click(function () {
//        searchKey = searchKey;
//        page = current_page + 1;
//        if (page >= totle_page) {
//            page = totle_page;
//        }
//        $.ajax({
//            url: "/Goods/SearchGoods",
//            type: "POST",
//            dataType: "html",
//            data: { "searchKey": searchKey, "page": page },
//            success: function (data) {
//                $("#list").html(data);
//            },
//            error: function () {
//                alert("请求出错处理");
//            }
//        });
//    });
//    $("#to_pre_page").click(function () {
//        searchKey = searchKey;
//        page = current_page - 1;
//        if (page < 1) {
//            page = 1;
//        }
//        $.ajax({
//            url: "/Goods/SearchGoods",
//            type: "POST",
//            dataType: "html",
//            data: { "searchKey": searchKey, "page": page },
//            success: function (data) {
//                $("#list").html(data);
//            },
//            error: function () {
//                alert("请求出错处理");
//            }
//        });
//    });
//    $("#to_last_page").click(function () {
//        searchKey = searchKey;
//        page = totle_page;
//        $.ajax({
//            url: "/Goods/SearchGoods",
//            type: "POST",
//            dataType: "html",
//            data: { "searchKey": searchKey, "page": page },
//            success: function (data) {
//                $("#list").html(data);
//            },
//            error: function () {
//                alert("请求出错处理");
//            }
//        });
//    });
//    $("#go_to_page").click(function () {
//        searchKey = searchKey;
//        var inputbox_page_number = parseInt($("#inputbox_page_number").val());
//        page = inputbox_page_number;
//        if (page >= 1 && page <= totle_page) {
//            $.ajax({
//                url: "/Goods/SearchGoods",
//                type: "POST",
//                dataType: "html",
//                data: { "searchKey": searchKey, "page": page },
//                success: function (data) {
//                    $("#list").html(data);
//                },
//                error: function () {
//                    alert("请求出错处理");
//                }
//            });
//        } else {
//            page = current_page;
//            $.ajax({
//                url: "/Goods/SearchGoods",
//                type: "POST",
//                dataType: "html",
//                data: { "searchKey": searchKey, "page": page },
//                success: function (data) {
//                    $("#list").html(data);
//                },
//                error: function () {
//                    alert("请求出错处理");
//                }
//            });
//        }
//    });
//});