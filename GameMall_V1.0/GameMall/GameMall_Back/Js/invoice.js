//发货单搜索
$(function () {
    $("#search").click(function () {
        var searchKey = parseInt($("#searchKey").val());
        $.ajax({
            url: "/Order/SelectInvoice",
            dataType: "html",
            data: { "searchOrderId": searchKey },
            success: function (data) {
                $("#invoice_list").html(data);
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
    page = 1;
    $.ajax({
        url: "/Order/SelectInvoice",
        dataType: "html",
        data: { "searchOrderId": searchKey, "page": page },
        success: function (data) {
            $("#invoice_list").html(data);
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
        url: "/Order/SelectInvoice",
        dataType: "html",
        data: { "searchOrderId": searchKey, "page": page },
        success: function (data) {
            $("#invoice_list").html(data);
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
        url: "/Order/SelectInvoice",
        dataType: "html",
        data: { "searchOrderId": searchKey, "page": page },
        success: function (data) {
            $("#invoice_list").html(data);
        },
        error: function () {
            alert("请求出错处理");
        }
    });
}
function to_last() {
    var page;
    var totle_page = parseInt($("#page_totle_count").val());
    var searchKey = $("#searchKey").val();
    searchKey = searchKey;
    page = totle_page;
    if (totle_page == 0) {
        return;
    }
    $.ajax({
        url: "/Order/SelectInvoice",
        dataType: "html",
        data: { "searchOrderId": searchKey, "page": page },
        success: function (data) {
            $("#invoice_list").html(data);
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
            url: "/Order/SelectInvoice",
            dataType: "html",
            data: { "searchOrderId": searchKey, "page": page },
            success: function (data) {
                $("#invoice_list").html(data);
            },
            error: function () {
                alert("请求出错处理");
            }
        });
    } else {
        page = current_page;
        $.ajax({
            url: "/Order/SelectInvoice",
            dataType: "html",
            data: { "searchOrderId": searchKey, "page": page },
            success: function (data) {
                $("#invoice_list").html(data);
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
//    var searchKey = parseInt($("#searchKey").val());
//    $("#to_first_page").click(function () {
//        searchKey = searchKey;
//        page = 1;
//        $.ajax({
//            url: "/Order/SelectInvoice",
//            dataType: "html",
//            data: { "searchOrderId": searchKey, "page": page },
//            success: function (data) {
//                $("#invoice_list").html(data);
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
//            url: "/Order/SelectInvoice",
//            dataType: "html",
//            data: { "searchOrderId": searchKey, "page": page },
//            success: function (data) {
//                $("#invoice_list").html(data);
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
//            url: "/Order/SelectInvoice",
//            dataType: "html",
//            data: { "searchOrderId": searchKey, "page": page },
//            success: function (data) {
//                $("#invoice_list").html(data);
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
//            url: "/Order/SelectInvoice",
//            dataType: "html",
//            data: { "searchOrderId": searchKey, "page": page },
//            success: function (data) {
//                $("#invoice_list").html(data);
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
//                url: "/Order/SelectInvoice",
//                dataType: "html",
//                data: { "searchOrderId": searchKey, "page": page },
//                success: function (data) {
//                    $("#invoice_list").html(data);
//                },
//                error: function () {
//                    alert("请求出错处理");
//                }
//            });
//        } else {
//            page = current_page;
//            $.ajax({
//                url: "/Order/SelectInvoice",
//                dataType: "html",
//                data: { "searchOrderId": searchKey, "page": page },
//                success: function (data) {
//                    $("#invoice_list").html(data);
//                },
//                error: function () {
//                    alert("请求出错处理");
//                }
//            });
//        }
//    });
//});